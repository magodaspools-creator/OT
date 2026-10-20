local pos = {x = 1024, y = 2291, z = 8}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
    if isPlayer(cid) then
		if getPlayerLevel(cid) >= 100 then
			doTeleportThing(cid, pos, true)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		else
			doPlayerSendTextMessage(cid, 27, "Você não possui level suficiente. Necessário ser 100+")
			doTeleportThing(cid, fromPosition, true)
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
		end
	end
    return true
end