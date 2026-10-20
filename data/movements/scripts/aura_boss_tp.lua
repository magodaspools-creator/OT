local config = {
	pos = {x = 1018, y = 1909, z = 8} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12702 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		if getPlayerStorageValue(cid, 45302) <= 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "FALE COM O NPC EMISSARY OF THE AURA PEGAR SUA AURA!!! Não saia da sala sem pegar sua AURA ou vai precisar fazer a quest novamente.")
			setPlayerStorageValue(cid, 45302, 1)
		end
	end
   return true
end