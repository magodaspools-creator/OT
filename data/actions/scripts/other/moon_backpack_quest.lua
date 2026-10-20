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

function onUse(cid, item, itemEx, topos, frompos) 
local config = {
    level = 80,      -- Level minimo para dar USE 
    efeito = 28      -- Efeito que vai fazer qndo a quest for feita
}

    if getPlayerLevel(cid) < config.level then 
        return doPlayerSendCancel(cid, "You do not have enough level to use this.") 
    end

	if getGlobalStorageValue(cid, 30070) - os.time() <= 0 then 
		local pos = getThingPos(cid)   
		local premio = math.random(1,100)
		if premio <= 15 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu uma Moon Backpack.") 
			doSendMagicEffect(pos, config.efeito)
			doPlayerAddItem(cid, 10521, 1)
			setGlobalStorageValue(cid, 30070, os.time()+120*60)
		elseif premio >= 90 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu uma Blood Herb.") 
			doSendMagicEffect(pos, config.efeito)
			doPlayerAddItem(cid, 2798, 1)
			setGlobalStorageValue(cid, 30070, os.time()+120*60)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Concentrated Red Crystal.") 
			doSendMagicEffect(pos, config.efeito)
			doPlayerAddItem(cid, 12681, 1)
			setGlobalStorageValue(cid, 30070, os.time()+120*60)
		end
	else
		return doPlayerSendCancel(cid, "Alguém já utilizou. Aguarde ".. convertTime(getGlobalStorageValue(cid, 30070) - os.time()) ..".") 
	end
   return true
end