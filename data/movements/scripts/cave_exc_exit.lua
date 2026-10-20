function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 45316) == 1 then
			setPlayerStorageValue(cid, 45316, 0)
		end
	end
	return true
end