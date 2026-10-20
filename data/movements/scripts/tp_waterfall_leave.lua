local outfit = {lookType = 267, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(hasCondition(cid, CONDITION_OUTFIT, 0, CONDITIONID_COMBAT) and getCreatureOutfit(cid).lookType == outfit.lookType) then
		doTeleportThing(cid, {x=152,y=742,z=7})
		doRemoveCondition(cid, CONDITION_OUTFIT)
		if(not isPlayerGhost(cid)) then
			doSendMagicEffect(position, CONST_ME_POFF)
		end
	end
	return true
end