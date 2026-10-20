function onKill(cid, target, lastHit)
if isPlayer(target) then
	return true
end

    if getPlayerStorageValue(cid, arenaSvar.config.isIN) == 1 then
        local Room = arenaSvar.getArenaMonsterIdByName(getCreatureName(target))
        if Room ~= 0 then
            setPlayerStorageValue(cid, Room, 1)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, arenaSvar.Cancel[8])
        end
	end
	return true
end