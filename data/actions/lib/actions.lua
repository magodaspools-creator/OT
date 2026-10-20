SPOTS = { 384, 418, 8278, 8592 }
ROPABLE = { 294, 369, 370, 383, 392, 408, 409, 427, 428, 430, 462, 469, 470, 482, 484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285,
	8284, 8281, 8280, 8279, 8277, 8276, 8323, 8380, 8567, 8585, 8596, 8595, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256, 8972, 9606, 9625 }

HOLES = { 468, 481, 483, 7932, 8579 }
SAND = { 231, 9059 }

JUNGLE_GRASS = { 2782, 3985 }
SPIDER_WEB = { 7538, 7539 }
BAMBOO_FENCE = { 3798, 3799 }
WILD_GROWTH = { 1499, 11099 }

PUMPKIN = 2683
PUMPKIN_HEAD = 2096

POOL = 2016

SPECIAL_FOODS = {
	[9992] = "Gulp.", [9993] = "Chomp.", [9994] = "Chomp.", [9995] = "Chomp.", [9997] = "Yum.",
	[9998] = "Munch.", [9999] = "Chomp.", [10000] = "Mmmm.", [10001] = "Smack.", [12540] = "Yum.", 
	[12542] = "Gulp.", [12543] = "?", [12544] = "Slurp!"
}

DOORS = {
	[1209] = 1211, [1212] = 1214, [1231] = 1233, [1234] = 1236, [1249] = 1251, [1252] = 1254, [3535] = 3537, [3544] = 3546, [4913] = 4915, [4916] = 4918,
	[5098] = 5100, [5107] = 5109, [5116] = 5118, [5125] = 5127, [5134] = 5136, [5137] = 5139, [5140] = 5142, [5143] = 5145, [5278] = 5280, [5281] = 5283,
	[5732] = 5734, [5735] = 5737, [6192] = 6194, [6195] = 6197, [6249] = 6251, [6252] = 6254, [6891] = 6893, [6900] = 6902, [7033] = 7035, [7042] = 7044,
	[8541] = 8543, [8544] = 8546, [9165] = 9167, [9168] = 9170, [9267] = 9269, [9270] = 9272, [10268] = 10270, [10271] = 10273, [10468] = 10470,
	[10477] = 10479, [10775] = 10777, [10784] = 10786, [12092] = 12094, [12099] = 12101, [12188] = 12190, [12197] = 12199
}

STORAGE_SKILL_LEVEL_MINING = 10003
STORAGE_SKILL_TRY_MINING = 10004
config_mining = {
	levels = {
	{level = {0,19}, quant = {1,1}, percent = 5},
	{level = {10,19}, quant = {1,1}, percent = 6},
	{level = {20,59}, quant = {1,1}, percent = 7},
	{level = {60,89}, quant = {1,2}, percent = 8},
	{level = {90,99}, quant = {1,2}, percent = 9},
	{level = {100}, quant = {1,3}, percent = 10}
	},

	rocks = {12679}, -- Id das rochas que podem ser quebradas
	stones = {},  -- Modelo = {rock_id, rock_id}
	default_stone = 12681, -- pedra padrão
	bonus_chance = 5, -- Chance (em porcentagem) de se conseguir um bonus de exp
	bonus_exp = 2 -- Bonus extra (default: 1)
}

function getMiningLevel(cid)
	return getPlayerStorageValue(cid, STORAGE_SKILL_LEVEL_MINING)
end

function setPlayerMiningLevel(cid, n)
	setPlayerStorageValue(cid, STORAGE_SKILL_LEVEL_MINING, n)
end

function addMiningLevel(cid, n)
	setPlayerMiningLevel(cid, getMiningLevel(cid) + (isNumber(n) and n or 1))
	setMiningTry(cid, 0)
end

function getMiningInfo(cid)

	for i = 1, #config_mining.levels do
		min = config_mining.levels[i].level[1]; max = config_mining.levels[i].level[2]
		if (getMiningLevel(cid) >= min and getMiningLevel(cid) <= max) then
			return {quantity = {min = config_mining.levels[i].quant[1], max = config_mining.levels[i].quant[2]}, chance = config_mining.levels[i].percent}
		end
	end
