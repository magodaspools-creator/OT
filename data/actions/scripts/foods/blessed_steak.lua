function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 45822) - os.time() > 0 then
	return doPlayerSendCancel(cid, "Aguarde ".. convertTime(getPlayerStorageValue(cid, 45822) - os.time()) .." para comer um special food novamente.")
end

	local food = SPECIAL_FOODS[item.itemid]
	if(food == nil) then
		return false
	end

	doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
	doRemoveItem(item.uid, 1)

	doCreatureSay(cid, food, TALKTYPE_MONSTER)
	setPlayerStorageValue(cid, 45822, os.time()+5*60)
	return true
end
