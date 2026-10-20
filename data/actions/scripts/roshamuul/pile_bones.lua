function onUse(cid, item, frompos, item2, topos)
	local rand = math.random(1, 100)
	if item.itemid == 11253 and item.actionid == 45492 then
		if getPlayerStorageValue(cid, 45490) <= 0 then
			return doPlayerSendCancel(cid, "Speak with Sandomo to use this item.")
		else
			if rand > 25 then
				doTransformItem(item.uid, 12886)
				doDecayItem(item.uid)
				doCreateMonster("guzzlemaw", getCreaturePosition(cid), false, true);
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You ransack the pile but fail to find any useful parts.");
				doSendMagicEffect(topos, CONST_ME_MAGIC_RED)
			else
				doTransformItem(item.uid, 12886)
				doDecayItem(item.uid)
				local stor = getPlayerStorageValue(cid, 45491) + 1
				setPlayerStorageValue(cid, 45491, stor)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Amidst the pile of various bones you find a large, hollow part, similar to a pipe.");
				doSendMagicEffect(topos, CONST_ME_MAGIC_GREEN)
			end
		end
		
	elseif item.itemid == 12886 and item.actionid == 45492 then
		return doCreatureSay(cid, "Wait 2 minutes to use a pile.", TALKTYPE_ORANGE_1, false, 0, getCreaturePosition(cid))
	end
	return true
end