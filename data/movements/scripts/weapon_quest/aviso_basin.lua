local config = {
	increasing = {[426] = 425},
	decreasing = {[425] = 426}
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end

	if(not config.increasing[item.itemid]) then
		return false
	end

	if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.increasing[item.itemid])
	end
	
	if (item.actionid == 45375) then
		if getPlayerStorageValue(cid, 45376) < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Para entrar no teleport, jogue 50 concentrated red crystals no coal basin. Você só precisa fazer este sacrifício 1 vez.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você já fez esse sacrifício e pode entrar direto no portal.")
		end
	end
   return true
end

function onStepOut(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if(not config.decreasing[item.itemid]) then
		return false
	end

	if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.decreasing[item.itemid])
		return true
	end

	return false
end