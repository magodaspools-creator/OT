local basinPos = {x=32594, y=31930, z=5}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local b = getPlayerStorageValue(cid, 42318) + 1 -- Contador da parede de fogo (orc fortress)
	if (itemEx.actionid == 42263) and (itemEx.itemid == 1485) then
		if getPlayerStorageValue(cid, 42257) == 10 then
			doTransformItem(itemEx.uid, 1483)
			doSendMagicEffect(basinPos,CONST_ME_HITBYFIRE)
		else
			doPlayerSendTextMessage(cid,25,"You not have a quest 'Kissing a Pig Quest' or already concluded.")
		end
		
	elseif (itemEx.actionid == 42318) and (itemEx.itemid == 5609) or (itemEx.itemid == 5697) or (itemEx.itemid == 8604) then
		if (getPlayerStorageValue(cid, 42318) <= 0 or getPlayerStorageValue(cid, 42318) >= 23) and (getPlayerStorageValue(cid, 42315) <= 0 or getPlayerStorageValue(cid, 42315) == 2) then
			doPlayerSendCancel(cid, "You can't use this item here.")
		else
			local fire = doCreateItem(12665, 1, toPosition)
			doDecayItem(fire)
			doSendMagicEffect(toPosition,CONST_ME_HITBYFIRE)
			if getPlayerStorageValue(cid, 42318) <= 21 then
				doCreatureSay(cid, "".. getPlayerStorageValue(cid, 42318) .."/22 burning walls left.", TALKTYPE_ORANGE_1)
				setPlayerStorageValue(cid, 42318, b)
			elseif getPlayerStorageValue(cid, 42318) == 22 then
				doCreatureSay(cid, "".. getPlayerStorageValue(cid, 42318) .."/22 Completed!", TALKTYPE_ORANGE_1)
				setPlayerStorageValue(cid, 42318, b)
				setPlayerStorageValue(cid, 42315, 2)
			end
		end	
	end
	return true
end