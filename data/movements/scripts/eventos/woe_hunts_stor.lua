function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
        return false
    end

	if isPlayer(cid) then
		setPlayerStorageValue(cid, 45450, 1)
	end
    return true
end