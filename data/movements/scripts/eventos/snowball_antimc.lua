local tp_temple = {x = 2052, y = 2051, z = 7}
local areasSnowBall = {
[1] = {{x = 497, y = 196, z = 6}, {x = 505, y = 204, z = 6}},
[2] = {{x = 479, y = 178, z = 7}, {x = 524, y = 223, z = 7}}
}
function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return false
end
 
	for _, v in pairs(areasSnowBall) do
        for _, pid in pairs(getPlayersOnline()) do
            if (getPlayerIp(pid) == getPlayerIp(cid) and isInRange(getThingPos(pid), v[1], v[2])) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Só é permitido 1 jogador por IP no evento.")
                doTeleportThing(cid, tp_temple, false)
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
                return true
            end
        end
    end     														
    return true
end