end

function getStoneByRock(rockid)

	for i = 1, #config_mining.stones do
		if (config_mining.stones[2] == rockid) then
			return config_mining.stones[1]
		end
	end
	return config_mining.default_stone
end

function getMiningTries(cid)
	return getPlayerStorageValue(cid, STORAGE_SKILL_TRY_MINING)
end

function setMiningTry(cid, n)
	setPlayerStorageValue(cid, STORAGE_SKILL_TRY_MINING, n)
end

function addMiningTry(cid, bonus)

	setMiningTry(cid, getMiningTries(cid) + 1 + (bonus and config_mining.bonus_exp or 0))
	
	if (getMiningTries(cid) >= getMiningExpTo(getMiningLevel(cid))) then -- Up
		doPlayerSendTextMessage(cid, 22, "You advanced from level " .. getMiningLevel(cid) .. " to level ".. (getMiningLevel(cid) + 1) .." in mining.")
		if ((getMiningLevel(cid)+1) == getMiningMaxLevel()) then
			doPlayerSendTextMessage(cid, 22, "Max level reached in mining.")
		end

		addMiningLevel(cid)
		doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
		setMiningTry(cid, 0)
	end
end

function getMiningExpTo(level)
	return ((level*1.5)+((level+1)*7))
end

function getMiningMaxLevel()
	return config_mining.levels[#config_mining.levels].level[#config_mining.levels[#config_mining.levels].level]
end

function event_rockCut(rock)
	doTransformItem(rock.uid, 12680)
	doDecayItem(rock.uid)
	doSendMagicEffect(rock.position, 3)
	doSendAnimatedText(rock.position, "Tack!", COLOR_GREEN)
end

function destroyItem(cid, itemEx, toPosition)
	if(itemEx.uid <= 65535 or itemEx.actionid > 0) then
		return false
	end

	if(isInArray(SPIDER_WEB, itemEx.itemid)) then
		if math.random(3) == 1 then
			doTransformItem(itemEx.uid, (itemEx.itemid + 6))
			doDecayItem(itemEx.uid)
		end

		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return true
	end

	if(isInArray(BAMBOO_FENCE, itemEx.itemid)) then
		if math.random(3) == 1 then
			if(itemEx.itemid == BAMBOO_FENCE[1]) then
				doTransformItem(itemEx.uid, (itemEx.itemid + 161))
			elseif(itemEx.itemid == BAMBOO_FENCE[2]) then
				doTransformItem(itemEx.uid, (itemEx.itemid + 159))
			end
			doDecayItem(itemEx.uid)
		end

		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return true
	end

	if not(isInArray({1770, 2098, 1774, 1775, 2064, 2094, 2095, 1619, 2602, 3805, 3806}, itemEx.itemid) or
		(itemEx.itemid >= 1724 and itemEx.itemid <= 1741) or
		(itemEx.itemid >= 2581 and itemEx.itemid <= 2588) or
		(itemEx.itemid >= 1747 and itemEx.itemid <= 1753) or
		(itemEx.itemid >= 1714 and itemEx.itemid <= 1717) or
		(itemEx.itemid >= 1650 and itemEx.itemid <= 1653) or
		(itemEx.itemid >= 1666 and itemEx.itemid <= 1677) or
		(itemEx.itemid >= 1614 and itemEx.itemid <= 1616) or
		(itemEx.itemid >= 3813 and itemEx.itemid <= 3820) or
		(itemEx.itemid >= 3807 and itemEx.itemid <= 3810) or
		(itemEx.itemid >= 2080 and itemEx.itemid <= 2085) or
		(itemEx.itemid >= 2116 and itemEx.itemid <= 2119)) then
		return false
	end

	if(math.random(1, 7) == 1) then
		if(isInArray({1738, 1739, 1770, 2098, 1774, 1775, 2064}, itemEx.itemid) or
			(itemEx.itemid >= 2581 and itemEx.itemid <= 2588)) then
				doCreateItem(2250, 1, toPosition)
		elseif((itemEx.itemid >= 1747 and itemEx.itemid <= 1749) or itemEx.itemid == 1740) then
			doCreateItem(2251, 1, toPosition)
		elseif((itemEx.itemid >= 1714 and itemEx.itemid <= 1717)) then
			doCreateItem(2252, 1, toPosition)
		elseif((itemEx.itemid >= 1650 and itemEx.itemid <= 1653) or
			(itemEx.itemid >= 1666 and itemEx.itemid <= 1677) or
			(itemEx.itemid >= 1614 and itemEx.itemid <= 1616) or
			(itemEx.itemid >= 3813 and itemEx.itemid <= 3820) or
			(itemEx.itemid >= 3807 and itemEx.itemid <= 3810)) then
				doCreateItem(2253, 1, toPosition)
		elseif((itemEx.itemid >= 1724 and itemEx.itemid <= 1737) or
			(itemEx.itemid >= 2080 and itemEx.itemid <= 2085) or
			(itemEx.itemid >= 2116 and itemEx.itemid <= 2119) or
			isInArray({2094, 2095}, itemEx.itemid)) then
				doCreateItem(2254, 1, toPosition)
		elseif((itemEx.itemid >= 1750 and itemEx.itemid <= 1753) or isInArray({1619, 1741}, itemEx.itemid)) then
			doCreateItem(2255, 1, toPosition)
		elseif(itemEx.itemid == 2602) then
			doCreateItem(2257, 1, toPosition)
		elseif(itemEx.itemid == 3805 or itemEx.itemid == 3806) then
			doCreateItem(2259, 1, toPosition)
		end

		doRemoveItem(itemEx.uid, 1)
	end

	doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
end

TOOLS = {}
TOOLS.ROPE = function(cid, item, fromPosition, itemEx, toPosition)
	if(toPosition.x == CONTAINER_POSITION) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	toPosition.stackpos = STACKPOS_GROUND
	errors(false)
	local ground = getThingFromPos(toPosition)
	errors(true)
	if(isInArray(SPOTS, ground.itemid)) then
		doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, false)
		return true
	elseif(isInArray(ROPABLE, itemEx.itemid)) then
		local canOnlyRopePlayers = getBooleanFromString(getConfigValue('canOnlyRopePlayers'))
		local hole = getThingFromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
		if(canOnlyRopePlayers) then
			if(isPlayer(hole.uid) and (not isPlayerGhost(hole.uid) or getPlayerGhostAccess(cid) >= getPlayerGhostAccess(hole.uid))) then
				doTeleportThing(hole.uid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z}, false)
			else
				doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
			end
		else
			if(hole.itemid > 0) then
				doTeleportThing(hole.uid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z}, false)
			else
				doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
			end
		end

		return true
	end

	return false
