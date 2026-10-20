function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
    if isPlayer(cid) and isPremium(cid) then
        doPlayerSendTextMessage(cid, 25, "Bem vindo! Você tem "..getPlayerPremiumDays(cid).." dia(s) de VIP Account.")
    else
        doTeleportThing(cid, fromPosition, true)
        doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
        doPlayerSendTextMessage(cid, 25, "Desculpe, apenas jogadores VIP podem acessar esta área!")
    end
    return true
end