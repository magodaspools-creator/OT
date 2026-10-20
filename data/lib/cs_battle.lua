_Lib_Battle_Info = {
	Reward = {
		exp = {false, 100}, items = {true, 12686, 1}, premium_days = {false, 1}
	},

	TeamOne = {name = "Counter Terrorist", storage = 140120, pos = {x=450,y=304,z=7}},
	TeamTwo = {name = "Terrorist",storage = 140121,pos = {x=401,y=290,z=6}},
	storage_count = 180400,
	tpPos = {x=295, y=101, z=8},
	limit_Time = 5 -- limite de tempo para entrar no evento
}

function resetBattle()
	setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
	setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
end

function OpenWallBattle()
local B = {
	{1544,{x=446, y=301, z=7, stackpos = 1}},
	{1544,{x=447, y=301, z=7, stackpos = 2}},
	{1544,{x=448, y=301, z=7, stackpos = 2}},
	{1544,{x=446, y=308, z=7, stackpos = 2}},
	{1544,{x=447, y=308, z=7, stackpos = 1}},
	{1544,{x=448, y=308, z=7, stackpos = 1}},
	{1544,{x=400, y=287, z=6, stackpos = 1}},
	{1544,{x=401, y=287, z=6, stackpos = 1}},
	{1544,{x=402, y=287, z=6, stackpos = 1}},
	{1544,{x=403, y=287, z=6, stackpos = 1}},
	{1544,{x=404, y=287, z=6, stackpos = 2}},
	{1544,{x=400, y=293, z=6, stackpos = 2}},
	{1544,{x=401, y=293, z=6, stackpos = 1}},
	{1544,{x=402, y=293, z=6, stackpos = 2}},
	{1544,{x=403, y=293, z=6, stackpos = 1}},
	{1544,{x=404, y=293, z=6, stackpos = 1}},
	{1544,{x=405, y=293, z=6, stackpos = 2}}
}

	for i = 1, #B do
		if getTileItemById(B[i][2], B[i][1]).uid == 0 then
			doCreateItem(B[i][1], 1, B[i][2])
		else
			doRemoveItem(getThingfromPos(B[i][2]).uid,1)
		end
	end
end

function doBroadCastBattle(type, msg)
	for _, cid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
			doPlayerSendTextMessage(cid,type,msg)
		end
	end
end

function removeBattleTp()
local t = getTileItemById(_Lib_Battle_Info.tpPos, 1387).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(_Lib_Battle_Info.tpPos, CONST_ME_POFF)
end

function getWinnersBattle(storage)
local str, c = "" , 0
	for _, cid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, storage) == 1 then
			if _Lib_Battle_Info.Reward.exp[1] == true then doPlayerAddExperience(cid, _Lib_Battle_Info.Reward.exp[2]) end
			if _Lib_Battle_Info.Reward.items[1] == true then doPlayerAddItem(cid, _Lib_Battle_Info.Reward.items[2], _Lib_Battle_Info.Reward.items[3]) end
			if _Lib_Battle_Info.Reward.premium_days[1] == true then doPlayerAddPremiumDays(cid, _Lib_Battle_Info.Reward.premium_days[2]) end	
			doRemoveCondition(cid, CONDITION_OUTFIT)			
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			setPlayerStorageValue(cid, storage, -1)
			c = c+1 
		end
	end

	str = str .. "[CS Battle Event] Evento finalizado! "..c.." Jogador "..(c > 1 and "s" or "").." do time "..(getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 and _Lib_Battle_Info.TeamTwo.name or _Lib_Battle_Info.TeamOne.name).." ganhou o evento!"
	resetBattle()
	OpenWallBattle()
	return doBroadcastMessage(str)
end

function CheckEvent(delay)
	if delay > 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		doBroadcastMessage("[CS Battle Event] Faltam "..getGlobalStorageValue(_Lib_Battle_Info.storage_count).." players para dar início ao evento.")
	elseif delay == 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		for _, cid in pairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
				doRemoveCondition(cid, CONDITION_OUTFIT)
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, -1)
				setPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage, -1)
			end
		end

		doBroadcastMessage("[CS Battle Event] O evento não foi iniciado por falta de jogadores.")
		setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
		resetBattle()
		removeBattleTp()
	end

	addEvent(CheckEvent, 60000, delay-1)
end