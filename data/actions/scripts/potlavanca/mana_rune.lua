function onUse(cid, item, fromPosition, itemEx, toPosition)

-- ALL VOC
if (getPlayerVocation(cid) >= 0 or getPlayerVocation(cid) <= 8) then
	if getPlayerFreeCap(cid) > 2418.00 and getPlayerMoney(cid) >= 336000 then
		if doPlayerRemoveMoney(cid, 336000) then
			local purple_bp = doPlayerAddItem(cid, 2002, 1)
			for i = 1, tonumber(getItemInfo(2002).maxItems) do
				doAddContainerItem(purple_bp, 2270, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de mana runes por 336k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 336k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 120.00 and getPlayerMoney(cid) >= 21000 then
		if doPlayerRemoveMoney(cid, 21000) then
			doPlayerAddItem(cid, 2270, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de mana runes por 21k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 21k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '2418.00 oz' e '336k' para comprar BP ou '120.00 oz' e '21k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end