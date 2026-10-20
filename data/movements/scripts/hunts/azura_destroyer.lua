local playernewPos = {x=1420, y=464, z=5}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	doTeleportThing(cid, playernewPos)
	return true
end