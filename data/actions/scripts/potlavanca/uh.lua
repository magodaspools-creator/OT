function onUse(cid, item, fromPosition, itemEx, toPosition)

-- ALL VOC
if (getPlayerVocation(cid) >= 0 or getPlayerVocation(cid) <= 8) then
	if getPlayerFreeCap(cid) > 4218.00 and getPlayerMoney(cid) >= 280000 then
		if doPlayerRemoveMoney(cid, 280000) then
			local purple_bp = doPlayerAddItem(cid, 2002, 1)
			for i = 1, tonumber(getItemInfo(2002).maxItems) do
				doAddContainerItem(purple_bp, 2273, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de ultimate healing runes por 280k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 280k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 210.00 and getPlayerMoney(cid) >= 17500 then
		if doPlayerRemoveMoney(cid, 17500) then
			doPlayerAddItem(cid, 2273, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de ultimate healing runes por 17.5k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 17.5k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '4218.00 oz' e '280k' para comprar BP ou '210.00 oz' e '17.5k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end