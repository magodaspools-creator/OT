function onUse(cid, item, fromPosition, itemEx, toPosition)
if (not getTilePzInfo(getCreaturePosition(cid))) then 
   return doPlayerSendCancel(cid, "Você precisa estar em Protect Zone para utilizar o item.") 
end
	
	if item.itemid == 12879 then -- bronze vip days	
		if doRemoveItem(item.uid, 1) then
			doPlayerAddPremiumDays(cid, 2)
			doPlayerSendTextMessage(cid, 25, "Você recebeu 2 dias de VIP Account.")
		else
			return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
		end

	elseif item.itemid == 12880 then -- silver vip days		
		if doRemoveItem(item.uid, 1) then
			doPlayerAddPremiumDays(cid, 5)
			doPlayerSendTextMessage(cid, 25, "Você recebeu 5 dias de VIP Account.")
		else
			return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
		end
	
	elseif item.itemid == 12881 then -- gold vip days
		if doRemoveItem(item.uid, 1) then
			doPlayerAddPremiumDays(cid, 14)
			doPlayerSendTextMessage(cid, 25, "Você recebeu 14 dias de VIP Account.")
		else
			return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
		end
	end
	return true
end