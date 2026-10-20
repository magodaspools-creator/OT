local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 15 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEE, 3)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, 3)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 3)
setConditionParam(condition, CONDITION_PARAM_SUBID, 100)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 45494) - os.time() > 0 then
		return doPlayerSendCancel(cid, "Aguarde ".. convertTime(getPlayerStorageValue(cid, 45494) - os.time()) .." para usar esse item novamente.")
	end

	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid ~= 12891 then
		return doPlayerSendCancel(cid, "Equip your Claw Ring.")
	end

	if(doAddCondition(cid, condition)) then
		doCreatureSay(cid, "EU TENHO A FORÇAA!!", TALKTYPE_MONSTER)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		setPlayerStorageValue(cid, 45494, os.time()+30*60)
	end
	return true
end
