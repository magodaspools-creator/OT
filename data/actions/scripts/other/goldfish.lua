function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 5928 and itemEx.itemid == 5554) then
		doTransformItem(item.uid, 5929)
		doRemoveItem(itemEx.uid, 1)
		doSendAnimatedText(getCreaturePosition(cid), "Bubbles...", TEXTCOLOR_LIGHTGREEN)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		return true
	end	
	return false
end
