function onUse(cid, item, fromPosition, itemEx, toPosition)

-- MENOS MAGES
if (getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 8) then
	if getPlayerFreeCap(cid) > 5818.00 and getPlayerMoney(cid) >= 160000 then
		if doPlayerRemoveMoney(cid, 160000) then
			local purple_bp = doPlayerAddItem(cid, 2000, 1)
			for i = 1, tonumber(getItemInfo(2000).maxItems) do
				doAddContainerItem(purple_bp, 7588, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de strong health potions por 160k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKRED)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 160k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 290.00 and getPlayerMoney(cid) >= 10000 then
		if doPlayerRemoveMoney(cid, 10000) then
			doPlayerAddItem(cid, 7588, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de strong health potions por 10k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKRED)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 10k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '5818.00 oz' e '160k' para comprar BP ou '290.00 oz' e '10k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end