local timetokick = {4, "min"} -- tempo para ser teleportado para fora
local timelever = {5, "min"} -- tempo da LEVER
local arena_from = {x=2039,y=2005,z=9}
local arena_to = {x=2045,y=2012,z=9}
local exit_arena = {x=2044,y=2017,z=8}

local function convertTime(a)
  if(type(tonumber(a)) == "number" and a > 0) then
    if (a <= 3599) then
      local minute = math.floor(a/60)
      local second = a - (60 * minute)
      if(second == 0) then
        return ((minute)..((minute > 1) and " minutos" or " minuto"))
      else
        return ((minute ~= 0) and ((minute>1) and minute.." minutos e " or minute.." minuto e ").. ((second>1) and second.." segundos" or second.." segundo") or ((second>1) and second.." segundos" or second.. " segundo"))
      end
    else
      local hour = math.floor(a/3600)
      local minute = math.floor((a - (hour * 3600))/60)
      local second = (a - (3600 * hour) - (minute * 60))
      if (minute == 0 and second > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(second..((second > 1) and " segundos" or " segundo"))
      elseif (second == 0 and minute > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(minute..((minute > 1) and " minutos" or " minuto"))
      elseif (second == 0 and minute == 0) then
        return (hour..((hour > 1) and " horas" or " hora"))
      end
      return (hour..((hour > 1) and " horas, " or " hora, "))..(minute..((minute > 1) and " minutos e " or " minuto e "))..(second..((second > 1) and " segundos" or " segundo"))
    end
  end
end

local function kickPlayerFromArea(cid, p)
	for _, pid in ipairs(getPlayersOnline()) do
		if isPlayer(pid) and isInRange(getPlayerPosition(pid), p[1], p[2]) then
			doTeleportThing(pid, p[3])
			doSendMagicEffect(p[3], CONST_ME_TELEPORT)
			
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
			
			doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_ORANGE, "[ArenaPVP] O duelo terminou em empate.")
		end
	end
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

local function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
	for i, v in pairs(unit) do
		if v == table[2] then
			return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
		end
	end
	
	return error("Bad declaration in mathtime function.")
end

local function changeBack(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

function onUse(cid, item, frompos, item2, topos)
    local player1 = getTopCreature({x=2040,y=2015,z=8}).uid
	local player2 = getTopCreature({x=2041,y=2015,z=8}).uid
	
	if item.itemid == 1945 then
		if isPlayer(player1) and isPlayer(player2) then
			doTransformItem(item.uid, item.itemid + 1)
			addEvent(changeBack, mathtime(timelever) * 1000, {x=2040,y=2014,z=8})
			setGlobalStorageValue(cid, 30077, os.time()+5*60)
			doRemoveMonstersInArea(arena_from, arena_to)
			doTeleportThing(player1, {x=2042,y=2005,z=9})
			doTeleportThing(player2, {x=2042,y=2012,z=9})
			doPlayerSendTextMessage(player1, MESSAGE_STATUS_WARNING, "Fight!")
			doPlayerSendTextMessage(player2, MESSAGE_STATUS_WARNING, "Fight!")
			doCreatureSay(cid, "O duelo começou!", TALKTYPE_ORANGE_1, false, 0, {x=2042,y=2008,z=9})
			doCreatureSay(cid, "Vocês tem 4 minutos.", TALKTYPE_ORANGE_1, false, 0, {x=2042,y=2009,z=9})
			addEvent(kickPlayerFromArea, mathtime(timetokick) * 1000, cid, {arena_from, arena_to, exit_arena})
		else
			return doCreatureSay(cid, "É necessário 2 jogadores.", TALKTYPE_ORANGE_1)
		end
		
	elseif item.itemid == 1946 then
		return doCreatureSay(cid, "Aguarde ".. convertTime(getGlobalStorageValue(cid, 30077) - os.time()) ..".", TALKTYPE_ORANGE_1, false, 0, {x=2040, y=2014, z=8})
	end
	return true
end