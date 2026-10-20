local playernewPos = {x=1443, y=455, z=4}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	doTeleportThing(cid, playernewPos)
	return true
end