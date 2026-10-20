function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if item.uid == 45300 and getPlayerStorageValue(cid, 45299) >= 1 then
		setPlayerStorageValue(cid, 45299, 0)
	else
		return false
	end
	return true
end