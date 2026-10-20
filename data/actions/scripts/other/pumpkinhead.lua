local PUMPKIN_HEAD = 2096
local PUMPKIN_HEAD_LIGHT = 2097
local CANDLE = 2047
local CANDLE2 = 2048
local KNIFE = 2566
local RED_APPLE = 2674

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == PUMPKIN_HEAD and itemEx.itemid == CANDLE) or (item.itemid == PUMPKIN_HEAD and itemEx.itemid == CANDLE2) then
		doTransformItem(item.uid, PUMPKIN_HEAD_LIGHT)
		doRemoveItem(itemEx.uid)
		doDecayItem(item.uid)
		return true
		
	elseif (item.itemid == KNIFE and itemEx.itemid == RED_APPLE and getPlayerItemCount(cid, 6278) >= 1) then
		doRemoveItem(itemEx.uid, 1)
		doPlayerRemoveItem(cid, 6278, 1) -- cake
		doPlayerAddItem(cid, 6279) -- decorated cake
		return true
	end

	return item.itemid == KNIFE and TOOLS.KNIFE(cid, item, fromPosition, itemEx, toPosition)
end
