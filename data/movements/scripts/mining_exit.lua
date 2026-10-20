local config = {
	pos = {x = 2041, y = 2046, z = 7} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	doTeleportThing(cid, config.pos)
	doSendMagicEffect(getCreaturePosition(cid), 10)
	setPlayerStorageValue(cid, 45393, 0)
   return true
end