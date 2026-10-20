function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 45459) == 1 then
			setPlayerStorageValue(cid, 45459, 0)
		end
	end
	return true
end