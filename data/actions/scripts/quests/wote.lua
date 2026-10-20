local areafrom = {x = 279, y = 1943, z = 8} -- ENTRADA from
local areato = {x = 284, y = 1948, z = 8} -- ENTRADA to
local newpos = {x=281,y=1945,z=9} -- POS ONDE OS PLAYERS VAO

local from = {x = 272, y = 1937, z = 9} -- SALA DO BOSS
local to = {x = 290, y = 1955, z = 9} -- SALA DO BOSS
local kickpos = {x = 283, y = 1936, z = 8} -- PARA ONDE O PLAYER VAI AO SER KIKADO
local timetokick = {10, "min"} -- tempo para ser kikado da sala do boss
local boss = {x = 286, y = 1945, z = 9} -- ONDE O BOSS VAI SER SUMONADO
local nobug = {x = 281, y = 1945, z = 9} -- NÂO MECHA
local leverpos = {x = 283, y = 1949, z = 8}

local function doRemoveMonstersInArea(from, to)
	for x = from.x, to.x do
		for y = from.y, to.y do
			local pos = {x=x, y=y, z = from.z}
			local m = getTopCreature(pos).uid
			if m > 0 and isMonster(m) then
				doRemoveCreature(m)
			end
		end
	end
end

local function kickPlayerFromArea(cid, p)
	for _, pid in ipairs(getPlayersOnline()) do
		if isPlayer(pid) and isInRange(getPlayerPosition(pid), p[1], p[2]) then
			doTeleportThing(pid, p[3])
			doSendMagicEffect(p[3], CONST_ME_TELEPORT)
			doCreatureSay(pid, 'You were kicked out of the room.', TALKTYPE_ORANGE_1)
		end
	end
end

local function getCreaturesFromArea(fromPos, toPos,checkFunction)
    local grwe = {};
    checkFunction = checkFunction or function(arg) return true; end;
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(checkFunction(tmp))then
                    table.insert(grwe, tmp);
                end
            end
        end
    end
    local tmp = getTopCreature(nobug).uid;
    if(checkFunction(tmp))then
        table.insert(grwe, tmp);
    end
    return grwe;
end

local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
	for i, v in pairs(unit) do
		if v == table[2] then
			return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
		end
	end
	
	return error("Bad declaration in mathtime function.")
end

local function changeBack(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

function onUse(cid, item, frompos, item2, topos)
local players = getPlayersInArea(areafrom, areato);
local players_boss = getCreaturesFromArea(from, to, isPlayer);

	if item.itemid == 1945 then
        if #players_boss > 0 then
			doCreatureSay(cid, "Someone else is in the room.", TALKTYPE_ORANGE_1)
			return true
        else
			doRemoveMonstersInArea(from, to)
			for i = 1, #players do
				doTeleportThing(players[i], newpos, false)
				doSendMagicEffect(getCreaturePosition(cid), 10)
			end
			
			doTransformItem(item.uid, item.itemid + 1)
			addEvent(changeBack, mathtime(timetokick) * 1000, leverpos)
			doCreateMonster("Snake God Essence", boss, false, true);
			doCreatureSay(cid, "You will be kicked from boss room in " .. timetokick[1] .. " "..timetokick[2]..".", TALKTYPE_MONSTER, nil, cid, newpos)
			addEvent(kickPlayerFromArea, mathtime(timetokick) * 1000, cid, {from, to, kickpos})
		end
		
	elseif item.itemid == 1946 then
		doCreatureSay(cid, "You need to wait " .. timetokick[1] .. " "..timetokick[2].." to use the lever.", TALKTYPE_ORANGE_1)
	end
	return true    
end
 