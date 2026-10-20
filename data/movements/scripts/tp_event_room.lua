local pos = {x = 288, y = 110, z = 8}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
    if isPlayer(cid) then
		if getPlayerItemCount(cid, 2165) >= 1 or getPlayerItemCount(cid, 2202) >= 1 then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não pode entrar com stealth ring. Guarde seu ring de invisibilidade para poder entrar.")
		else
			if getCreatureCondition(cid, CONDITION_INVISIBLE) == true then
				doRemoveCondition(cid, CONDITION_INVISIBLE)
			end
			
			doTeleportThing(cid, pos, true)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		end
	end
    return true
end

function onAddItem(moveitem, tileitem, position)
	doRemoveItem(moveitem.uid, moveitem.type > 0 and moveitem.type or 1)
	return true
end