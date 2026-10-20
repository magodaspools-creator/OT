function onUse(cid, item, fromPosition, itemEx, toPosition)

-- APENAS KINA
if (getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8) then
	if getPlayerFreeCap(cid) > 718.00 and getPlayerMoney(cid) >= 50000 then
		if doPlayerRemoveMoney(cid, 50000) then
			local purple_bp = doPlayerAddItem(cid, 2001, 1)
			for i = 1, tonumber(getItemInfo(2001).maxItems) do
				doAddContainerItem(purple_bp, 2313, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de explosion runes por 50k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPURPLE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 50k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 35.00 and getPlayerMoney(cid) >= 3100 then
		if doPlayerRemoveMoney(cid, 3100) then
			doPlayerAddItem(cid, 2313, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de explosion runes por 3.1k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPURPLE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 3.1k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '718.00 oz' e '50k' para comprar BP ou '35.00 oz' e '3.1k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end