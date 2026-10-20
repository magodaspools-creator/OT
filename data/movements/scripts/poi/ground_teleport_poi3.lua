local pos = {x = 99, y = 2036, z = 10}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if item.uid == 45217 then
		doTeleportThing(cid, {x = 136, y = 1951, z = 12})
	end
	return true
end