end

TOOLS.PICK = function(cid, item, fromPosition, itemEx, toPosition)
local use_pick_stone = {
    {x = 113, y = 2046, z = 11, stackpos = 0},
    {x = 113, y = 2047, z = 11, stackpos = 0},
    {x = 113, y = 2048, z = 11, stackpos = 0},
    {x = 114, y = 2048, z = 11, stackpos = 0},
    {x = 114, y = 2047, z = 11, stackpos = 0},
    {x = 114, y = 2046, z = 11, stackpos = 0},
    {x = 115, y = 2047, z = 11, stackpos = 0},
    {x = 115, y = 2046, z = 11, stackpos = 0},
    {x = 115, y = 2045, z = 11, stackpos = 0},
    {x = 115, y = 2044, z = 11, stackpos = 0},
    {x = 115, y = 2043, z = 11, stackpos = 0},
    {x = 116, y = 2043, z = 11, stackpos = 0},
    {x = 116, y = 2044, z = 11, stackpos = 0},
    {x = 116, y = 2045, z = 11, stackpos = 0},
    {x = 116, y = 2046, z = 11, stackpos = 0},
    {x = 116, y = 2047, z = 11, stackpos = 0},
    {x = 117, y = 2048, z = 11, stackpos = 0},
    {x = 117, y = 2047, z = 11, stackpos = 0},
    {x = 117, y = 2046, z = 11, stackpos = 0},
    {x = 117, y = 2045, z = 11, stackpos = 0},
    {x = 117, y = 2044, z = 11, stackpos = 0},
    {x = 117, y = 2043, z = 11, stackpos = 0},
    {x = 117, y = 2042, z = 11, stackpos = 0},
    {x = 118, y = 2042, z = 11, stackpos = 0},
    {x = 118, y = 2043, z = 11, stackpos = 0},
    {x = 118, y = 2044, z = 11, stackpos = 0},
    {x = 118, y = 2045, z = 11, stackpos = 0},
    {x = 118, y = 2046, z = 11, stackpos = 0},
    {x = 118, y = 2047, z = 11, stackpos = 0},
    {x = 118, y = 2048, z = 11, stackpos = 0},
    {x = 119, y = 2047, z = 11, stackpos = 0},
    {x = 119, y = 2046, z = 11, stackpos = 0},
    {x = 119, y = 2045, z = 11, stackpos = 0},
    {x = 119, y = 2044, z = 11, stackpos = 0},
    {x = 119, y = 2043, z = 11, stackpos = 0},
    {x = 119, y = 2042, z = 11, stackpos = 0},
    {x = 120, y = 2042, z = 11, stackpos = 0},
    {x = 120, y = 2043, z = 11, stackpos = 0},
    {x = 120, y = 2044, z = 11, stackpos = 0},
    {x = 121, y = 2044, z = 11, stackpos = 0},
    {x = 121, y = 2043, z = 11, stackpos = 0},
    {x = 121, y = 2042, z = 11, stackpos = 0},
    {x = 122, y = 2042, z = 11, stackpos = 0},
    {x = 122, y = 2043, z = 11, stackpos = 0},
    {x = 122, y = 2044, z = 11, stackpos = 0}
}
 
    local effect_lava = {
    [1] = {pos = {113,2046,11}, effect = {67}},
    [2] = {pos = {113,2047,11}, effect = {67}},
    [3] = {pos = {113,2048,11}, effect = {67}},
    [4] = {pos = {114,2048,11}, effect = {67}},
    [5] = {pos = {114,2047,11}, effect = {67}},
    [6] = {pos = {114,2046,11}, effect = {67}},
    [7] = {pos = {115,2047,11}, effect = {67}},
    [8] = {pos = {115,2046,11}, effect = {67}},
    [9] = {pos = {115,2045,11}, effect = {67}},
    [10] = {pos = {115,2044,11}, effect = {67}},
    [11] = {pos = {115,2043,11}, effect = {67}},
    [12] = {pos = {116,2043,11}, effect = {67}},
    [13] = {pos = {116,2044,11}, effect = {67}},
    [14] = {pos = {116,2045,11}, effect = {67}},
    [15] = {pos = {116,2046,11}, effect = {67}},
    [16] = {pos = {116,2047,11}, effect = {67}},
    [17] = {pos = {117,2048,11}, effect = {67}},
    [18] = {pos = {117,2047,11}, effect = {67}},
    [19] = {pos = {117,2046,11}, effect = {67}},
    [20] = {pos = {117,2045,11}, effect = {67}},
    [21] = {pos = {117,2044,11}, effect = {67}},
    [22] = {pos = {117,2043,11}, effect = {67}},
    [23] = {pos = {117,2042,11}, effect = {67}},
    [24] = {pos = {118,2042,11}, effect = {67}},
    [25] = {pos = {118,2043,11}, effect = {67}},
    [26] = {pos = {118,2044,11}, effect = {67}},
    [27] = {pos = {118,2045,11}, effect = {67}},
    [28] = {pos = {118,2046,11}, effect = {67}},
    [29] = {pos = {118,2047,11}, effect = {67}},
    [30] = {pos = {118,2048,11}, effect = {67}},
    [31] = {pos = {119,2047,11}, effect = {67}},
    [32] = {pos = {119,2046,11}, effect = {67}},
    [33] = {pos = {119,2045,11}, effect = {67}},
    [34] = {pos = {119,2044,11}, effect = {67}},
    [35] = {pos = {119,2043,11}, effect = {67}},
    [36] = {pos = {119,2042,11}, effect = {67}},
    [37] = {pos = {120,2042,11}, effect = {67}},
    [38] = {pos = {120,2043,11}, effect = {67}},
    [39] = {pos = {120,2044,11}, effect = {67}},
    [40] = {pos = {121,2044,11}, effect = {67}},
    [41] = {pos = {121,2043,11}, effect = {67}},
    [42] = {pos = {121,2042,11}, effect = {67}},
    [43] = {pos = {122,2042,11}, effect = {67}},
    [44] = {pos = {122,2043,11}, effect = {67}},
    [45] = {pos = {122,2044,11}, effect = {67}}
    }

	if(itemEx.aid == 45118 and itemEx.itemid == 1304) then
        for i = 1, #use_pick_stone do
            doCreateItem(5815, 1, use_pick_stone[i])
        end
        doTransformItem(itemEx.uid, 2256)
        doSendMagicEffect(toPosition, CONST_ME_SMOKE)
		for _, area in pairs(effect_lava) do
			doSendMagicEffect({x=area.pos[1],y=area.pos[2],z=area.pos[3]},area.effect[1])
		end
		return true
    end
	
	if (itemEx.actionid == 777) and (itemEx.itemid == 355) then
		doTransformItem(itemEx.uid, 392)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return true
	end

	if(itemEx.itemid == 7200) then
		doTransformItem(itemEx.uid, 7236)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
		return true
	end

	if (itemEx.actionid == 42148) and (itemEx.itemid == 1304) then
		doRemoveItem(itemEx.uid)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		if isPlayer(cid) then
			doCreatureAddHealth(cid, -60)
			doCreatureSay(cid, 'You lose 60 hitpoints.', TALKTYPE_ORANGE_1)
		end
	end
	
	if (itemEx.itemid == 12679) then -- MINING
	local rock = { id = itemEx.itemid, uid = itemEx.uid, position = toPosition }
	local player_mining = { position = getCreaturePosition(cid) }
		
		if (getMiningLevel(cid) < 0) then
			setPlayerMiningLevel(cid, 0)
		end

		if (isInArray(config_mining.rocks, rock.id)) then
			addMiningTry(cid)

			if (math.random(1,100) <= getMiningInfo(cid).chance) then
				local collected = math.random(getMiningInfo(cid).quantity.min, getMiningInfo(cid).quantity.max)
				doPlayerAddItem(cid, getStoneByRock(rock.id), collected)
				doPlayerSendTextMessage(cid, 22, "You got " .. collected .. " concentrated red crystal" .. (collected > 1 and "s" or "") .. ".")
				
				if (math.random(1,100) <= config_mining.bonus_chance) then -- Bonus calc
					addMiningTry(cid, true)
					doSendAnimatedText(player_mining.position, "Bonus!", COLOR_ORANGE)
				end

				event_rockCut(rock)
			else
				if (math.random(1,100) <= (10-getMiningInfo(cid).chance/10)) then
					doPlayerSendTextMessage(cid, 22, "You got nothing.")
					event_rockCut(rock)
				else
					doSendMagicEffect(rock.position, 3)
					doSendAnimatedText(rock.position, "Poff!", COLOR_RED)
				end
			end
		else
			doPlayerSendCancel(cid, "This can't be cut.")
		end
		return true
	end
	
	if (itemEx.itemid == 12680) then -- MINING WAIT
		return doPlayerSendCancel(cid, "Wait for the red crystal to come back with its power.")
	end
	
	return false
