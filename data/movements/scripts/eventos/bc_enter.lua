function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 45403) <= 0 then
			setPlayerStorageValue(cid, 45403, 1)
		end
	end
	return true
end