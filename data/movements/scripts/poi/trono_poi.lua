function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	local trono_storage = getPlayerStorageValue(cid, 45220) + 1
	
	if item.uid == 45221 and getPlayerStorageValue(cid, 45221) <= 0 then
		doTeleportThing(cid, {x = 148, y = 2036, z = 15})
		setPlayerStorageValue(cid, 45221, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
		
	elseif item.uid == 45222 and getPlayerStorageValue(cid, 45222) <= 0 then
		doTeleportThing(cid, {x = 217, y = 1919, z = 15})
		setPlayerStorageValue(cid, 45222, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
	
	elseif item.uid == 45223 and getPlayerStorageValue(cid, 45223) <= 0 then
		doTeleportThing(cid, {x = 69, y = 1952, z = 15})
		setPlayerStorageValue(cid, 45223, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
		
	elseif item.uid == 45224 and getPlayerStorageValue(cid, 45224) <= 0 then
		doTeleportThing(cid, {x = 183, y = 1976, z = 15})
		setPlayerStorageValue(cid, 45224, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
		
	elseif item.uid == 45225 and getPlayerStorageValue(cid, 45225) <= 0 then
		doTeleportThing(cid, {x = 93, y = 1987, z = 15})
		setPlayerStorageValue(cid, 45225, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
		
	elseif item.uid == 45226 and getPlayerStorageValue(cid, 45226) <= 0 then
		doTeleportThing(cid, {x = 53, y = 2096, z = 15})
		setPlayerStorageValue(cid, 45226, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
		
	elseif item.uid == 45227 and getPlayerStorageValue(cid, 45227) <= 0 then
		doTeleportThing(cid, {x = 147, y = 2017, z = 15})
		setPlayerStorageValue(cid, 45227, 1)
		setPlayerStorageValue(cid, 45220, trono_storage) -- STORAGE CONTAGEM TRONO
		doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPos(cid), 17)
	
	else
		return false -- RETORNAR FALSE CASO JÁ TENHA SUBINO NO TRONO E PEGO STORAGE
	end
	return true
end