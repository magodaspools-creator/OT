dofile("./_woe.lua")

local config = {
	increasing = {[426] = 425},
	decreasing = {[425] = 426}
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

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if(not config.increasing[item.itemid]) then
		return false
	end
	if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.increasing[item.itemid])
	end
	
	if (item.actionid == 45445) then
		Woe.getInfo()
		if getPlayerStorageValue(cid, 45446) - os.time() > 0 then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Para usar o teleport, aguarde: ".. convertTime(getPlayerStorageValue(cid, 45446) - os.time()) ..".")
			return true
		
		elseif getPlayerStorageValue(cid, 45446) - os.time() <= 0 then
			if Woe.isTime() then
				if getPlayerGuildId(cid) ~= 0 then
					if Woe.isRegistered(cid) then
						if Woe.isStarted() then
							if infoLua[2] == getPlayerGuildId(cid) then
								doTeleportThing(cid, Castle.guildEntry, false)
								setPlayerStorageValue(cid, 45446, os.time()+2*60)
							else
								doTeleportThing(cid, fromPosition, true)
								doPlayerSendCancel(cid, "Você não é membro da guild: ".. Woe.guildName() ..".")
								return true
							end
						else							
							doTeleportThing(cid, fromPosition, true)
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"War Castle não começou.")
							return true
						end
					else
						doTeleportThing(cid, fromPosition, true)
						doPlayerSendCancel(cid, "Você não se registrou para War Castle. Digite: !registrar")
						return true
					end
				else
					doTeleportThing(cid, fromPosition, true)
					doPlayerSendCancel(cid, "Você não é membro da guild: ".. Woe.guildName() ..".")
					return true
				end
			else
				doTeleportThing(cid, fromPosition, true)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"War Castle não começou.")
				return true
			end
		end
	end
   return true
end

function onStepOut(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if(not config.decreasing[item.itemid]) then
		return false
	end
	if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.decreasing[item.itemid])
		return true
	end
	return false
end