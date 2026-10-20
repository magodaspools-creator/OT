function onUse(cid, item, fromPosition, itemEx, toPosition)

	if isPremium(cid) == true and getPlayerStorageValue(cid, 45506) <= 0 then
		if not isPlayerPzLocked(cid) then
			if getPlayerMoney(cid) >= 100000 then
				if doPlayerRemoveMoney(cid, 100000) then
					setPlayerStorageValue(cid, 45506, 1)
					doTeleportThing(cid, {x=2527,y=1866,z=5})
					doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
					doPlayerSendTextMessage(cid, 27, "Você agora possui acesso vitalício a esta área.")
				else
					doPlayerSendCancel(cid, "ERROR! Contact The Administrator!")
				end
			else
				doPlayerSendCancel(cid, "Desculpe, você precisa de 100k para ter acesso.")
			end
		else
			doPlayerSendCancel(cid, "Desculpe, você não pode estar com 'PZ Bloked'.")
		end

	elseif getPlayerStorageValue(cid, 45506) > 0 then
		if not isPlayerPzLocked(cid) then
			doTeleportThing(cid, {x=2527,y=1866,z=5})
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		else
			doPlayerSendCancel(cid, "Desculpe, você não pode estar com 'PZ Bloked'.")
		end

	else
		doPlayerSendTextMessage(cid, 27, "Você precisa clicar aqui ao menos 1 vez sendo VIP Account e sua entrada para esta hunt será vitalícia.")
	end
	return true
end
