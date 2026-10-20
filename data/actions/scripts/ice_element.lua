function onUse(cid, item, fromPosition, itemEx, toPosition)
if(getPlayerSoul(cid) < 10) then
	doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
	return true
end

	if(item.itemid == 12796 and itemEx.itemid == 12727) then -- physical classic sword
		doTransformItem(itemEx.uid, 12731)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12734) then -- physical upgraded classic sword
		doTransformItem(itemEx.uid, 12738)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12741) then -- physical classic axe
		doTransformItem(itemEx.uid, 12745)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12748) then -- physical upgraded classic axe
		doTransformItem(itemEx.uid, 12752)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12755) then -- physical classic club
		doTransformItem(itemEx.uid, 12759)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12762) then -- physical upgraded classic club
		doTransformItem(itemEx.uid, 12766)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12678) then -- staff of destruction
		doTransformItem(itemEx.uid, 12777)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12703) then -- staff of dream star
		doTransformItem(itemEx.uid, 12783)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12773) then -- staff of imperor
		doTransformItem(itemEx.uid, 12787)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 12774) then -- upgraded staff of imperor
		doTransformItem(itemEx.uid, 12792)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 2408) then -- warlord sword
		doTransformItem(itemEx.uid, 12814)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 8925) then -- solar axe
		doTransformItem(itemEx.uid, 12820)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 12796 and itemEx.itemid == 7450) then -- hammer of prophecy
		doTransformItem(itemEx.uid, 12826)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	return false
end
