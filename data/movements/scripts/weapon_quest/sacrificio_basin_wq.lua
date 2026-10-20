local red_crystal = {x=575, y=2476, z=8, stackpos=255}
local playernewPos = {x=599, y=2481, z=8}
local playerposcancel = {x=578, y=2476, z=8}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

if getPlayerStorageValue(cid, 45376) >= 1 then
	doTeleportThing(cid, playernewPos)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	return true
end

local coin = getThingfromPos(red_crystal)
	if isPlayer(cid) and coin.itemid == 12681 then
		if doRemoveItem(coin.uid, 50) then
			doTeleportThing(cid, playernewPos)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doSendMagicEffect(red_crystal, CONST_ME_FIREAREA)
			setPlayerStorageValue(cid, 45376, 1)
		else
			doCreatureSay(cid, "Você precisa por 50 concentrated red crystals no coal basin para o sacrifício.", TALKTYPE_ORANGE_1)
			doTeleportThing(cid, playerposcancel)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	else
		doCreatureSay(cid, "Coloque os 50 concentrated red crystals no coal basin.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, playerposcancel)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end