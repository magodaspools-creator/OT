local arenas =
{
	{ --Arena 1 - enigma city
		fromPosition = {x = 2039, y = 2005, z = 9},
		toPosition = {x = 2045, y = 2012, z = 9},
		exitPosition = {x = 2044, y = 2017, z = 8}
	},
--[[
	{ --Arenatest - enigma city
		fromPosition = {x = 2197, y = 1304, z = 7},
		toPosition = {x = 2202, y = 1307, z = 7},
		exitPosition = {x = 2200, y = 1298, z = 7}
	},]]--
}

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

local function arena1_playerwin(cid)
	for _, arena in ipairs(arenas) do
		for _, pid in ipairs(getPlayersOnline()) do
			if isPlayer(pid) and isInRange(getPlayerPosition(pid), arena.fromPosition, arena.toPosition) then
				doRemoveCondition(pid, CONDITION_INFIGHT)
				doTeleportThing(pid, arena.exitPosition)
				doSendMagicEffect(arena.exitPosition, CONST_ME_TELEPORT)
				
				if getCreatureCondition(pid, CONDITION_FIRE) == true then
					doRemoveCondition(pid, CONDITION_FIRE)
				end
				if getCreatureCondition(pid, CONDITION_POISON) == true then
					doRemoveCondition(pid, CONDITION_POISON)
				end
				if getCreatureCondition(pid, CONDITION_ENERGY) == true then
					doRemoveCondition(pid, CONDITION_ENERGY)
				end
				if getCreatureCondition(pid, CONDITION_BLEEDING) == true then
					doRemoveCondition(pid, CONDITION_BLEEDING)
				end
				if getCreatureCondition(pid, CONDITION_CURSED) == true then
					doRemoveCondition(pid, CONDITION_CURSED)
				end
				if getCreatureCondition(pid, CONDITION_FREEZING) == true then
					doRemoveCondition(pid, CONDITION_FREEZING)
				end
				
				doCreatureAddHealth(pid, getCreatureMaxHealth(pid))
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_ORANGE, "[ArenaPVP] Você ganhou o duelo.")
				local stor = getPlayerStorageValue(pid, 45469) + 1
				setPlayerStorageValue(pid, 45469, stor)
			end
		end
	end
end
 
function onPrepareDeath(cid, deathList)
	local tmp = getCreaturePosition(cid)
	for _, arena in ipairs(arenas) do
		if isInRange(tmp, arena.fromPosition, arena.toPosition) then			
			doTeleportThing(cid, {x=2014,y=2004,z=9}, true)
			doSendMagicEffect(tmp, CONST_ME_POFF)
			doSendMagicEffect({x=2014,y=2004,z=9}, CONST_ME_MORTAREA) -- Edited to submundo rs
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[ArenaPVP] Você perdeu o duelo.")
			doRemoveMonstersInArea(arena.fromPosition, arena.toPosition)
			
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
			
			addEvent(arena1_playerwin, 2*1000, 0, true)
			return false
		end
	end 
	return true
end

function onLogin(cid)
	registerCreatureEvent(cid, "arena_pvp1")
	return true		
end