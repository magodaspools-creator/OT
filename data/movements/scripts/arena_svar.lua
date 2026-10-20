function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

    local ArenaRoom = item.actionid 
    if item.actionid == arenaSvar.config.LeavePortals then
        arenaSvar.LeaveArena(cid)
    elseif isInArray(arenaSvar.config.GobletTiles, item.actionid) == true then
        local gobletPos = getThingPos(item.uid)
        if getPlayerStorageValue(cid, item.actionid) ~= 1 then
            setPlayerStorageValue(cid, item.actionid, 1)
            local Goblet = doCreateItemEx(arenaSvar.Goblets[item.actionid].Id, 1)
            doItemSetAttribute(Goblet, "description", "".. arenaSvar.Goblets[item.actionid].txt .."\nAwarded to "..getCreatureName(cid)..".")
            gobletPos.y = gobletPos.y - 1
            doTileAddItemEx(gobletPos, Goblet)
        end
		
        doTransformItem(item.uid, item.itemid - 1)
    elseif isInArray(arenaSvar.config.RoomsACT, ArenaRoom) == true or ArenaRoom == 42300 then
        if arenaSvar.config.Checking == false then
			arenaSvar.config.Checking = true
			arenaSvar.CheckRooms()
		end
		
        local myLevelArena = arenaSvar.myArenaLevelIs(cid).LV
        if arenaSvar.ArenaAdding[myLevelArena] then
            Mons = ArenaRoom + arenaSvar.ArenaAdding[myLevelArena]
        end
        if getGlobalStorageValue(ArenaRoom) == 0 then
            if isCreature(getPlayerStorageValue(cid, arenaSvar.config.MonStor)) == false then
                if ArenaRoom == 42300 and getPlayerStorageValue(cid, arenaSvar.config.talkNPC) == 1 then
                    setPlayerStorageValue(cid, arenaSvar.config.talkNPC, 0)
                    setPlayerStorageValue(cid, arenaSvar.config.isIN, 1)
                    P = 1
                elseif ArenaRoom ~= 42300 and getPlayerStorageValue(cid, arenaSvar.config.isIN) == 1 then
                    P = 1
                else
                    P = nil
                end    
                if P ~= nil then
                    local SpawnPos = getThingPos(ArenaRoom)
                    doTeleportThing(cid, SpawnPos, false)
                    SpawnPos.x = SpawnPos.x - 1
                    SpawnPos.y = SpawnPos.y - 1
                    local Monster = doSummonCreature(arenaSvar.arena_monsters[Mons], SpawnPos)
                    setGlobalStorageValue(ArenaRoom, cid)
                    setGlobalStorageValue(ArenaRoom - 1, 0)
                    setPlayerStorageValue(cid, arenaSvar.config.TimeStor, os.time()+arenaSvar.config.arenaRoomMaxTime)
                    setPlayerStorageValue(cid, arenaSvar.config.MonStor, Monster)
                    setPlayerStorageValue(cid, arenaSvar.config.myRoom, ArenaRoom)
                else
                    arenaSvar.LeaveArena(cid)
                end
            else
                doTeleportThing(cid, fromPosition, true)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, arenaSvar.Cancel[9])
            end
        else
            doTeleportThing(cid, fromPosition, true)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "".. getCreatureName(getGlobalStorageValue(cid, ArenaRoom)) .." ".. arenaSvar.Cancel[10] .."")
        end
    elseif ArenaRoom == 42310 then
        if isCreature(getPlayerStorageValue(cid, arenaSvar.config.MonStor)) == false then
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"".. arenaSvar.Completed[1] .." ".. arenaSvar.myArenaLevelIs(cid).LN .." ".. arenaSvar.Completed[2] .."")
            setPlayerStorageValue(cid, arenaSvar.config.myArenaLevel, getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel) + 1)
            setGlobalStorageValue(ArenaRoom - 1, 0)
            setPlayerStorageValue(cid, arenaSvar.config.TimeStor, 0)
            setPlayerStorageValue(cid, arenaSvar.config.isIN, 0)
            doTeleportThing(cid, arenaSvar.config.RewardsRoom, true)
			
			if getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel) == 1 then
				setPlayerStorageValue(cid, 48297, 1)
			elseif getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel) == 2 then
				setPlayerStorageValue(cid, 48298, 1)
			elseif getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel) == 3 then
				setPlayerStorageValue(cid, 48299, 1)
			end
        else
            doTeleportThing(cid, fromPosition, true)
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,'ERRO! Contacte um administrador.')
        end
    end
    return true
end