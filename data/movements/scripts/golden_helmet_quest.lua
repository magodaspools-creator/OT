local timetoteleport = {5, "min"}
local goldenfrom = {x = 930, y = 2293, z = 8}
local goldento = {x = 948, y = 2308, z = 8}
local newpos = {x = 939, y = 2291, z = 8}
local pos_m = {x = 939, y = 2297, z = 8}
local possala = {x = 939, y = 2293, z = 8}


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

local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function kickPlayerFromArea(cid, p)
	if isPlayer(cid) and isInRange(getPlayerPosition(cid), p[1], p[2]) then
		doTeleportThing(cid, p[3])
		doSendMagicEffect(p[3], CONST_ME_TELEPORT)
		doCreatureSay(cid, 'You were kicked out of the room.', TALKTYPE_ORANGE_1)
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

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	local players = getPlayersInArea(goldenfrom, goldento)
	if #players > 0 then      
		doCreatureSay(cid, "Aguarde! Possui um jogador na Quest.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, fromPosition, true)
		return true
	end
	
	if getGlobalStorageValue(cid, 30071) - os.time() > 0 then
		doCreatureSay(cid, "Aguarde ".. convertTime(getGlobalStorageValue(cid, 30071) - os.time()) ..".", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, fromPosition, true)
		return true
	end	
	
	doRemoveMonstersInArea(goldenfrom, goldento)
	doTeleportThing(cid, possala)
    doSendMagicEffect(possala, CONST_ME_TELEPORT)
	addEvent(kickPlayerFromArea, mathtime(timetoteleport) * 1000, cid, {goldenfrom, goldento, newpos})
	doCreateMonster("Quest Demon", pos_m, false, true);
	setGlobalStorageValue(cid, 30071, os.time()+5*60)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sobreviva por 5 minutos e você será teleportado para sala de recompensas.")
	return true
end