local function getCreaturesFromArea(fromPos, toPos,checkFunction)
    local rarr = {};
    checkFunction = checkFunction or function(arg) return true; end;
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(checkFunction(tmp))then
                    table.insert(rarr, tmp);
                end
            end
        end
    end
    local tmp = getTopCreature({x=175,y=194,z=8, stackpos = 1}).uid;
    if(checkFunction(tmp))then
        table.insert(rarr, tmp);
    end
    return rarr;
end

local function boss_ferum1(cid)
	doCreateMonster("Enthralled Demon", {x=162,y=170,z=8}, false, true);
	doCreateMonster("Enthralled Demon", {x=172,y=170,z=8}, false, true);
	doCreateMonster("Enthralled Demon", {x=161,y=176,z=8}, false, true);
	doCreateMonster("Enthralled Demon", {x=170,y=173,z=8}, false, true);
end

local function boss_ferum2(cid)
	doCreateMonster("Rift Invader", {x=162,y=171,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=169,y=170,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=175,y=176,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=158,y=180,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=172,y=183,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=157,y=185,z=8}, false, true);
end

local function boss_ferum3(cid)
	doCreateMonster("Rift Invader", {x=162,y=183,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=170,y=186,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=175,y=180,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=164,y=180,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=158,y=175,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=165,y=170,z=8}, false, true);
end

local function boss_ferum4(cid)
	doCreateMonster("Rift Invader", {x=161,y=175,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=169,y=171,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=172,y=176,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=170,y=185,z=8}, false, true);
end

local function boss_ferum5(cid)
	for i = 1, 40 do
		local pos_fire = {{x=152,y=169,z=8},{x=176,y=186,z=8}}
		local pos1 = doCreateItem(12852, 1, {x=math.random(pos_fire[1].x, pos_fire[2].x), y=math.random(pos_fire[1].y,pos_fire[2].y), z=pos_fire[1].z})
		if pos1 then
			doDecayItem(pos1)
		end
	end
end

local function boss_ferum6(cid)
	doCreateMonster("Rift Invader", {x=155,y=178,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=159,y=185,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=167,y=184,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=174,y=187,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=174,y=179,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=164,y=177,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=172,y=170,z=8}, false, true);
	doCreateMonster("Rift Invader", {x=161,y=171,z=8}, false, true);
end

