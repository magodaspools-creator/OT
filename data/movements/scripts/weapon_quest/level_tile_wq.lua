function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
    if getPlayerLevel(cid) >= 150 then
        return false
    else
        doTeleportThing(cid, fromPosition, true)
        doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
        doPlayerSendTextMessage(cid, 27, "Apenas jogadores 150+ podem entrar na quest.")
    end
    return true
end