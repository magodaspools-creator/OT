local config = {
	MSG_EAT = "You take a gulp from the large bowl, but there's still some blackjack in it.",
	MSG_GONE = "You take the last gulp from the large bowl. No leftovers!"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 45822) - os.time() > 0 then
	return doPlayerSendCancel(cid, "Aguarde ".. convertTime(getPlayerStorageValue(cid, 45822) - os.time()) .." para comer um special food novamente.")
end

	local food = SPECIAL_FOODS[item.itemid]
	if(food == nil) then
		return false
	end

	local addHealth = getCreatureMaxHealth(cid) - getCreatureHealth(cid)

	if(item.actionid < 3500) then
		doSetItemActionId(item.uid, 3500)
		if(addHealth > 0) then
			doCreatureAddHealth(cid, addHealth)
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, config.MSG_EAT)
		setPlayerStorageValue(cid, 45822, os.time()+30)

	elseif(item.actionid >= 3500 and item.actionid <= 3501) then
		doSetItemActionId(item.uid, item.actionid + 1)
		if(addHealth > 0) then
			doCreatureAddHealth(cid, addHealth)
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, config.MSG_EAT)
		setPlayerStorageValue(cid, 45822, os.time()+30)

	elseif(item.actionid == 3502) then
		doSetItemActionId(item.uid, item.actionid + 1)
		if(addHealth > 0) then
			doCreatureAddHealth(cid, addHealth)
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, config.MSG_GONE)
		doRemoveItem(item.uid, 1)
		setPlayerStorageValue(cid, 45822, os.time()+5*60)
	end

	doCreatureSay(cid, food, TALKTYPE_MONSTER)
	return true
end
