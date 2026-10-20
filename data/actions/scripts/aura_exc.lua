function onUse(cid, item, itemEx, topos, frompos) 
if getPlayerStorageValue(cid, 25950) <= 0 then 
	return doPlayerSendCancel(cid, "Você precisa finalizar a Quest Aura para poder usar esse item.")
end

	if getPlayerStorageValue(cid, 25955) <= 0 then 
		if doRemoveItem(item.uid, 1) then
			setPlayerStorageValue(cid, 25955, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você recebeu Aura Exclusiva! Digite > !aura exc < para utilizar a aura.")
			doSendMagicEffect(frompos, 30)
		else
			return doPlayerSendCancel(cid, "ERROR! Contact the administrator.")
		end		
	else
		return doPlayerSendTextMessage (cid, 19, "Você já possui esta AURA.")
	end
   return true
end