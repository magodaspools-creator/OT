local config = {
	pos = {x = 275, y = 1936, z = 8} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 9739 then
		if getPlayerStorageValue(cid, 45262) <= 0 then
			setPlayerStorageValue(cid, 45262, 1)
			doPlayerAddOutfit(cid, 366, 0) -- WAYFARER ADDON FEMALE
			doPlayerAddOutfit(cid, 367, 0) -- WAYFARER ADDON MALE
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a quest e recebeu Wayfarer Outfit.")
		end
	
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	end
   return true
end