local function boss_ferum7(cid)
	local monsters = getCreaturesFromArea({x=151,y=167,z=8},{x=178,y=198,z=8},isMonster);
    while(#monsters > 0)do
        for _,m in pairs(monsters)do
            doRemoveCreature(m);
        end
        monsters = getCreaturesFromArea({x=151,y=167,z=8},{x=178,y=198,z=8},isMonster);
    end
	
	doBroadcastMessage("[World Boss] Algo aconteceu. O Ascending Ferumbras desapareceu mas não foi derrotado.")
end

local function boss_ferum_aviso1(cid)
	doBroadcastMessage("[World Boss] Ascending Ferumbras começa a canalizar um poder destruidor para a área! CORRE!!")
end

local function boss_ferum_aviso2(n)
	if n < 40 then
		for i = 1, n do
			local posit = {{x=152,y=169,z=8},{x=176,y=186,z=8}}
			local pos = {x=math.random(posit[1].x, posit[2].x), y=math.random(posit[1].y,posit[2].y), z=posit[1].z}
			local m = getTopCreature(pos).uid
			doSendDistanceShoot({x = pos.x - math.random(4, 6), y = pos.y - 5, z = pos.z}, pos, CONST_ANI_FIRE)
			addEvent(doSendMagicEffect, 150, pos, CONST_ME_FIREAREA)
			if m ~= 0 and isPlayer(m) then
				doCreatureSay(m, "Ooooh!", TALKTYPE_ORANGE_1)
				doAreaCombatHealth(cid,COMBAT_FIREDAMAGE,getCreaturePosition(m), pos, -400, -1200, CONST_ME_HITBYFIRE)
			end
		end
	
		local x = 1500-(200*n)
		addEvent(boss_ferum_aviso2, x <= 0 and 500 or x, n+1)
	end
end

local function boss_ferum_aviso3(cid)
	doBroadcastMessage("[World Boss] Ascending Ferumbras regenerou sua vida totalmente e está muito mais poderoso. Porém, ele está vulnerável. Acabe com ele!")
	doCreateMonster("Corrupted Ascending Ferumbras", {x=167,y=173,z=8}, false, true);
end

function onStatsChange(cid, attacker, type, combat, value)
    if not isPlayer(attacker) then
        return true
    end

	local pos_msg = getCreaturePosition(cid)
	if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == "Ascending Ferumbras") then
		local lifePercent = math.floor((getCreatureHealth(cid) / getCreatureMaxHealth(cid)) * 100)
		if getGlobalStorageValue(cid, 30074) <= 0 then
			if (lifePercent <= 90) and (lifePercent > 80) then
				setGlobalStorageValue(cid, 30074, 1)
				doCreatureSay(cid, "NOT KILL MY DEMONS!", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				doBroadcastMessage("[World Boss] Os Guardas do Ascending Ferumbras surgiram.")
				addEvent(boss_ferum1, 1*1000, 0, true)
			end
		
		elseif getGlobalStorageValue(cid, 30074) == 1 then
			if (lifePercent <= 80) and (lifePercent > 70) then
				setGlobalStorageValue(cid, 30074, 2)
				doCreatureSay(cid, "RIFT INVADERS NOW!!", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				doBroadcastMessage("[World Boss] Aparentemente o Ascending Ferumbras está invocando espiritos.")
				addEvent(boss_ferum2, 1*1000, 0, true)
			end
			
		elseif getGlobalStorageValue(cid, 30074) == 2 then
			if (lifePercent <= 70) and (lifePercent > 60) then
				setGlobalStorageValue(cid, 30074, 3)
				doCreatureSay(cid, "YOU FOOLS!!!", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				doBroadcastMessage("[World Boss] Ascending Ferumbras continua invocando espiritos.")
				addEvent(boss_ferum3, 1*1000, 0, true)
			end
			
		elseif getGlobalStorageValue(cid, 30074) == 3 then
			if (lifePercent <= 60) and (lifePercent > 50) then
				setGlobalStorageValue(cid, 30074, 4)
				doCreatureSay(cid, "RIFT INVADERS KILL ALL!", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				doBroadcastMessage("[World Boss] Ascending Ferumbras parece ter enfraquecido e seus espiritos diminuíram.")
				addEvent(boss_ferum4, 1*1000, 0, true)
			end
			
		elseif getGlobalStorageValue(cid, 30074) == 4 then
			if (lifePercent <= 50) and (lifePercent > 30) then
				setGlobalStorageValue(cid, 30074, 5)
				doCreatureSay(cid, "MUHA HA HA HA HA HA HA.", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				doBroadcastMessage("[World Boss] Ascending Ferumbras está enfurecido. Várias ashes surgiram no mapa! Todos os jogadores tem 5 segundos para sair de cima antes que virem searing fire ou será o FIM.")
				addEvent(boss_ferum5, 1*1000, 0, true)
			end
			
		elseif getGlobalStorageValue(cid, 30074) == 5 then
			if (lifePercent <= 30) and (lifePercent > 10) then
				setGlobalStorageValue(cid, 30074, 6)
				doCreatureSay(cid, "RIFT INVADERS NOW!", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				doBroadcastMessage("[World Boss] Ascending Ferumbras fez surgir muitos espiritos. Tenham cuidado!")
				addEvent(boss_ferum6, 1*1000, 0, true)
			end
			
		elseif getGlobalStorageValue(cid, 30074) == 6 then
			if (lifePercent <= 10) and (lifePercent > 0) then
				setGlobalStorageValue(cid, 30074, 7)
				doCreatureSay(cid, "I WILL NOT BE DEFEATED!", TALKTYPE_ORANGE_1, false, 0, pos_msg)
				addEvent(boss_ferum7, 1*1000, 0, true)
				addEvent(boss_ferum_aviso1, 9*1000, 0, true)
				addEvent(boss_ferum_aviso2, 12*1000, 0, true)
				addEvent(boss_ferum_aviso3, 45*1000, 0, true)
			end
		end
	end
    return true
end