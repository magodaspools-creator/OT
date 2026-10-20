function onUse(cid, item, frompos, item2, topos)

	if item2.itemid == 6281 and item2.aid == 42312 then
		doTransformItem(item2.uid, 12661)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(topos, CONST_ME_BLOCKHIT)
	else
		doPlayerSendCancel(cid, "You can't use this item here.")
	end
	return true
end