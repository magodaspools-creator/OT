arenaSvar = {
config = {
KickPosition = {x=292, y=2132, z=9}, -- posição EXIT do player
RewardsRoom = {x=287, y=2117, z=8}, -- sala de recompensa
arenaRoomMaxTime = 240, -- Tempo para permanecer na ROOM
TimeStor = 48350, -- STORAGE do tempo para permanecer na ROOM
myArenaLevel = 48351, -- here will be saved the arena level.
talkNPC = 48352, -- STORAGE que NPC pega para salvar se já fez.
isIN = 42352, -- to check if the player is in the arena.
myRoom = 46000, -- here will be saved the current room.
MonStor = 47000, -- here will be saved the monster uid.
LeavePortals = 42321, -- The action id of the portal to leave the rooms (south portals).
GobletTiles = {42360, 42370, 42380}, -- Action ids of the tiles for Bronze, Silver and Gold Goblets.
Checking = false,
RoomsACT = {42301, 42302, 42303, 42304, 42305, 42306, 42307, 42308, 42309}
},

Cancel = {
    [1] = "Reporte o Administrador.",
    [2] = "You have been kicked!",
    [3] = "You can't get this item",
    [4] = "It is empty.",
    [5] = "Reporte o Administrador.",
    [6] = "You already did all the arena levels.",
    [7] = "The time is over.",
    [8] = "You can go to the next room.",
    [9] = "Kill the monster first.",
    [10] = "is in the room yet."
},

Completed = {
    [1] = "Congatulations! you have completed the arena in",
    [2] = "difficulty! Now go and take your reward."
},
   
Arena = {
    -- greenshore
    [0] = {
        Cost = 10000,
        LevelName = 'greenshore',
        LevelNeeded = 30,
        Goblet = 5807
        },
    -- scrapper
    [1] = {
        Cost = 50000,
        LevelName = 'scrapper',
        LevelNeeded = 50,
        Goblet = 5806
        },
    -- warlord
    [2] = {
        Cost = 100000,
        LevelName = 'warlord', 
        LevelNeeded = 80,
        Goblet = 5805
        }
},

Rewards = {
    -- greenshore
    -- present with items.
    [42361] = {
        Stor = 42361,
        Cont = 1990,
        items = {7372, 6569, 6574, 2114},
        count = {1, 10, 1, 1}
        },
    -- blacksteel sword.
    [42362] = {
        Stor = 42361,
        Cont = nil,
        item = 7406
        },
    -- headchopper.
    [42363] = {
        Stor = 42361,
        Cont = nil,
        item = 7380
        },
    -- orcish maul.
    [42364] = {
        Stor = 42361,
        Cont = nil,
        item = 7392
        },
    -- backpack with items.
    [42365] = {
        Stor = 42361,
        Cont = 7342,
        items = {7365, 7364},
        count = {100, 100}
        },
    -- scrapper
    -- present with items.
    [42371] = {
        Stor = 42371,
        Cont = 1990,
        items = {7372, 6569, 6574, 7183},
        count = {1, 10, 1, 1}
        },
    -- mystic blade.
    [42372] = {
        Stor = 42371,
        Cont = nil,
        item = 7384
        },
    -- heroic axe.
    [42373] = {
        Stor = 42371,
        Cont = nil,
        item = 7389
        },
    -- cranial basher
    [42374] = {
        Stor = 42371,
        Cont = nil,
        item = 7415
        },
    -- backpack with items.
    [42375] = {
        Stor = 42371,
        Cont = 7342,
        items = {7365, 2547, 2547, 2311, 2304},
        count = {100, 100, 100, 50, 50}
        },
    -- warlord
    -- present with items.
    [42381] = {
        Stor = 42381,
        Cont = 1990,
        items = {7372, 6569, 6574, 6568},
        count = {1, 10, 1, 1}
        },
    -- justice seeker
    [42382] = {
        Stor = 42381,
        Cont = nil,
        item = 7390
        },
    -- royal axe
    [42383] = {
        Stor = 42381,
        Cont = nil,
        item = 7434
        },
    -- blessed sceptre
    [42384] = {
        Stor = 42381,
        Cont = nil,
        item = 7429
        },
    -- backpack with items
    [42385] = {
        Stor = 42381,
        Cont = 7342,
        items = {2273, 2268, 7443, 7440, 6529},
        count = {50, 50, 1, 1, 100}
        }
},

arena_monsters = {
    -- greenshore
    [48300] = "Frostfur",
    [48301] = "Bloodpaw",
    [48302] = "Bovinus",
    [48303] = "Achad",
    [48304] = "Colerian The Barbarian",
    [48305] = "The Hairy One",
    [48306] = "Axeitus Headbanger",
    [48307] = "Rocky",
    [48308] = "Cursed Gladiator",
    [48309] = "Orcus the Cruel",
	
	-- scrapper
	[48310] = "Avalanche",
	[48311] = "Kreebosh the Exile",
	[48312] = "The Dark Dancer",
	[48313] = "The Hag",
	[48314] = "Slim",
	[48315] = "Grimgor Guteater",
	[48316] = "Drasilla", 
	[48317] = "Spirit of Earth",
	[48318] = "Spirit of Water",
	[48319] = "Spirit of Fire",
	
	-- warlord
	[48320] = "Webster",
	[48321] = "Darakan the Executioner",
	[48322] = "Norgle Glacierbeard",
	[48323] = "The Pit Lord",
	[48324] = "Svoren the Mad",
	[48325] = "The Masked Marauder",
	[48326] = "Gnorre Chyllson",
	[48327] = "Fallen Mooh'tah Master Ghar",
	[48328] = "Deathbringer",
	[48329] = "The Obliverator"
},

Goblets = {
    [42360] = {Id = 5807, txt = "It is given to the courageous victor of the barbarian arena greenshore difficulty."},
    [42370] = {Id = 5806, txt = "It is given to the courageous victor of the barbarian arena scrapper difficulty."},
    [42380] = {Id = 5805, txt = "It is given to the courageous victor of the barbarian arena warlord difficulty."}
},

ArenaAdding = {
	[0] = 6000,
	[1] = 6010,
	[2] = 6020
 }
}

