local happyHour = getConfigValue("staminaRatingLimitTop")
		
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

function onUse(cid, item, fromPosition, itemEx, toPosition)
local staminaTime = getPlayerStamina(cid) - getConfigValue("staminaRatingLimitTop")
   
    if(getPlayerStamina(cid) >= happyHour) then
        doPlayerSendCancel(cid, "Você ainda tem ".. staminaTime .." minutos de stamina bônus.")
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
        return true
    end
	
	if getPlayerStorageValue(cid, 45460) - os.time() > 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você deve aguardar ".. convertTime(getPlayerStorageValue(cid, 45460) - os.time()) .." para usar novamente.")
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		return true
	end
	
    if doRemoveItem(item.uid) == true then
		local ranPremmy = math.random(2,5)
		local ran = math.random(1,3)
		if isPremium(cid) then
			doPlayerAddStamina(cid, ranPremmy * 60)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você recarregou ".. ranPremmy .." horas de stamina.")
			setPlayerStorageValue(cid, 45460, os.time()+60*60)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		else
			doPlayerAddStamina(cid, ran * 60)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você recarregou ".. ran .." horas de stamina.")
			setPlayerStorageValue(cid, 45460, os.time()+60*60)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
	end
    return true
end