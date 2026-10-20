function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
	local trono_storage = getPlayerStorageValue(cid, 45220) + 1

	if item.uid == 45228 and getPlayerStorageValue(cid, 45220) >= 1 then
		return false
		
	elseif item.uid == 45229 and getPlayerStorageValue(cid, 45220) >= 2 then
		return false
	
	elseif item.uid == 45230 and getPlayerStorageValue(cid, 45220) >= 3 then
		return false
		
	elseif item.uid == 45231 and getPlayerStorageValue(cid, 45220) >= 4 then
		return false
		
	elseif item.uid == 45232 and getPlayerStorageValue(cid, 45220) >= 5 then
		return false
		
	elseif item.uid == 45233 and getPlayerStorageValue(cid, 45220) >= 6 then
		return false
		
	elseif item.uid == 45234 and getPlayerStorageValue(cid, 45220) >= 7 then
		return false
	
	else
		doTeleportThing(cid, {x = 132, y = 1942, z = 12})
		doCreatureSay(cid, "Você tem: ".. getPlayerStorageValue(cid, 45220) .."/7 tronos.", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 37)
	end
	return true
end