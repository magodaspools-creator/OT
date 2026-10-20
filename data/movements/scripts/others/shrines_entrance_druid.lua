local positions = {
    [42036] = {x=157, y=1156, z=2}, -- Ice Position
    [42037] = {x=1856, y=2007, z=7} -- Earth Position
}
 
local base = 42035 -- StorageValue Base (salva a posição anterior do player)
local Vocations = {2,6}

function savePosition(cid, pos, base)
    setPlayerStorageValue(cid, base+1, pos.x)
    setPlayerStorageValue(cid, base+2, pos.y)
    setPlayerStorageValue(cid, base+3, pos.z)
end
 
function onStepIn(cid, item, pos, fromPos)
 if (not isPlayer(cid)) then
        return false
    end

	if getPlayerLevel(cid) < 30 then
		doCreatureSay(cid, 'You must be level 30 or higher.', TALKTYPE_ORANGE_1)
		doTeleportThing(cid, fromPos, true)
		return false
	end
	
	local newPos = positions[item.aid]
    if isPlayer(cid) and isInArray(Vocations,getPlayerVocation(cid)) then
        if newPos then
			savePosition(cid, fromPos, base)
            doSendMagicEffect(fromPos, CONST_ME_POFF)
            doTeleportThing(cid, newPos, true)
            doSendMagicEffect(newPos, CONST_ME_TELEPORT)
        end
	else
		doCreatureSay(cid, 'Only Druid can enter.', TALKTYPE_ORANGE_1)
		doTeleportThing(cid, fromPos, true)
    end
    return TRUE
end