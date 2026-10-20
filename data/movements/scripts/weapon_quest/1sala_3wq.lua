function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
	doTeleportThing(cid, fromPosition, true)
	doPlayerSendTextMessage(cid, 27, "Você não pode seguir por aqui. Encontre outro caminho.")
    return true
end