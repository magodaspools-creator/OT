local config = {
	pos = {x = 263, y = 2570, z = 8} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12837 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	end
   return true
end