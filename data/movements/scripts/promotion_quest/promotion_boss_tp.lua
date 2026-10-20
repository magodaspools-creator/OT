local config = {
	pos = {x = 1088, y = 1991, z = 12} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12701 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		if getPlayerStorageValue(cid, 45285) <= 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "FALE COM O NPC PROMOTER PARA PEGAR SUA PROMOTION!!!")
			setPlayerStorageValue(cid, 45285, 1)
		end
	end
   return true
end