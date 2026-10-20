function onUse(cid, item, itemEx, topos, frompos) 
local config = {
    level = 10,      -- Level minimo para dar USE 
    efeito = 28      -- Efeito que vai fazer qndo a quest for feita
}
local ITEM_IDS = {
	[5157] = 5156
}

    if getPlayerLevel(cid) < config.level then 
        return doPlayerSendCancel(cid, "You do not have enough level to use this.") 
    end

	if (item.actionid == 42021) and (item.itemid == 5157) then 
		local pos = getThingPos(cid)    
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received mangos.") 
		doSendMagicEffect(pos, config.efeito)
		local m = math.random (2, 6)
		doPlayerAddItem(cid, 5097, m)
		doTransformItem(item.uid, ITEM_IDS[item.itemid])
		doDecayItem(item.uid)
	else
		doPlayerSendCancel(cid, "You cannot use this object.") 
	end
   return true
end