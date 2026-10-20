local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end
	
	-- Abrir Death Channel
	doPlayerOpenChannel(cid, 15)
	
	-- CHECK CAST and PASSWORD ON-OFF
	if getPlayerStorageValue(cid, 45503) > 0 then
        setPlayerStorageValue(cid, 45503, 0) 
    end

	if getPlayerStorageValue(cid, 45504) > 0 then
        setPlayerStorageValue(cid, 45504, 0) 
    end

	-- CHECK Helmet of The Deep (evitar BUG de +300 speed)
	local slotItem = getPlayerSlotItem(cid, CONST_SLOT_HEAD)
	if(slotItem.uid ~= 0 and slotItem.itemid == 12541) then
		doTransformItem(slotItem.uid, 5461)
	end
	
	-- CHECK DEMON OAK
	local tp_oak_exit = {x = 825, y = 2128, z = 7}
	if getPlayerStorageValue(cid, 45299) >= 1 then
		setPlayerStorageValue(cid, 45299, 0)
		doTeleportThing(cid, tp_oak_exit)
		doPlayerSendTextMessage(cid, 27, "Você saiu da Demon Oak!")
	end
	if getPlayerStorageValue(cid, DOAK_STORAGE.ARVORE) > 0 and getPlayerStorageValue(cid, DOAK_STORAGE.FINALIZACAO) < 1 then
		doPlayerSetStorageValue(cid, DOAK_STORAGE.ARVORE, 0)
	end
	
	-- FREE BLESS (max: lvl 99)
	if(getPlayerLevel(cid) <= 99 and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		
		doPlayerSendTextMessage(cid, 27, "Você recebeu 'All Blessings'. Você receberá 'Free All Blessings' até level 99.")
	elseif(getPlayerBlessing(cid,1)) then
		doPlayerSendTextMessage(cid, 27, "Você já possui Bless!")
	else
		doPlayerSendTextMessage(cid, 27, "Você está sem bless. Digite !bless para comprar e não perder XP/Skills/Itens.")
	end
	
	-- SnowBall CHECK (evitar BUG)
	if getPlayerStorageValue(cid, SBW_INEVENT) > 0 then
		doPlayerSetStorageValue(cid, SBW_INEVENT, 0)
		doPlayerSetStorageValue(cid, SBW_SCORE, 0)
		doPlayerSetStorageValue(cid, SBW_AMMO, 0)
		doPlayerSetStorageValue(cid, SBW_EXAUSTHED, 1)
	end
	
	-- MINING ANTI-BURLAR MC
	if getPlayerStorageValue(cid, 45393) >= 1 then
        setPlayerStorageValue(cid, 45393, 0)
		doTeleportThing(cid, {x = 2052, y = 2051, z = 7})
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Mining] Não pode deslogar dentro da mineração. Você foi teleportado(a) para o Templo!")
    end
	
	-- Event Coin (aviso tempo)
	if getPlayerStorageValue(cid, 29997) - os.time() > 0 then        
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Event Coin] Você ainda tem ".. convertTime(getPlayerStorageValue(cid, 29997) - os.time()) .." para acessar as Hunts.")
	end
	
	-- DEBUG DODGE SYSTEM
	if getPlayerStorageValue(cid, 45820) == -1 then
        setPlayerStorageValue(cid, 45820, 0) 
    end
	
	-- DEBUG CRITICAL SYSTEM
	if getPlayerStorageValue(cid, 45821) == -1 then
        setPlayerStorageValue(cid, 45821, 0) 
    end
	
	-- DEBUG DUELO PVP
	if getPlayerStorageValue(cid, 45469) == -1 then
        setPlayerStorageValue(cid, 45469, 0)
    end
	
	-- Animation VIP menssage
	local function sendVipMessage(cid)
		if isPlayer(cid) and isPremium(cid) == true then
			doSendAnimatedText(getThingPos(cid),"VIP", 698)
			addEvent(sendVipMessage,8000,cid)
		end
	end
	
	-- Check Premium (VIP)
	local tp_temple = getTownTemplePosition(getPlayerTown(cid))
	local daysleft = os.time() + getPlayerPremiumDays(cid) * 24* 60* 60
	local rates = getPlayerRates(cid) 
	if isPremium(cid) == false and getPlayerStorageValue(cid, 29998) <= 0 then
		doPlayerSendTextMessage(cid, 27,"Você é FREE! Adquira VIP e receba 20% a mais de XP.")
	elseif isPremium(cid) == true and getPlayerStorageValue(cid, 29998) <= 0 then
        setPlayerStorageValue(cid, 29998, 1)
		doPlayerSendTextMessage(cid, 27,"Você é VIP! Ela expira em: ".. (os.date("%d/%m/%Y", daysleft)) .."")
		doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]+0.2)
		addEvent(sendVipMessage,1000,cid)
	elseif isPremium(cid) == true and getPlayerStorageValue(cid, 29998) == 1 then
		doPlayerSendTextMessage(cid, 27,"Você é VIP! Ela expira em: ".. (os.date("%d/%m/%Y", daysleft)) .."")
		doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]+0.2)
		addEvent(sendVipMessage,1000,cid)
    elseif isPremium(cid) == false and getPlayerStorageValue(cid, 29998) == 1 then
        setPlayerStorageValue(cid, 29998, -1)
        doTeleportThing(cid, tp_temple) 
		doPlayerSendTextMessage(cid, 27,"Sua VIP acabou! Você foi teleportado de volta para área FREE.")
		if getCreatureStorage(cid, 25952) ~= 0 then -- AURA CHECK PARA SETAR AURA FREE QUANDO ACABAR VIP
			doCreatureSetStorage(cid, 25952, 0)
		end
    end
	
	if getPlayerStorageValue(cid, 42226) == 1 then -- ANNIHILATOR
        setPlayerStorageValue(cid, 42226, -1)
    end
	
	if getPlayerStorageValue(cid, 45002) <= 0 then -- Auto Loot Money
        setPlayerStorageValue(cid, 45002, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"[Auto Loot] Gold Colleting Activated. Para mais informações digite: !autoloot ou !money")
    end
	
	if (getPlayerStorageValue(cid, 25950) == 1) then -- AURA
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você possui uma Aura.")
		--setPlayerStorageValue(cid, 25950, 2)
		efeitosAura(1,25000/8,cid)
	end
	
	-- ADDONS SITE
	-- Citizen
	if getPlayerStorageValue(cid, 20052) <= 0 then
		if getPlayerStorageValue(cid, 20000) > 0 and getPlayerStorageValue(cid, 20001) > 0 then
			setPlayerStorageValue(cid, 20052, 1)
		end
	end
	-- Hunter
	if getPlayerStorageValue(cid, 20053) <= 0 then
		if getPlayerStorageValue(cid, 20002) > 0 and getPlayerStorageValue(cid, 20003) > 0 then
			setPlayerStorageValue(cid, 20053, 1)
		end
	end
	-- Knight
	if getPlayerStorageValue(cid, 20054) <= 0 then
		if getPlayerStorageValue(cid, 20004) > 0 and getPlayerStorageValue(cid, 20005) > 0 then
			setPlayerStorageValue(cid, 20054, 1)
		end
	end
	-- Mage
	if getPlayerStorageValue(cid, 20055) <= 0 then
		if getPlayerStorageValue(cid, 20006) > 0 and getPlayerStorageValue(cid, 20007) > 0 then
			setPlayerStorageValue(cid, 20055, 1)
		end
	end
	-- Barbarian
	if getPlayerStorageValue(cid, 20056) <= 0 then
		if getPlayerStorageValue(cid, 20008) > 0 and getPlayerStorageValue(cid, 20009) > 0 then
			setPlayerStorageValue(cid, 20056, 1)
		end
	end
	-- Druid
	if getPlayerStorageValue(cid, 20057) <= 0 then
		if getPlayerStorageValue(cid, 20010) > 0 and getPlayerStorageValue(cid, 20011) > 0 then
			setPlayerStorageValue(cid, 20057, 1)
		end
	end
	-- Nobleman
	if getPlayerStorageValue(cid, 20058) <= 0 then
		if getPlayerStorageValue(cid, 20012) > 0 and getPlayerStorageValue(cid, 20013) > 0 then
			setPlayerStorageValue(cid, 20058, 1)
		end
	end
	-- Oriental
	if getPlayerStorageValue(cid, 20059) <= 0 then
		if getPlayerStorageValue(cid, 20014) > 0 and getPlayerStorageValue(cid, 20015) > 0 then
			setPlayerStorageValue(cid, 20059, 1)
		end
	end
	-- Summoner
	if getPlayerStorageValue(cid, 20060) <= 0 then
		if getPlayerStorageValue(cid, 20016) > 0 and getPlayerStorageValue(cid, 20017) > 0 then
			setPlayerStorageValue(cid, 20060, 1)
		end
	end
	-- Warrior
	if getPlayerStorageValue(cid, 20061) <= 0 then
		if getPlayerStorageValue(cid, 20018) > 0 and getPlayerStorageValue(cid, 20019) > 0 then
			setPlayerStorageValue(cid, 20061, 1)
		end
	end
	-- Wizard
	if getPlayerStorageValue(cid, 20062) <= 0 then
		if getPlayerStorageValue(cid, 20020) > 0 and getPlayerStorageValue(cid, 20021) > 0 then
			setPlayerStorageValue(cid, 20062, 1)
		end
	end
	-- Demon Hunter
	if getPlayerStorageValue(cid, 20063) <= 0 then
		if getPlayerStorageValue(cid, 20022) > 0 and getPlayerStorageValue(cid, 20023) > 0 then
			setPlayerStorageValue(cid, 20063, 1)
		end
	end
	-- Wayfarer
	if getPlayerStorageValue(cid, 20064) <= 0 then
		if getPlayerStorageValue(cid, 20024) > 0 and getPlayerStorageValue(cid, 20025) > 0 then
			setPlayerStorageValue(cid, 20064, 1)
		end
	end
	-- WarMaster
	if getPlayerStorageValue(cid, 20065) <= 0 then
		if getPlayerStorageValue(cid, 20027) > 0 and getPlayerStorageValue(cid, 20028) > 0 then
			setPlayerStorageValue(cid, 20065, 1)
		end
	end
	-- Assassin
	if getPlayerStorageValue(cid, 20066) <= 0 then
		if getPlayerStorageValue(cid, 20030) > 0 and getPlayerStorageValue(cid, 20031) > 0 then
			setPlayerStorageValue(cid, 20066, 1)
		end
	end
	-- Beggar
	if getPlayerStorageValue(cid, 20067) <= 0 then
		if getPlayerStorageValue(cid, 20033) > 0 and getPlayerStorageValue(cid, 20034) > 0 then
			setPlayerStorageValue(cid, 20067, 1)
		end
	end
	-- Jester
	if getPlayerStorageValue(cid, 20068) <= 0 then
		if getPlayerStorageValue(cid, 20036) > 0 and getPlayerStorageValue(cid, 20037) > 0 then
			setPlayerStorageValue(cid, 20068, 1)
		end
	end
	-- Shaman
	if getPlayerStorageValue(cid, 20069) <= 0 then
		if getPlayerStorageValue(cid, 20038) > 0 and getPlayerStorageValue(cid, 20039) > 0 then
			setPlayerStorageValue(cid, 20069, 1)
		end
	end
	-- Norseman
	if getPlayerStorageValue(cid, 20070) <= 0 then
		if getPlayerStorageValue(cid, 20040) > 0 and getPlayerStorageValue(cid, 20041) > 0 then
			setPlayerStorageValue(cid, 20070, 1)
		end
	end
	-- Pirate
	if getPlayerStorageValue(cid, 20071) <= 0 then
		if getPlayerStorageValue(cid, 20042) > 0 and getPlayerStorageValue(cid, 20043) > 0 then
			setPlayerStorageValue(cid, 20071, 1)
		end
	end
	-- Nightmare
	if getPlayerStorageValue(cid, 20072) <= 0 then
		if getPlayerStorageValue(cid, 20045) > 0 and getPlayerStorageValue(cid, 20046) > 0 then
			setPlayerStorageValue(cid, 20072, 1)
		end
	end
	-- Brotherhood
	if getPlayerStorageValue(cid, 20073) <= 0 then
		if getPlayerStorageValue(cid, 20048) > 0 and getPlayerStorageValue(cid, 20049) > 0 then
			setPlayerStorageValue(cid, 20073, 1)
		end
	end
	-- Yalaharian
	if getPlayerStorageValue(cid, 20074) <= 0 then
		if getPlayerStorageValue(cid, 45259) > 0 then
			setPlayerStorageValue(cid, 20074, 1)
		end
	end

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil and getPlayerStorageValue(cid, "bless") ~= 5) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	if(getPlayerStorageValue(cid, "death_bless") == 1) then
		local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_ITEMS, PLAYERLOSS_CONTAINERS}
		for i = 1, #t do
			doPlayerSetLossPercent(cid, t[i], 100)
		end
		setPlayerStorageValue(cid, "death_bless", 0)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "FirstItems")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "PlayerArena")
    registerCreatureEvent(cid, "ArenaKill")
	registerCreatureEvent(cid, "mapMark")
	
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "recordIp")
	registerCreatureEvent(cid, "partyAndGuildProtection")
	
	registerCreatureEvent(cid, "Task")
	registerCreatureEvent(cid, "Bloodtusk")
	registerCreatureEvent(cid, "Esmeralda")
	registerCreatureEvent(cid, "Hide")
	registerCreatureEvent(cid, "Leviathan")
	registerCreatureEvent(cid, "Shardhead")
	registerCreatureEvent(cid, "Stonecracker")
	registerCreatureEvent(cid, "TheMany")
	registerCreatureEvent(cid, "TheNoxiousSpawn")
	registerCreatureEvent(cid, "TheOldWidow")
	registerCreatureEvent(cid, "TheSnapper")
	registerCreatureEvent(cid, "Thul")
	registerCreatureEvent(cid, "TiquandasRevenge")
	registerCreatureEvent(cid, "Demodras")
	registerCreatureEvent(cid, "Pirates")
	registerCreatureEvent(cid, "Necropharus")
	registerCreatureEvent(cid, "HornedFox")
	
	registerCreatureEvent(cid, "DemonOakDeath")
	registerCreatureEvent(cid, "DemonOakAttack")
	registerCreatureEvent(cid, "DemonOakLogout")

	registerCreatureEvent(cid, "Inquisition")
	registerCreatureEvent(cid, "KillBela")
	registerCreatureEvent(cid, "BlessedQuest")
	registerCreatureEvent(cid, "BossFirewalker")
	registerCreatureEvent(cid, "Wote1")
	registerCreatureEvent(cid, "Devovorga")
	registerCreatureEvent(cid, "MasterElemental")
	registerCreatureEvent(cid, "ClassicWeaponQuest")
	registerCreatureEvent(cid, "CWFinalBoss")
	registerCreatureEvent(cid, "RecompensaLevel")
	registerCreatureEvent(cid, "RecompensaMoney")
	registerCreatureEvent(cid, "NewgatePromotionKill")
	registerCreatureEvent(cid, "BossPromotion")
	registerCreatureEvent(cid, "Cave_Exc_login")
	registerCreatureEvent(cid, "Cave_Exc_death")
	registerCreatureEvent(cid, "bc_protect_login")
	registerCreatureEvent(cid, "bc_protect_death")
	registerCreatureEvent(cid, "WoeHunt_login")
	registerCreatureEvent(cid, "WoeHunt_death")
	registerCreatureEvent(cid, "WorldBoss_login")
	registerCreatureEvent(cid, "WorldBoss_death")
	registerCreatureEvent(cid, "deathchannel")
	registerCreatureEvent(cid, "Anti Entrosa Login")
	registerCreatureEvent(cid, "Anti Entrosa Logout")
	
	registerCreatureEvent(cid, "Dodge")
	registerCreatureEvent(cid, "Critical")
	
	registerCreatureEvent(cid, "arenaLook")
	registerCreatureEvent(cid, "cookingLook")
	registerCreatureEvent(cid, "AsceFerumbras")
	registerCreatureEvent(cid, "KillBossEnDemon")
	registerCreatureEvent(cid, "KillFerum")
	registerCreatureEvent(cid, "KillWote")
	registerCreatureEvent(cid, "RewardChest")
	registerCreatureEvent(cid, "BcGate")
	registerCreatureEvent(cid, "BcArchangel")
	registerCreatureEvent(cid, "BossClassicHelmet1")
	registerCreatureEvent(cid, "BossClassicHelmet2")
	registerCreatureEvent(cid, "BossClassicHelmet3")
	registerCreatureEvent(cid, "BossClassicHelmet4")
	registerCreatureEvent(cid, "PoisonAncient")
	registerCreatureEvent(cid, "Imhotep")
	registerCreatureEvent(cid, "BossClassicHelmetFinal")
	registerCreatureEvent(cid, "BossMercenary")
	registerCreatureEvent(cid, "BossAura")
	registerCreatureEvent(cid, "PlayerTrade")

	doCreatureSetStorage(cid, "save", (os.time() + 120))
	return true
end
