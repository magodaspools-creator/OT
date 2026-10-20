function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 5865 and itemEx.itemid == 2678 and getPlayerItemCount(cid, 2006, 0) >= 1) then
		doRemoveItem(item.uid, 1)
		doRemoveItem(itemEx.uid, 1)
		doPlayerRemoveItem(cid, 2006, 1, 0)
		doPlayerAddItem(cid, 2006, 14)
		return true
	end

	return false
end
