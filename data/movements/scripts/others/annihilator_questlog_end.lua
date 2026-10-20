function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 50000) == 1 then
			setPlayerStorageValue(cid, 50000, 2) -- questLog
		end
	end
return TRUE
end