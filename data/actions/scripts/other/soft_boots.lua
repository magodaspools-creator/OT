local ITEM_ID = {
	[10021] = 6132
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if (item.itemid == 10021) then 
		if getPlayerMoney(cid) >= 10000 then
			if doPlayerRemoveMoney(cid, 10000) then
				local pos = getThingPos(cid)    
				doSendMagicEffect(pos, CONST_ME_FIREWORK_BLUE)
				doTransformItem(item.uid, ITEM_ID[item.itemid])
			else
				doPlayerSendCancel(cid, "ERROR! Please contact the administrator.")
			end
		else
			doPlayerSendCancel(cid, "You need 10000golds (10k).")
		end
	else
		doPlayerSendCancel(cid, "You cannot use this object.") 
	end
	return true
end
