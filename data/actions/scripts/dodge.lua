local config = {
	effectonuse = 14, -- efeito que sai
	levelsdodge = 100,  --- leveis que terão
	storagedodge = 45820 -- storage que será verificado
}
   
function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storagedodge) < config.levelsdodge then
		if doRemoveItem(item.uid, 1) then
			doSendMagicEffect(topos,config.effectonuse)
			doPlayerSendTextMessage(cid,22,"Você melhorou seu Dodge Skill: ["..(getPlayerStorageValue(cid, config.storagedodge)+1).."/100].")
			setPlayerStorageValue(cid, config.storagedodge, getPlayerStorageValue(cid, config.storagedodge)+1)
		else
			doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
			return false
		end
		
	elseif getPlayerStorageValue(cid, config.storagedodge) >= config.levelsdodge then
		doPlayerSendTextMessage(cid,22,"Você já atingiu o nível MAX de Dodge Skill.")
		return false
	end
	return true
end