end

TOOLS.MACHETE = function(cid, item, fromPosition, itemEx, toPosition, destroy)
	local rand_jungle = math.random(1, 10)
	if(itemEx.actionid == 42259) and (itemEx.itemid == 2782) and (getPlayerStorageValue(cid, 42259) == 1) then
		if (rand_jungle < 2) then
			doTransformItem(itemEx.uid, itemEx.itemid - 1)
			setPlayerStorageValue(cid, 42258, 2)
			setPlayerStorageValue(cid, 42259, 0)
			doCreatureSay(cid, 'You advanced in lawn mowing.', TALKTYPE_ORANGE_1)
			doDecayItem(itemEx.uid)
		else
			doPlayerSendCancel(cid, "try again.")
			doTransformItem(itemEx.uid, itemEx.itemid - 1)
			doDecayItem(itemEx.uid)
		end
		return true
	end
	
	if(isInArray(JUNGLE_GRASS, itemEx.itemid)) then
		doTransformItem(itemEx.uid, itemEx.itemid - 1)
		doDecayItem(itemEx.uid)
		return true
	end

	if(isInArray(SPIDER_WEB, itemEx.itemid)) then
		if math.random(3) == 1 then
			doTransformItem(itemEx.uid, (itemEx.itemid + 6))
			doDecayItem(itemEx.uid)
		end
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return true
	end

	if(isInArray(BAMBOO_FENCE, itemEx.itemid)) then
		if math.random(3) == 1 then
			if(itemEx.itemid == BAMBOO_FENCE[1]) then
				doTransformItem(itemEx.uid, (itemEx.itemid + 161))
			elseif(itemEx.itemid == BAMBOO_FENCE[2]) then
				doTransformItem(itemEx.uid, (itemEx.itemid + 159))
			end
			doDecayItem(itemEx.uid)
		end
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return true
	end

	if(isInArray(WILD_GROWTH, itemEx.itemid)) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doRemoveItem(itemEx.uid)
		return true
	end

	return destroy and destroyItem(cid, itemEx, toPosition) or false
