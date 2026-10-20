-- Config # --
local areafrom = {x = 695, y = 140, z = 8} -- ENTRADA from
local areato = {x = 706, y = 151, z = 8} -- ENTRADA to
local pos_exit = {x = 708, y = 146, z = 8} -- POS SAIDA
local pos_entrance = {x = 706, y = 146, z = 8} -- POS ENTRADA

local global_stor = 30052
local player_stor = 45321

local timetokick_free = {60, "min"} -- tempo
local timetokick_vip = {90, "min"} -- tempo
-- END --

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

local function getPlayersInArea(fromPos, toPos)
local cave_exc_players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(cave_exc_players, pid)
        end
    end
   
	return cave_exc_players
end

local function kickPlayerFromArea(cid, p)
	for _, pid in ipairs(getPlayersOnline()) do
		if isPlayer(pid) and isInRange(getPlayerPosition(pid), p[1], p[2]) then
			doTeleportThing(pid, p[3])
			doSendMagicEffect(p[3], CONST_ME_TELEPORT)
			doCreatureSay(pid, 'You were kicked out of the room.', TALKTYPE_ORANGE_1)
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

function onUse(cid, item, frompos, item2, topos)
local check_player = getPlayersInArea(areafrom, areato);
	
	if getGlobalStorageValue(cid, global_stor) - os.time() <= 0 and getPlayerStorageValue(cid, player_stor) - os.time() > 0 then
		doPlayerSendTextMessage(cid, 27, "Infelizmente o servidor deu SaveServer ou caiu e você perdeu sua Cave Exclusiva. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, player_stor) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
	
	elseif getGlobalStorageValue(cid, global_stor) - os.time() > 0 and getPlayerStorageValue(cid, player_stor) - os.time() <= 0 then
		if #check_player > 0 then
			doPlayerSendTextMessage(cid, 27, "Possui um jogador nesta Cave Exclusiva. Aguarde ".. convertTime(getGlobalStorageValue(cid, global_stor) - os.time()) ..".")
		else
			doPlayerSendTextMessage(cid, 27, "Esta Cave Exclusiva está ocupada, o jogador não se encontra nela no momento, mas pode voltar. Aguarde ".. convertTime(getGlobalStorageValue(cid, global_stor) - os.time()) ..".")
		end

	elseif getGlobalStorageValue(cid, global_stor) - os.time() > 0 and getPlayerStorageValue(cid, player_stor) - os.time() > 0 then
		if #check_player > 0 then
			doTeleportThing(cid, pos_exit)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerSendTextMessage(cid, 27, "Você saiu da Cave Exclusiva. Você ainda possui ".. convertTime(getGlobalStorageValue(cid, global_stor) - os.time()) ..".")
			return true
		else
			doTeleportThing(cid, pos_entrance)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerSendTextMessage(cid, 27, "Você entrou na Cave Exclusiva. Você ainda possui ".. convertTime(getGlobalStorageValue(cid, global_stor) - os.time()) ..".")
			return true
		end	
		
	elseif getGlobalStorageValue(cid, global_stor) - os.time() <= 0 and getPlayerStorageValue(cid, player_stor) - os.time() <= 0 and getPlayerItemCount(cid, 12707) >= 1 then
		if getPlayerStorageValue(cid, 45343) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "Você já possui uma Cave Exclusiva. Só pode haver 1 Cave Exclusiva por personagem.")
			return true
		end
		
		if doPlayerRemoveItem(cid, 12707, 1) then
			if isPremium(cid) then
				setGlobalStorageValue(cid, global_stor, os.time()+90*60)
				setPlayerStorageValue(cid, player_stor, os.time()+90*60)
				setPlayerStorageValue(cid, 45343, os.time()+90*60)
				addEvent(kickPlayerFromArea, mathtime(timetokick_vip) * 1000, cid, {areafrom, areato, pos_exit})
			else
				setGlobalStorageValue(cid, global_stor, os.time()+60*60)
				setPlayerStorageValue(cid, player_stor, os.time()+60*60)
				setPlayerStorageValue(cid, 45343, os.time()+60*60)
				addEvent(kickPlayerFromArea, mathtime(timetokick_free) * 1000, cid, {areafrom, areato, pos_exit})
			end
			doRemoveMonstersInArea(areafrom, areato)
			doTeleportThing(cid, pos_entrance)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerSendTextMessage(cid, 27, "Você entrou na Cave Exclusiva. Você possui ".. convertTime(getGlobalStorageValue(cid, global_stor) - os.time()) ..".")
		end
	else
		doPlayerSendTextMessage(cid, 27, "Você não possui o item.")
	end
	return true
end