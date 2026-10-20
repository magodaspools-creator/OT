local actions = {	
	[61530] = {x = 422, y = 52, z = 8},
	[61531] = {x = 456, y = 52, z = 8},
	[61532] = {x = 490, y = 52, z = 8},
	[61533] = {x = 525, y = 52, z = 8},
	[61534] = {x = 422, y = 84, z = 8},
	[61535] = {x = 456, y = 84, z = 8},
	[61536] = {x = 490, y = 84, z = 8},
	[61537] = {x = 525, y = 84, z = 8}
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if item.itemid == 12693 then -- Velocidade
		doChangeSpeed(cid, 50)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou mais velocidade!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)
	elseif item.itemid == 12694 then -- Radius
		doCreatureSetStorage(cid, bomberman.radiusStorage, getCreatureStorage(cid, bomberman.radiusStorage) + 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O poder de fogo da sua bomba aumentou!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)

	elseif item.itemid == 12695 then -- Imunidade
		doCreatureSetStorage(cid, bomberman.imuneStorage, os.time() + 10)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você está imune por 10 segundos!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)

	elseif item.itemid == 12696 then -- Mais bombas
		doCreatureSetStorage(cid, bomberman.bombLimitStorage, getCreatureStorage(cid, bomberman.bombLimitStorage) + 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Agora você pode soltar mais bombas de uma vez!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)

	elseif actions[item.actionid] then
		doSetMonsterOutfit(cid, "Parrot", -1)
		doTeleportThing(cid, actions[item.actionid])

	elseif item.actionid == 61538 then
		if tonumber(os.date("%H")) == 16 then
			doTeleportThing(cid, {x=466,y=111,z=9})
		else
			doTeleportThing(cid, getTownTemplePosition(1))
		end
		doRemoveCondition(cid, CONDITION_OUTFIT)

	end
	return true
end
