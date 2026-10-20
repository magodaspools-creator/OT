function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if (item.actionid == 45373) then
		doTeleportThing(cid, {x = 319, y = 2427, z = 8})
		doSendMagicEffect(getCreaturePosition(cid), 10)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Ops, você pisou em um local errado. Não foi desta vez. Tente novamente :)")
	end
   return true
end