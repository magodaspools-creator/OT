local tp_worldboss = {x = 163, y = 194, z = 8}
local areaWorldBoss = {
[1] = {{x = 150, y = 168, z = 8}, {x = 178, y = 197, z = 8}}
}
function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
        return false
    end
    for _, v in pairs(areaWorldBoss) do
        for _, pid in pairs(getPlayersOnline()) do
            if (getPlayerIp(pid) == getPlayerIp(cid) and isInRange(getThingPos(pid), v[1], v[2])) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Só é permitido 1 jogador por IP na sala World Boss.")
				doTeleportThing(cid, fromPosition, false)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
                return true
            end
        end
    end
	
	if getPlayerLevel(cid) < 100 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Apenas jogadores level 100+")
		doTeleportThing(cid, fromPosition, false)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		return true
	end
	
	if getPlayerStorageValue(cid, 45459) <= 0 then
		doTeleportThing(cid, tp_worldboss, false)
		setPlayerStorageValue(cid, 45459, 1)
	end
    return true
end