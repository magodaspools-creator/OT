function onUse(cid, item, fromPosition, itemEx, toPosition)

-- APENAS KINA
if (getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8) then
	if getPlayerFreeCap(cid) > 6218.00 and getPlayerMoney(cid) >= 496000 then
		if doPlayerRemoveMoney(cid, 496000) then
			local purple_bp = doPlayerAddItem(cid, 2000, 1)
			for i = 1, tonumber(getItemInfo(2000).maxItems) do
				doAddContainerItem(purple_bp, 8473, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de ultimate health potions por 496k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKRED)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 496k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 310.00 and getPlayerMoney(cid) >= 31000 then
		if doPlayerRemoveMoney(cid, 31000) then
			doPlayerAddItem(cid, 8473, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de ultimate health potions por 31k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKRED)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 31k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '5418.00 oz' e '72k' para comprar BP ou '310.00 oz' e '31k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end