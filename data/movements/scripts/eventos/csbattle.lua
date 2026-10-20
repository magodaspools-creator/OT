function onStepIn(cid, item, position, fromPosition)
if not isPlayer(cid) then return true end

local conditionBlack = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionBlack, CONDITION_PARAM_TICKS, -1)
if getPlayerSex(cid) == 0 then
	addOutfitCondition(conditionBlack, {lookType = 142, lookHead = 114, lookBody = 114, lookLegs = 49, lookFeet = 114})
else
	addOutfitCondition(conditionBlack, {lookType = 134, lookHead = 114, lookBody = 114, lookLegs = 49, lookFeet = 114})
end
	
local conditionRed = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRed, CONDITION_PARAM_TICKS, -1)
if getPlayerSex(cid) == 0 then
	addOutfitCondition(conditionRed, {lookType = 136, lookHead = 114, lookBody = 97, lookLegs = 30, lookFeet = 76})
else
	addOutfitCondition(conditionRed, {lookType = 128, lookHead = 114, lookBody = 97, lookLegs = 30, lookFeet = 76})
end
	
	if getPlayerAccess(cid) > 3 then
		return doTeleportThing(cid, _Lib_Battle_Info.TeamOne.pos)
	end

	if getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		local getMyTeam = getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) < getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage) and {_Lib_Battle_Info.TeamOne.storage,_Lib_Battle_Info.TeamOne.pos,_Lib_Battle_Info.TeamOne.name,conditionBlack}  or {_Lib_Battle_Info.TeamTwo.storage,_Lib_Battle_Info.TeamTwo.pos, _Lib_Battle_Info.TeamTwo.name, conditionRed}
		doAddCondition(cid, getMyTeam[4])
		setPlayerStorageValue(cid,getMyTeam[1], 1)
		setGlobalStorageValue(getMyTeam[1], getGlobalStorageValue(getMyTeam[1])+1)
		doTeleportThing(cid, getMyTeam[2])
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[CS Battle Event] Você entrou no time: " .. getMyTeam[3] .. "!")
		setGlobalStorageValue(_Lib_Battle_Info.storage_count, getGlobalStorageValue(_Lib_Battle_Info.storage_count)-1)
	end
	
	if getGlobalStorageValue(_Lib_Battle_Info.storage_count) == 0 then
		removeBattleTp()
		doBroadcastMessage("[CS Battle Event] Evento vai começar em 2 minutos! Monte sua estratégia e boa sorte!")
		addEvent(doBroadcastMessage, 2*60*1000-500, "[CS Battle Event] O Evento começou!")
		addEvent(OpenWallBattle, 2*60*1000)
	end
	return true
end