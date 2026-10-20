function onUse(cid, item, item2, topos, frompos) 
local config = {
    time = 29,       -- Tempo em minutos para usar novamente
    level = 8,      -- Level minimo para dar USE 
    storage = 42002, -- Não Altere Isso 
    efeito = 28      -- Efeito que vai fazer qndo a quest for feita
} 

    if getPlayerLevel(cid) < config.level then 
        return doPlayerSendCancel(cid, "You do not have enough level to use this.") 
    end

    if getPlayerStorageValue(cid, config.storage) > os.time() then 
	local minutes = (math.ceil((getPlayerStorageValue(cid, config.storage) - os.time())/60))
	local s = (math.ceil(((getPlayerStorageValue(cid, config.storage) - os.time())/60)) == 1 and "" or "s")
       return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Wait ".. minutes .." minute".. s .." to use again.") 
    end

		local pos = getThingPos(cid) 
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received brown mushrooms.") 
        doSendMagicEffect(pos, config.efeito)
        setPlayerStorageValue(cid, config.storage, config.time * 60 + os.time())
        local m = math.random (5, 15)
		doPlayerAddItem(cid, 2789, m)
   return true
end