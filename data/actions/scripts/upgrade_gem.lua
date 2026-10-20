function onUse(cid, item, fromPosition, itemEx, toPosition)
	local ran = math.random(1, 100)
	if(item.itemid == 12803 and itemEx.itemid == 12727) then -- physical classic sword
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12734)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12741) then -- physical classic axe
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12748)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12755) then -- physical classic club
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12762)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12769) then -- classic bow
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12772)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12773) then -- staff of imperor
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12774)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12831) then -- classic bow
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12832)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12708) then -- elemental magic shield
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12857)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	if(item.itemid == 12803 and itemEx.itemid == 12709) then -- elite shield
		if (70 > ran) then
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "FAIL!", TEXTCOLOR_RED)
		else
			doTransformItem(itemEx.uid, 12858)
			doRemoveItem(item.uid, 1)
			doSendAnimatedText(getCreaturePosition(cid), "SUCESS!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		end
		return true
	end
	
	return false
end
