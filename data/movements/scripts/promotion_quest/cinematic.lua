local check_area = {from = {x = 1683, y = 1895, z = 7}, to = {x = 1683, y = 1895, z = 7}}
local monster_area = {from = {x = 1683, y = 1893, z = 7}, to = {x = 1683, y = 1893, z = 7}}
local config = {
	pos = {x = 1683, y = 1895, z = 7} -- para onde o tp vai levar
}

local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function doRemoveMonstersInArea(from, to)
	for x = from.x, to.x do
		for y = from.y, to.y do
			local pos = {x=x, y=y, z = from.z}
			local m = getTopCreature(pos).uid
			if m > 0 and isMonster(m) then
				doRemoveCreature(m)
			end
		end
	end
end

local function FirstEvent(cid)
	local local_boss = {x = 1683, y = 1893, z = 7}
	doCreateMonster("Agathodemon Cinematic", local_boss, false, true);
end

local function SecondEvent(cid)
	doSendMagicEffect({x=1680, y=1896, z=7}, 17)
	doSendMagicEffect({x=1684, y=1895, z=7}, 17)
	doSendMagicEffect({x=1686, y=1894, z=7}, 17)
	doSendMagicEffect({x=1683, y=1891, z=7}, 17)
end

local function ThirdEvent(cid)
	doSendMagicEffect({x=1680, y=1893, z=7}, 17)
	doSendMagicEffect({x=1681, y=1896, z=7}, 17)
	doSendMagicEffect({x=1684, y=1898, z=7}, 17)
	doSendMagicEffect({x=1687, y=1895, z=7}, 17)
	doSendMagicEffect({x=1685, y=1892, z=7}, 17)
	doSendMagicEffect({x=1687, y=1893, z=7}, 17)
	doSendMagicEffect({x=1678, y=1898, z=7}, 17)
	doSendMagicEffect({x=1685, y=1895, z=7}, 17)
end

local function FourthEvent(cid)
	doSendMagicEffect({x=1680, y=1894, z=7}, 17)
	doSendMagicEffect({x=1683, y=1897, z=7}, 17)
	doSendMagicEffect({x=1684, y=1893, z=7}, 17)
	doSendMagicEffect({x=1680, y=1893, z=7}, 17)
	doSendMagicEffect({x=1686, y=1894, z=7}, 17)
	doSendMagicEffect({x=1685, y=1896, z=7}, 17)
	doSendMagicEffect({x=1686, y=1897, z=7}, 17)
	doSendMagicEffect({x=1678, y=1895, z=7}, 17)
	doSendMagicEffect({x=1680, y=1897, z=7}, 17)
	doSendMagicEffect({x=1685, y=1898, z=7}, 17)
	doSendMagicEffect({x=1677, y=1895, z=7}, 17)
end

local function PlayerDano(cid)
	doSendMagicEffect({x=1683, y=1895, z=7}, 17)
end
	
local function FifthEvent(cid)
	doRemoveMonstersInArea(monster_area.from, monster_area.to)
end

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if getPlayerStorageValue(cid, 45278) >= 1 then
		local room = {x=796, y=2039, z=10}
		doTeleportThing(cid, room, true)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	
	elseif getPlayerStorageValue(cid, 45278) <= 0 then
		local players = getPlayersInArea(check_area.from, check_area.to)
		local old_pos = {x = 353, y = 185, z = 9}
		if #players > 0 then      
			doCreatureSay(cid, 'Aguarde um pouco! Um jogador está em um trailer cinemático.', TALKTYPE_ORANGE_1)
			doTeleportThing(cid, old_pos, true)
			return true
		end
		
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		doCreatureSetLookDirection(cid, 0) -- NORTH
		setPlayerStorageValue(cid, 45278, 1)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid) + getCreatureHealth(cid))
		doCreatureAddMana(cid, getCreatureMaxMana(cid) + getCreatureMana(cid))
		
		if getCreatureCondition(cid, CONDITION_FIRE) == true then
			doRemoveCondition(cid, CONDITION_FIRE)
		end
		if getCreatureCondition(cid, CONDITION_POISON) == true then
			doRemoveCondition(cid, CONDITION_POISON)
		end
		if getCreatureCondition(cid, CONDITION_ENERGY) == true then
			doRemoveCondition(cid, CONDITION_ENERGY)
		end
		if getCreatureCondition(cid, CONDITION_BLEEDING) == true then
			doRemoveCondition(cid, CONDITION_BLEEDING)
		end
		if getCreatureCondition(cid, CONDITION_CURSED) == true then
			doRemoveCondition(cid, CONDITION_CURSED)
		end
		if getCreatureCondition(cid, CONDITION_FREEZING) == true then
			doRemoveCondition(cid, CONDITION_FREEZING)
		end
	
		addEvent(doCreatureSay, 0, cid, "??????", TALKTYPE_MONSTER, nil, cid, {x=1683, y=1891, z=7})
		addEvent(FirstEvent, 2*1000, 0, true)
		addEvent(doCreatureSay, 3*1000, cid, "OHH, UM VERME!!", TALKTYPE_MONSTER, nil, cid, {x=1683, y=1893, z=7})
		addEvent(doCreatureSay, 6*1000, cid, "VOCÊ SE ACHA TOLO O SUFICIENTE PARA ME ENFRENTAR? HAHAHAHHAHA", TALKTYPE_MONSTER, nil, cid, {x=1683, y=1893, z=7})
		addEvent(doCreatureSay, 9*1000, cid, "DEIXA EU LHE MOSTRAR O VERDADEIRO PODER ...", TALKTYPE_MONSTER, nil, cid, {x=1683, y=1893, z=7})
		addEvent(SecondEvent, 10*1000, 0, true)
		addEvent(ThirdEvent, 11*1000, 0, true)
		addEvent(FourthEvent, 12*1000, 0, true)
		addEvent(PlayerDano, 13*1000, 0, true)
		addEvent(doCreatureAddHealth, 13*1000, cid, 100 - getCreatureHealth(cid))
		addEvent(doCreatureAddMana, 13*1000, cid, 0 - getCreatureMana(cid))
		addEvent(doCreatureSay, 15*1000, cid, "VOCÊ NÃO TEM NENHUMA CHANCE CONTRA MIM!", TALKTYPE_MONSTER, nil, cid, {x=1683, y=1893, z=7})
		addEvent(FifthEvent, 17*1000, 0, true)
		addEvent(doTeleportThing, 17*1000, cid, {x=796, y=2039, z=10})
	end
	return true
end