function arenaSvar.myArenaLevelIs(cid)
    Stor = getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel)
    if Stor == -1 then
        setPlayerStorageValue(cid, arenaSvar.config.myArenaLevel, 0)
        Stor = 0
    elseif Stor == 3 then
		Stor = 2
    end
	
    return {
        RC = arenaSvar.Arena[Stor].Cost,
        LN = arenaSvar.Arena[Stor].LevelName,
        RLV = arenaSvar.Arena[Stor].LevelNeeded,
        LV = getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel)
    }
end

function arenaSvar.getDirectionMove(cid, itempos)
    -- function by Nahruto
    p = getCreaturePosition(cid)
    i = itempos
    if p.x > i.x then
        if p.y > i.y then
            ret = NORTHWEST
        elseif p.y < i.y then
            ret = SOUTHWEST
        else
            ret = WEST
        end
    elseif p.x < i.x then
        if p.y > i.y then
            ret = NORTHEAST
        elseif p.y < i.y then
            ret = SOUTHEAST
        else
            ret = EAST
        end
    else
        if p.y > i.y then
            ret = NORTH
        elseif p.y < i.y then
            ret = SOUTH
        else
            ret = nil
        end
    end
    return ret
end
 
function arenaSvar.LeaveArena(cid)
    for i = 48300, 48329 do
        setPlayerStorageValue(cid, i, 0)
    end
    if isCreature(getPlayerStorageValue(cid, arenaSvar.config.MonStor)) == true then
        doRemoveCreature(getPlayerStorageValue(cid, arenaSvar.config.MonStor))
    end
	
    setGlobalStorageValue(getPlayerStorageValue(cid, arenaSvar.config.myRoom), 0)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, arenaSvar.Cancel[2])
    doTeleportThing(cid, arenaSvar.config.KickPosition, false)
    setPlayerStorageValue(cid, arenaSvar.config.TimeStor, 0)
    setPlayerStorageValue(cid, arenaSvar.config.isIN, 0)
end

function arenaSvar.CheckRooms()
    addEvent(arenaSvar.CheckRooms, 1000)
    for i = 42300, 42309 do
        local Player = getGlobalStorageValue(i)
        if isPlayer(Player) == true then
            local PlayerTime = getPlayerStorageValue(Player, arenaSvar.config.TimeStor)
            if PlayerTime <= os.time() then
                doTeleportThing(Player, arenaSvar.config.KickPosition, false)
                setPlayerStorageValue(Player, arenaSvar.config.TimeStor, 0)
                setGlobalStorageValue(i, 0)
                doPlayerSendTextMessage(Player,MESSAGE_STATUS_CONSOLE_ORANGE, arenaSvar.Cancel[7])
                
				if isCreature(getPlayerStorageValue(Player, arenaSvar.config.MonStor)) == true then
                    doRemoveCreature(getPlayerStorageValue(Player, arenaSvar.config.MonStor))
                end
            elseif PlayerTime - 10 <= os.time() then
                doPlayerSendTextMessage(Player, MESSAGE_EVENT_DEFAULT, "you have "..PlayerTime - os.time().." seconds left!")
            end
        else
            setGlobalStorageValue(i, 0)
        end
    end
end
 
function arenaSvar.getArenaMonsterIdByName(name)
    for i = 48300, 48329 do
        if tostring(arenaSvar.arena_monsters[i]) == string.lower(tostring(name)) then
            return i
        end
    end
    return false
end