end

TOOLS.SHOVEL = function(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 778) and (itemEx.itemid == 231) then
		doTransformItem(itemEx.uid, 5731)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return true
	end
	
	if(itemEx.actionid == 42255) and (itemEx.itemid == 103) then
		if getPlayerStorageValue(cid, 42254) == 1 then
			local osso = doCreateItemEx(2248, 1)
			local key = doTileAddItemEx(toPosition, osso)
				doItemSetAttribute(osso, "aid", 42256)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
		return true
	end
	
	if(isInArray(HOLES, itemEx.itemid)) then
		local newId = itemEx.itemid + 1
		if(itemEx.itemid == 8579) then
			newId = 8585
		end
	
		doTransformItem(itemEx.uid, newId)
		doDecayItem(itemEx.uid)
		
	elseif(isInArray(SAND, itemEx.itemid)) then
		local rand = math.random(1, 100)
		local ground = getThingFromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_GROUND})
		if(isInArray(SPOTS, ground.itemid) and rand <= 20) then
			doTransformItem(itemEx.uid, 489)
			doDecayItem(itemEx.uid)
		elseif(rand >= 1 and rand <= 3) then
			doCreateItem(2159, 1, toPosition)
		elseif(rand > 90) then
			doCreateMonster("Scarab", toPosition, false)
		end

		doSendMagicEffect(toPosition, CONST_ME_POFF)
	end
	
	if (itemEx.actionid == 42086) and (itemEx.itemid == 385) then
		if getPlayerStorageValue(cid, 42086) < 1 then
		local key = doCreateItemEx(2088, 1)
			doItemSetAttribute(key, "aid", 3610)
			
			if(doPlayerAddItemEx(cid, key, false) == RETURNVALUE_NOERROR) then
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a key.")
				setPlayerStorageValue(cid, 42086, 1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, getPlayerFreeCap(cid) < getItemWeight(key) and "You have found a key. Weighing " .. getItemWeight(key) .. " oz it is too heavy." or "You have found a key, but you have no room to take it.")
			end
		else
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The small hole is empty.")
		end
		return true
	end
	
	return true
end

TOOLS.SCYTHE = function(cid, item, fromPosition, itemEx, toPosition, destroy)
	if(itemEx.itemid == 2739) then
		doTransformItem(itemEx.uid, 2737)
		doCreateItem(2694, 1, toPosition)

		doDecayItem(itemEx.uid)
		return true
	end

	return destroy and destroyItem(cid, itemEx, toPosition) or false
end

TOOLS.KNIFE = function(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid ~= PUMPKIN) then
		return false
	end

	doTransformItem(itemEx.uid, PUMPKIN_HEAD)
	return true
end
