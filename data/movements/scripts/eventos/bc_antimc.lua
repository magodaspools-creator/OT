local tp_bc = {x = 856, y = 2311, z = 8}
local areasbc = {
[1] = {{x = 838, y = 2183, z = 8}, {x = 872, y = 2302, z = 8}}
}
function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return false
end
 
	for _, v in pairs(areasbc) do
        for _, pid in pairs(getPlayersOnline()) do
            if (getPlayerIp(pid) == getPlayerIp(cid) and isInRange(getThingPos(pid), v[1], v[2])) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Só é permitido 1 jogador por IP no evento.")
                doTeleportThing(cid, tp_bc, false)
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
                return true
            end
        end
    end     														
    return true
end