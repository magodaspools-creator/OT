function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
	local trono_storage = getPlayerStorageValue(cid, 45220) + 1

	if item.aid == 45242 and getPlayerStorageValue(cid, 45242) <= 0 then
		setPlayerStorageValue(cid, 45242, 1)
	else
		return false
	end
	return true
end