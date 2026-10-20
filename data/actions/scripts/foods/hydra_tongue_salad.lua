local conditions = {
	CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY,
	CONDITION_PARALYZE, CONDITION_DRUNK, CONDITION_DROWN,
	CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 45822) - os.time() > 0 then
	return doPlayerSendCancel(cid, "Aguarde ".. convertTime(getPlayerStorageValue(cid, 45822) - os.time()) .." para comer um special food novamente.")
end

	local food = SPECIAL_FOODS[item.itemid]
	if(food == nil) then
		return false
	end

	for _, condition in ipairs(conditions) do
		if(getCreatureCondition(cid, condition)) then
			doRemoveCondition(cid, condition)
		end
	end

	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, food, TALKTYPE_MONSTER)
	setPlayerStorageValue(cid, 45822, os.time()+5*60)
	return true
end
