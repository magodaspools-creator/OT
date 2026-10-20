local areacs = {
[1] = {{x = 397, y = 267, z = 6}, {x = 462, y = 332, z = 7}}
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if isPlayer(cid) then
		if getPlayerLevel(cid) < 100 then
			doTeleportThing(cid, fromPosition, true)
			doCreatureSay(cid, "Only for level 100+", TALKTYPE_ORANGE_1, false, 0, position)
			return true
		end
		
		for _, v in pairs(areacs) do
			for _, pid in pairs(getPlayersOnline()) do
				if (getPlayerIp(pid) == getPlayerIp(cid) and isInRange(getThingPos(pid), v[1], v[2])) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Só é permitido 1 jogador por IP no evento.")
					doTeleportThing(cid, fromPosition, true)
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
					return true
				end
			end
		end  
	end
	return true
end