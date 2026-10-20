local config = {
	increasing = {[426] = 425},
	decreasing = {[425] = 426}
}

function onStepIn(cid, item, position, fromPosition, toPosition)
if(not config.increasing[item.itemid]) then
		return false
	end
if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.increasing[item.itemid])
	end

	if isPlayer(cid) then
		doCreatureSay(cid, "You hear a rumbling from far away.", TALKTYPE_ORANGE_1)
	end
    return true
end

function onStepOut(cid, item, position, fromPosition)
if(not config.decreasing[item.itemid]) then
		return false
	end
if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.decreasing[item.itemid])
	end
	return true
end