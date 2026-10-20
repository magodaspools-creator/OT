local pos = {x = 99, y = 2036, z = 10}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if item.uid == 45212 then
		doTeleportThing(cid, {x = 62, y = 2074, z = 15})
	elseif item.uid == 45213 then
		doTeleportThing(cid, {x = 53, y = 2103, z = 14}) 
	end
	return true
end