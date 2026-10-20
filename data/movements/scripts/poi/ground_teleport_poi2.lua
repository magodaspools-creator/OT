local pos = {x = 99, y = 2036, z = 10}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if item.uid == 45215 and getPlayerStorageValue(cid, 45226) <= 0 then
		doTeleportThing(cid, {x = 33, y = 2090, z = 15})
	elseif item.uid == 45216 then
		doTeleportThing(cid, {x = 21, y = 2101, z = 13})
	else
		doTeleportThing(cid, {x = 53, y = 2096, z = 15})
	end
	return true
end