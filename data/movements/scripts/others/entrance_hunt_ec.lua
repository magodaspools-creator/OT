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

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if getPlayerStorageValue(cid, 29997) - os.time() <= 0 then
		doPlayerPopupFYI(cid, "                                                           ..::: AVISO :::..\nLocal com:\n+ 11 Hunts novas\n+ Monstros novos (ex: asura, vile grandmaster...)\n\n\n                                         ..::: COMO OBTER EVENT COIN :::..\n\n* Daily (quest diária, possível fazer todos os dias)\n* Task (DROP dos bosses)\n* Invasões (DROP dos bosses em invasões)\n\n                                                      ..::: COMO USAR :::..\n\nBasta dar 'USE' no 'Event Coin' e poderá ter acesso a esta área.\nOBS: Seu tempo não acumula se você utilizar 2 event coins simultaneamente.\n\n\n Você possui: ".. getPlayerItemCount(cid, 12686) .." Event Coin(s).")
		doTeleportThing(cid, fromPosition, true)
	else
		doPlayerSendTextMessage(cid, 27,"Você ainda possui: ".. convertTime(getPlayerStorageValue(cid, 29997) - os.time()) ..".")
		return false
	end
	return true
end