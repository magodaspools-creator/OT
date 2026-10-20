dofile("./_woe.lua")

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

local config = woe_config
	
function onDeath(cid, corpse, deathList)
	local killer = deathList[1]
	Woe.getInfo()
	if Woe.isTime() then
		if isPlayer(killer) == true then
			if Woe.isRegistered(killer) then
				local Guild_ID = getPlayerGuildId(killer)
				local players = Woe.expulsar({x=3752,y=2550,z=6}, {x=3870,y=2631,z=8});
				Woe.updateInfo({infoLua[1], Guild_ID, getPlayerGUID(killer), os.time()})
				doBroadcastMessage("[War Castle] O castle foi conquistado pelo jogador " .. getCreatureName(killer) .. " para a guild " .. getPlayerGuildName(killer) .. ".", config.bcType)
				Woe.deco("[War Castle] A guild " .. getPlayerGuildName(killer) .. " é agora dominante do castle.")
				for i = 1, #players do
					if (getPlayerGuildId(players[i]) ~= Guild_ID) then
						doTeleportThing(players[i], Castle._exit, false)
					end
				end
			end
		end
		if isCreature(cid) == true then
			doRemoveCreature(cid)
		end
		
		Woe.removePre()
		Woe.remove()
		setGlobalStorageValue(24503, -1)
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
		local porta1 = getTileItemById({x=3853,y=2565,z=7}, 1544).uid
		local porta2 = getTileItemById({x=3854,y=2565,z=7}, 1544).uid
		if porta1 < 1 then
			doCreateItem(1544, 1, {x=3853,y=2565,z=7})
		end
		if porta2 < 1 then
			doCreateItem(1544, 1, {x=3854,y=2565,z=7})
		end
	end
	return true
end