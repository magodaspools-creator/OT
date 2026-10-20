local config = {
	pos = {x = 279, y = 2547, z = 10} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12834 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	end
   return true
end