function onUse(cid, item, itemEx, topos, frompos) 
local ITEM_ID1 = {
	[10309] = 10311
}
local ITEM_ID2 = {
	[10309] = 10312
}

    if getPlayerLevel(cid) < 100 then 
        return doPlayerSendCancel(cid, "You do not have enough level to use this.") 
    end

	if (item.itemid == 10309) then
		local ran = math.random(1, 100)
		if ran < 80 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have been cured.") 
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
			doTransformItem(item.uid, ITEM_ID1[item.itemid])
			doDecayItem(item.uid)
			
			if getCreatureCondition(cid, CONDITION_FIRE) == true then
				doRemoveCondition(cid, CONDITION_FIRE)
			end
			if getCreatureCondition(cid, CONDITION_POISON) == true then
				doRemoveCondition(cid, CONDITION_POISON)
			end
			if getCreatureCondition(cid, CONDITION_ENERGY) == true then
				doRemoveCondition(cid, CONDITION_ENERGY)
			end
			if getCreatureCondition(cid, CONDITION_BLEEDING) == true then
				doRemoveCondition(cid, CONDITION_BLEEDING)
			end
			if getCreatureCondition(cid, CONDITION_CURSED) == true then
				doRemoveCondition(cid, CONDITION_CURSED)
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Item is broken. (60 minutes)") 
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
			doTransformItem(item.uid, ITEM_ID2[item.itemid])
			doDecayItem(item.uid)
			doCreatureAddHealth(cid, -200)
			doSendAnimatedText(getThingPos(cid), "-200 HP", COLOR_RED)
		end
	else
		doPlayerSendCancel(cid, "You cannot use this object.") 
	end
   return true
end