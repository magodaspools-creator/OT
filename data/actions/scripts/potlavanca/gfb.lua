function onUse(cid, item, fromPosition, itemEx, toPosition)

-- ALL VOC
if (getPlayerVocation(cid) >= 0 or getPlayerVocation(cid) <= 8) then
	if getPlayerFreeCap(cid) > 1058.00 and getPlayerMoney(cid) >= 72000 then
		if doPlayerRemoveMoney(cid, 72000) then
			local purple_bp = doPlayerAddItem(cid, 10519, 1)
			for i = 1, tonumber(getItemInfo(10519).maxItems) do
				doAddContainerItem(purple_bp, 2304, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de great fireball runes por 72k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_ORANGE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 72k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 52.00 and getPlayerMoney(cid) >= 4500 then
		if doPlayerRemoveMoney(cid, 4500) then
			doPlayerAddItem(cid, 2304, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de grat fireball runes por 4.5k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_ORANGE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 4.5k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '1058.00 oz' e '72k' para comprar BP ou '52.00 oz' e '4.5k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end