function onUse(cid, item, fromPosition, itemEx, toPosition)

-- APENAS KINA
if (getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8) then
	if getPlayerFreeCap(cid) > 6218.00 and getPlayerMoney(cid) >= 304000 then
		if doPlayerRemoveMoney(cid, 304000) then
			local purple_bp = doPlayerAddItem(cid, 2000, 1)
			for i = 1, tonumber(getItemInfo(2000).maxItems) do
				doAddContainerItem(purple_bp, 7591, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de great health potions por 304k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKRED)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 304k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 310.00 and getPlayerMoney(cid) >= 19000 then
		if doPlayerRemoveMoney(cid, 19000) then
			doPlayerAddItem(cid, 7591, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de great health potions por 19k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKRED)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 19k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '6218.00 oz' e '304k' para comprar BP ou '310.00 oz' e '19k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end