function onUse(cid, item, frompos, itemEx, topos)

	if(itemEx.itemid == 12871) then
		if getPlayerItemCount(cid, 12854) >= 50 and getPlayerItemCount(cid, 6500) >= 200 and getPlayerMoney(cid) >= 150000 then
			if getPlayerFreeCap(cid) > 7.80 then
				if doPlayerRemoveItem(cid, 12854, 50) and doPlayerRemoveItem(cid, 6500, 200) and doPlayerRemoveMoney(cid, 150000) then
					doPlayerAddItem(cid, 12845, 1)
					doBroadcastMessage("[UNDERWORLD] ".. getPlayerName(cid) .." acabou de craftar o item underworld magic amulet. Parabéns!", MESSAGE_STATUS_CONSOLE_BLUE)
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "ERROR! Contact the Administrator.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '7.80 oz' para comprar este item.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "=== Itens necessários para craftar ===\n=> 50 Rusty Gears.\n=> 200 Demonic Essence.\n=> 150k.")
		end
				
		doTransformItem(item.uid, 12872)
		doDecayItem(item.uid)
		return true
		
	elseif(itemEx.itemid == 12872) then
        return doPlayerSendCancel(cid, "Aguarde 5 segundos para usar novamente.")
    end
	return true
end