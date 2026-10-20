local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function bc_monstros()
	doCreateMonster("Chief Skeleton Warrior", {x=853,y=2294,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=855,y=2294,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=858,y=2294,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Warrior", {x=853,y=2291,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=855,y=2291,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=858,y=2291,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Archer", {x=853,y=2288,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=855,y=2288,z=8}, false, true);
	doCreateMonster("Chief Skeleton Archer", {x=858,y=2288,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Archer", {x=853,y=2285,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=855,y=2285,z=8}, false, true);
	doCreateMonster("Chief Skeleton Archer", {x=858,y=2285,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Archer", {x=853,y=2278,z=8}, false, true);
	doCreateMonster("Chief Skeleton Archer", {x=855,y=2278,z=8}, false, true);
	doCreateMonster("Chief Skeleton Archer", {x=858,y=2278,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Warrior", {x=853,y=2275,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=855,y=2275,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=858,y=2275,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Warrior", {x=853,y=2274,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=855,y=2274,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=858,y=2274,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Warrior", {x=853,y=2270,z=8}, false, true);
	doCreateMonster("Chief Skeleton Archer", {x=855,y=2270,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=858,y=2270,z=8}, false, true);
	
	doCreateMonster("Chief Skeleton Archer", {x=853,y=2263,z=8}, false, true);
	doCreateMonster("Chief Skeleton Warrior", {x=855,y=2263,z=8}, false, true);
	doCreateMonster("Chief Skeleton Archer", {x=858,y=2263,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Warrior", {x=853,y=2259,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=855,y=2259,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=858,y=2259,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Warrior", {x=853,y=2255,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=855,y=2255,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=858,y=2255,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Warrior", {x=853,y=2254,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=855,y=2254,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=858,y=2254,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Warrior", {x=853,y=2252,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=855,y=2252,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=858,y=2252,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Knight", {x=853,y=2245,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=855,y=2245,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=858,y=2245,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Knight", {x=853,y=2244,z=8}, false, true);
	doCreateMonster("Red Skeleton Warrior", {x=855,y=2244,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=858,y=2244,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Knight", {x=853,y=2240,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=855,y=2240,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=858,y=2240,z=8}, false, true);
	
	doCreateMonster("Red Skeleton Knight", {x=853,y=2235,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=855,y=2235,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=858,y=2235,z=8}, false, true);
	
	doCreateMonster("Giant Ogre", {x=853,y=2234,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=855,y=2234,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=858,y=2234,z=8}, false, true);
	
	doCreateMonster("Giant Ogre", {x=853,y=2232,z=8}, false, true);
	doCreateMonster("Red Skeleton Knight", {x=855,y=2232,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=858,y=2232,z=8}, false, true);
	
	doCreateMonster("Dark Skull Soldier", {x=853,y=2231,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=855,y=2231,z=8}, false, true);
	doCreateMonster("Dark Skull Soldier", {x=858,y=2231,z=8}, false, true);
	
	doCreateMonster("Dark Skull Soldier", {x=853,y=2220,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=855,y=2220,z=8}, false, true);
	doCreateMonster("Dark Skull Soldier", {x=858,y=2220,z=8}, false, true);
	
	doCreateMonster("Dark Skull Soldier", {x=853,y=2218,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=855,y=2218,z=8}, false, true);
	doCreateMonster("Dark Skull Soldier", {x=858,y=2218,z=8}, false, true);
	
	doCreateMonster("Dark Skull Soldier", {x=853,y=2217,z=8}, false, true);
	doCreateMonster("Giant Ogre", {x=855,y=2217,z=8}, false, true);
	doCreateMonster("Dark Skull Soldier", {x=858,y=2217,z=8}, false, true);
	
	doCreateMonster("Dark Skull Soldier", {x=853,y=2216,z=8}, false, true);
	doCreateMonster("Dark Skull Soldier", {x=855,y=2216,z=8}, false, true);
	doCreateMonster("Dark Skull Soldier", {x=858,y=2216,z=8}, false, true);
	
	doCreateMonster("Bc Gate", {x=856,y=2206,z=8}, false, true);
	return true
end

local function bc_stones()
	local pedra1 = getTileItemById({x=853,y=2303,z=8}, 1355).uid
	local pedra2 = getTileItemById({x=854,y=2303,z=8}, 1355).uid
	local pedra3 = getTileItemById({x=855,y=2303,z=8}, 1355).uid
	local pedra4 = getTileItemById({x=856,y=2303,z=8}, 1355).uid
	local pedra5 = getTileItemById({x=857,y=2303,z=8}, 1355).uid
	local pedra6 = getTileItemById({x=858,y=2303,z=8}, 1355).uid
	local pedra7 = getTileItemById({x=859,y=2303,z=8}, 1355).uid
	if pedra1 > 0 and pedra2 > 0 and pedra3 > 0 and pedra4 > 0 and pedra5 > 0 and pedra6 > 0 and pedra7 > 0 then
		doRemoveItem(pedra1, 1)
		doRemoveItem(pedra2, 1)
		doRemoveItem(pedra3, 1)
		doRemoveItem(pedra4, 1)
		doRemoveItem(pedra5, 1)
		doRemoveItem(pedra6, 1)
		doRemoveItem(pedra7, 1)
	end
	return true
end

function onTime()
	
	local players_tp = getPlayersInArea({x=297,y=103,z=8}, {x=297,y=103,z=8})
	local tp_go = {x=856,y=2311,z=8}
	local tp_start = {x=297,y=103,z=8}
	if players_tp then
		for _, v in next, players_tp do
			doTeleportThing(v, getTownTemplePosition(1))
			doPlayerSendTextMessage(v, MESSAGE_STATUS_CONSOLE_BLUE, "Não pode ficar no local onde o TP abriu. Você foi teleportado para o templo.")
		end
	end
	
	doCreateTeleport(1387, tp_go, tp_start)
	doBroadcastMessage("[Blood Castle] Evento vai começar em 5 minutos! O teleport se encontra na sala de eventos.")
	addEvent(doBroadcastMessage, 3*1000*60, "[Blood Castle] Evento vai começar em 2 minutos! O teleport se encontra na sala de eventos.")
	addEvent(doBroadcastMessage, 4*1000*60, "[Blood Castle] Evento vai começar em 1 minuto! O teleport se encontra na sala de eventos.")
	addEvent(bc_monstros, 4*1000*60)
	addEvent(doBroadcastMessage, 5*1000*60, "[Blood Castle] Evento iniciado! O teleport se encontra na sala de eventos. Você pode entrar a qualquer momento até o Archangel ser derrotado.")
	addEvent(bc_stones, 5*1000*60)
	return true
end
