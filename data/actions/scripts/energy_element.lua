function onUse(cid, item, fromPosition, itemEx, toPosition)
if(getPlayerSoul(cid) < 10) then
	doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
	return true
end

	if(item.itemid == 12799 and itemEx.itemid == 12727) then -- physical classic sword
		doTransformItem(itemEx.uid, 12730)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 12734) then -- physical upgraded classic sword
		doTransformItem(itemEx.uid, 12737)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 12741) then -- physical classic axe
		doTransformItem(itemEx.uid, 12744)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 12748) then -- physical upgraded classic axe
		doTransformItem(itemEx.uid, 12751)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 12755) then -- physical classic club
		doTransformItem(itemEx.uid, 12758)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 12762) then -- physical upgraded classic club
		doTransformItem(itemEx.uid, 12765)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 12703) then -- staff of dream star
		doTransformItem(itemEx.uid, 12780)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 2408) then -- warlord sword
		doTransformItem(itemEx.uid, 12816)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 8925) then -- solar axe
		doTransformItem(itemEx.uid, 12822)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12799 and itemEx.itemid == 7450) then -- hammer of prophecy
		doTransformItem(itemEx.uid, 12828)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	return false
end
