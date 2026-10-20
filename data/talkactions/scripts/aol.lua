function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end
	
	local position = getCreaturePosition(cid)
	if getPlayerMoney(cid) >= 20000 then
		if doPlayerRemoveMoney(cid, 20000) then
			doPlayerAddItem(cid, 2173, 1) -- football		
			doPlayerSendTextMessage(cid, 27, "Você comprou um 'Amulet of Loss'.")
			doCreatureSay(cid, "Aol!", TALKTYPE_ORANGE_1)
			doSendMagicEffect(position, 12)
		else
			doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
		end
	else
		doPlayerSendTextMessage(cid,25,"Você não tem dinheiro suficiente. Você precisa de 20k!")
	end
    return true
end