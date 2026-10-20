local base = 42035 -- StorageValue Base (salva a posição anterior do player)

function getSavedPosition(cid, base)
    local pos = {}
    pos.x = getPlayerStorageValue(cid, base+1)
    pos.y = getPlayerStorageValue(cid, base+2)
    pos.z = getPlayerStorageValue(cid, base+3)
    return pos
end
 
function onStepIn(cid, item, pos, fromPos)
 if (not isPlayer(cid)) then
        return false
    end

    local savedPos = getSavedPosition(cid, base)
    if isPlayer(cid) then
        doSendMagicEffect(fromPos, CONST_ME_POFF)
        doTeleportThing(cid, savedPos, true)
        doSendMagicEffect(savedPos, CONST_ME_TELEPORT)
    end
    return true
end