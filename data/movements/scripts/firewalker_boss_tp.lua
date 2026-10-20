local config = {
	pos = {x = 316, y = 2162, z = 9} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12699 then
		if getPlayerLevel(cid) >= 80 then
			doTeleportThing(cid, config.pos)
			doSendMagicEffect(getCreaturePosition(cid), 10)
		else
			doTeleportThing(cid, fromPosition)
			doSendMagicEffect(getCreaturePosition(cid), 10)
			doCreatureSay(cid, "Você precisa ser 80+ para entrar no portal.", TALKTYPE_ORANGE_1, false, 0, position)
		end
	end
   return true
end