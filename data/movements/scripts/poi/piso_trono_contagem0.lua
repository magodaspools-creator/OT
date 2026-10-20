function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
	if item.aid == 45241 and getPlayerStorageValue(cid, 45220) < 0 then
		setPlayerStorageValue(cid, 45220, 0)
	else
		return false
	end
	return true
end