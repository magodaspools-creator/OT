local tp_temple_daily = {x = 2052, y = 2051, z = 7}
local areasDaily = {
[1] = {{x = 293, y = 116, z = 9}, {x = 300, y = 120, z = 9}},
[2] = {{x = 305, y = 103, z = 9}, {x = 319, y = 117, z = 9}},
[3] = {{x = 233, y = 116, z = 9}, {x = 245, y = 124, z = 9}}
}
function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
        return false
    end
    for _, v in pairs(areasDaily) do
        for _, pid in pairs(getPlayersOnline()) do
            if (getPlayerIp(pid) == getPlayerIp(cid) and isInRange(getThingPos(pid), v[1], v[2])) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Só é permitido 1 jogador por IP na daily.")
                doTeleportThing(cid, tp_temple_daily, false)
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
                return true
            end
        end
    end
    return true
end