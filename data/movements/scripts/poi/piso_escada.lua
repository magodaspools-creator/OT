local config = {
	increasing = {[426] = 425},
	decreasing = {[425] = 426}
}

local escadaID = 1386
local escadaPos = {x = 162, y = 2030, z = 11, stackpos = 253}

function onStepIn(cid, item, position, fromPosition, toPosition)
if(not config.increasing[item.itemid]) then
		return false
	end
if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.increasing[item.itemid])
	end

	doCreateItem(escadaID, 1, escadaPos)
    return true
end

function onStepOut(cid, item, position, fromPosition)
if(not config.decreasing[item.itemid]) then
		return false
	end
if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.decreasing[item.itemid])
	end
	

	local sewer = getTileItemById(escadaPos, escadaID)
	if (sewer.itemid == escadaID) then
		doRemoveItem(sewer.uid)
	end
	return true
end