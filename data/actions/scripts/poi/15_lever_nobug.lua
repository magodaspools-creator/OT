function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		doTransformItem(item.uid, item.itemid - 1)
	else
		return false
	end
end