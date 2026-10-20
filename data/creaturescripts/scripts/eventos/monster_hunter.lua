function onKill(cid, target, lastHit)
	if isPlayer(cid) and isMonster(target) then
		if getCreatureMaster(target) ~= nil then
			return true
		end

		local name = getGlobalStorageValue(1919211)
		if string.lower(getCreatureName(target)) == string.lower(name) then
			doPlayerSetStorageValue(cid, 1814210, getPlayerStorageValue(cid, 1814210) + 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Monster Hunter Event] Você já matou "..getPlayerStorageValue(cid, 1814210).." "..name.."! Continue matando para ser o vencedor!")
		end
	end
	return true
end

function onLogin(cid)
	if getGlobalStorageValue(1919211) == 0 then
		doPlayerSetStorageValue(cid, 1814210, 0)
	end
	
	registerCreatureEvent(cid, "Monster Hunter")
	return true
end