local config = {
    bosses={---aid of portal, position where it sends, value it sets, text it shows
        [39001] = {pos={x=497, y=1939, z=11, stackpos=0}, value=1, text="Entering The Crystal Caves"},
        [39002] = {pos={x=636, y=1902, z=10, stackpos=0}, value=2, text="Entering The Blood Halls"},
        [39003] = {pos={x=524, y=1993, z=8, stackpos=0}, value=3, text="Entering The Vats"},
        [39004] = {pos={x=470, y=2076, z=8, stackpos=0}, value=4, text="Entering The Arcanum"},
        [39005] = {pos={x=712, y=2093, z=11, stackpos=0}, value=5, text="Entering The Hive"},
        [39006] = {pos={x=645, y=1965, z=8, stackpos=0}, value=6, text="Entering The Shadow Nexus"}
        },
    mainroom={---aid, position, lowest value that can use this portal, text
        [39007] = {pos={x=497, y=1939, z=11, stackpos=1}, value=1, text="Entering The Crystal Caves"},
        [39008] = {pos={x=636, y=1902, z=10, stackpos=1}, value=2, text="Entering The Blood Halls"},
        [39009] = {pos={x=524, y=1993, z=8, stackpos=1}, value=3, text="Entering The Vats"},
        [39010] = {pos={x=470, y=2076, z=8, stackpos=1}, value=4, text="Entering The Arcanum"},
        [39011] = {pos={x=712, y=2093, z=11, stackpos=1}, value=5, text="Entering The Hive"}  },
    portals={---aid, position, text
        [39012] = {pos={x=394, y=2036, z=10}, text="Entering Inquisition Portals Room"},
        [39013] = {pos={x=453, y=1939, z=8}, text="Entering The Ward of Ushuriel"},
        [39014] = {pos={x=461, y=1893, z=8}, text="Entering The Undersea Kingdom"},
        [39015] = {pos={x=569, y=1888, z=8}, text="Entering The Ward of Zugurosh"},
        [39016] = {pos={x=621, y=1918, z=8}, text="Entering The Foundry"},
        [39017] = {pos={x=588, y=1940, z=8}, text="Entering The Ward of Madareth"},
        [39018] = {pos={x=518, y=2037, z=8}, text="Entering The Battlefield"},
        [39019] = {pos={x=486, y=2053, z=8}, text="Entering The Brothers' Ward"},
        [39020] = {pos={x=633, y=2030, z=8}, text="Entering The Soul Wells"},
        [39021] = {pos={x=702, y=2091, z=8}, text="Entering The Ward of Annihilon"},
        [39022] = {pos={x=696, y=1994, z=8}, text="Entering The Ward of Hellgorak"}  },
    storage=39000,---storage used in boss and mainroom portals
    e={}    }----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE then
        if(config.bosses[item.actionid]) then
            local t= config.bosses[item.actionid]
            if getPlayerStorageValue(cid, config.storage)< t.value then
                setPlayerStorageValue(cid, config.storage, t.value)
            end
            doTeleportThing(cid, t.pos)
            doSendMagicEffect(getCreaturePosition(cid),10)
            doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
        elseif(config.mainroom[item.actionid]) then
            local t= config.mainroom[item.actionid]
            if getPlayerStorageValue(cid, config.storage)>=t.value then
                doTeleportThing(cid, t.pos)
                doSendMagicEffect(getCreaturePosition(cid),10)
                doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
            else
                doTeleportThing(cid, fromPosition)
                doSendMagicEffect(getCreaturePosition(cid),10)
                doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1, false, 0, position)
            end
        elseif(config.portals[item.actionid]) then
            local t= config.portals[item.actionid]
            doTeleportThing(cid, t.pos)
            doSendMagicEffect(getCreaturePosition(cid),10)
            doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
        end
    end
end