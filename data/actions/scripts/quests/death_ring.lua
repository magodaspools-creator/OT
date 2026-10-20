function onUse(cid, item, item2, topos, frompos) 
local config = {
    level = 35,      -- Level minimo para dar USE 
    storage = 45422, -- Não Altere Isso 
    efeito = 28      -- Efeito que vai fazer qndo a quest for feita
} 

    if getPlayerLevel(cid) < config.level then 
        return doPlayerSendCancel(cid, "You do not have enough level to use this.") 
    end

    if getPlayerStorageValue(cid, config.storage) > 0 then 
		return doPlayerSendCancel(cid, "You already this quest.") 
    end

		local pos = getThingPos(cid) 
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received death ring.") 
        doSendMagicEffect(pos, config.efeito)
        setPlayerStorageValue(cid, config.storage, 1)
		doPlayerAddItem(cid, 6300, 1)
   return true
end