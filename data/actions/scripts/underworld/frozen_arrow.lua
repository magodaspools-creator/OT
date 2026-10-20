function onUse(cid, item, frompos, itemEx, topos)

	if(itemEx.itemid == 12871) then
		if getPlayerItemCount(cid, 12854) >= 2 and getPlayerMoney(cid) >= 10000 then
			if getPlayerFreeCap(cid) > 15.00 then
				if doPlayerRemoveItem(cid, 12854, 2) and doPlayerRemoveMoney(cid, 10000) then
					doPlayerAddItem(cid, 12841, 0)
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "ERROR! Contact the Administrator.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '15.00 oz' para comprar este item.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "=== Itens necessários para craftar ===\n=> 2 Rusty Gears.\n=> 10k.")
		end
				
		doTransformItem(item.uid, 12872)
		doDecayItem(item.uid)
		return true
		
	elseif(itemEx.itemid == 12872) then
        return doPlayerSendCancel(cid, "Aguarde 5 segundos para usar novamente.")
    end
	return true
end