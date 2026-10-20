function onUse(cid, item, fromPosition, itemEx, toPosition)

-- ALL VOC
if (getPlayerVocation(cid) >= 0 or getPlayerVocation(cid) <= 8) then
	if getPlayerFreeCap(cid) > 1058.00 and getPlayerMoney(cid) >= 59000 then
		if doPlayerRemoveMoney(cid, 59000) then
			local purple_bp = doPlayerAddItem(cid, 2001, 1)
			for i = 1, tonumber(getItemInfo(2001).maxItems) do
				doAddContainerItem(purple_bp, 2315, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de thunderstorm runes por 59k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPURPLE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 59k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 52.00 and getPlayerMoney(cid) >= 3700 then
		if doPlayerRemoveMoney(cid, 3700) then
			doPlayerAddItem(cid, 2315, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de thunderstorm runes por 3.7k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPURPLE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 3.7k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '1058.00 oz' e '59k' para comprar BP ou '52.00 oz' e '3.7k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end