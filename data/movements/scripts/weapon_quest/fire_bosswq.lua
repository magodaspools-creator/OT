function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if (not isPlayer(cid)) then
        return false
    end
	
	local ran = math.random(1, 100)
	if ran <= 10 then
		local item_decay = doCreateItem(12725, 1, lastPosition)		
		if item_decay then
			doDecayItem(item_decay)
			doCreatureSay(cid, "".. getCreatureName(cid) .." acidentalmente ativou um assassin fire.", TALKTYPE_ORANGE_1, false, 0, lastPosition)
		end
	end
	return true
end