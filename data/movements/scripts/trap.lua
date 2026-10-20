function onStepIn(cid, item, pos)
	if(item.itemid == 2579) then
		if(not isPlayer(cid)) then
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -30, -150, CONST_ME_NONE)
			doTransformItem(item.uid, item.itemid - 1)
		end
	elseif(item.itemid == 1512) then
		if(isPlayer(cid)) then
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -150, -350, CONST_ME_NONE)
			doTransformItem(item.uid, item.itemid + 1)
		end
	elseif(item.itemid == 1510) then
		if(isPlayer(cid)) then
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -250, -500, CONST_ME_NONE)
			doTransformItem(item.uid, item.itemid + 1)
		end
	else
		if(isPlayer(cid)) then
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -120, -350, CONST_ME_NONE)
			doTransformItem(item.uid, item.itemid + 1)
		end
	end
	return true
end

function onStepOut(cid, item, pos)
	doTransformItem(item.uid, item.itemid - 1)
	return true
end

function onRemoveItem(item, tile, pos)
	local thingPos = getThingPos(item.uid)
	if(getDistanceBetween(thingPos, pos) > 0) then
		doTransformItem(item.uid, item.itemid - 1)
		doSendMagicEffect(thingPos, CONST_ME_POFF)
	end
	return true
end
