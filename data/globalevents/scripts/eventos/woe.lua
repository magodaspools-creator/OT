dofile("./_woe.lua")

local config = woe_config

local reward = 100000 -- 100k

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

local function EndWoe()
	Woe.getInfo()
	setGlobalStorageValue(stor.Started, 0)
	setGlobalStorageValue(stor.WoeTime, 0)
	local players = Woe.expulsar({x=3752,y=2550,z=6}, {x=3870,y=2631,z=8});
	for i = 1, #players do
		doTeleportThing(players[i], Castle._exit, false)
	end
	
	doBroadcastMessage("[War Castle] A luta pelo castelo acabou!", config.bcType)
	doBroadcastMessage("[War Castle] O castelo foi dominado pela guild ".. Woe.guildName() ..".", config.bcType)
	
	if isCreature(getThingFromPos(Castle.empePos).uid) then
		doRemoveCreature(getThingFromPos(Castle.empePos).uid)
	end
	
	Woe.removePre()
	
	Woe.save()
	
	for _, cid in ipairs(getPlayersOnline()) do
		if infoLua[2] == getPlayerGuildId(cid) then
			doPlayerAddMoney(cid, reward)
		end
	end
	
	Woe.remove()
	setGlobalStorageValue(24503, -1)
	
end

function onThink(interval, lastExecution)
	Woe.getInfo()
	if Woe.isTime() then
		if not Woe.isStarted() then		
			doCreateMonster("empe", Castle.empePos, false, true);
			doCreateMonster("pre1", Castle.PreEmpes[1], false, true);
			doCreateMonster("pre2", Castle.PreEmpes[2], false, true);
			doRemoveMonstersInArea({x=3828,y=2619,z=8}, {x=3828,y=2619,z=8})
			doRemoveMonstersInArea({x=3865,y=2593,z=8}, {x=3865,y=2593,z=8})
			doRemoveMonstersInArea({x=3808,y=2591,z=7}, {x=3808,y=2591,z=7})
			doRemoveMonstersInArea({x=3817,y=2579,z=6}, {x=3817,y=2579,z=6})
			doCreateMonster("Antirush", {x=3828,y=2619,z=8}, false, true);
			doCreateMonster("Antirush", {x=3865,y=2593,z=8}, false, true);
			doCreateMonster("Antirush", {x=3808,y=2591,z=7}, false, true);
			doCreateMonster("Antirush", {x=3817,y=2579,z=6}, false, true);
			doBroadcastMessage("[War Castle] A luta pelo castelo começou!", config.bcType)
			setGlobalStorageValue(stor.Started, 1)
			Woe.updateInfo({os.time(), infoLua[2], infoLua[3], infoLua[4]})
			addEvent(doBroadcastMessage, 25 * 60 * 1000, "[War Castle] Faltam 5 minutos para o fim do evento.", config.bcType) 
			addEvent(EndWoe, config.timeToEnd * 60 * 1000)
		end
	end
	return true
end 	