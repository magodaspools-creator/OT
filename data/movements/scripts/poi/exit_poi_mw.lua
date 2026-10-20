local pos = {x = 99, y = 2040, z = 10}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	doTeleportThing(cid, pos) 
	doSendMagicEffect(getThingPos(cid), 37)
	return true
end