local config = {
	pos = {x = 275, y = 2032, z = 8} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 9738 then
		if getPlayerStorageValue(cid, 45259) <= 0 then
			setPlayerStorageValue(cid, 45259, 1)
			doPlayerAddOutfit(cid, 324, 3) -- YALAHARI ADDON FEMALE
			doPlayerAddOutfit(cid, 325, 3) -- YALAHARI ADDON MALE
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a quest e recebeu Yalahari Outfit e Addon FULL.")
		end
	
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	end
   return true
end