function onAddItem(moveitem, tileitem, position, cid)
	if(moveitem.itemid == 2047) or (moveitem.itemid == 2048) then
		doRemoveItem(moveitem.uid)
		doTransformItem(tileitem.uid, 6280)
		doSendMagicEffect(position, CONST_ME_FIREWORK_RED)
	end
	return true
end
