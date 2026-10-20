function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
	doTeleportThing(cid, {x = 543, y = 2414, z = 8}, true)
	doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
    return true
end