local config = {
	pos = {x = 1039, y = 2470, z = 9} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12894 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		doPlayerPopupFYI(cid, "Você só poderá pegar 1 baú! Escolha com sabedoria.")
	end
   return true
end