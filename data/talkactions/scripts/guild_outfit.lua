local config = {
	storage = 45487
}

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

function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

if getPlayerStorageValue(cid, config.storage) - os.time() > 0 then
	doPlayerSendCancel(cid, "Você deve aguardar ".. convertTime(getPlayerStorageValue(cid, config.storage) - os.time()) .." para usar o comando novamente.")
	return true
end
 
	local playerGuild = getPlayerGuildId(cid)
	if(playerGuild == FALSE) then
		doPlayerSendCancel(cid, "Você precisa fazer parte e ser o lider de uma guild para usar esse comando.")
		return TRUE
	end
 
	local playerGuildLevel = getPlayerGuildLevel(cid)
	if(playerGuildLevel < GUILDLEVEL_LEADER) then
		doPlayerSendCancel(cid, "Você precisa ser o lider da guild para usar esse comando.")
		return TRUE
	end
 
	local players = getPlayersOnline()
	local outfit = getCreatureOutfit(cid)
	local message = "*Guild - ".. getPlayerGuildName(cid) .."* A cor da sua outfit foi alterada pelo líder " .. getCreatureName(cid) .. "."
	local members = 0

	for i, tid in ipairs(players) do
		if(getPlayerGuildId(tid) == playerGuild and cid ~= tid) then
			local tidOutfit = getCreatureOutfit(tid)
			tidOutfit.lookHead = outfit.lookHead
			tidOutfit.lookBody = outfit.lookBody
			tidOutfit.lookLegs = outfit.lookLegs
			tidOutfit.lookFeet = outfit.lookFeet
			tidOutfit.lookLegs = outfit.lookLegs

			doSendMagicEffect(getCreaturePosition(tid), CONST_ME_MAGIC_GREEN)
			doCreatureChangeOutfit(tid, tidOutfit)
			doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, message)
			members = members + 1
		end
	end
 
	setPlayerStorageValue(cid, config.storage, os.time()+2*60)
	doPlayerSendTextMessage(cid, 25, "A cor da outfit dos membros de sua guild foi alterada para a sua. (Total: " .. members .. ")")
	return TRUE
end