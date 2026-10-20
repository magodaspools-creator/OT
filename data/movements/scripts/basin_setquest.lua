local magic_sulphur = {x=897, y=2500, z=8, stackpos=255}
local playernewPos = {x=901, y=2502, z=8}
local playerposcancel = {x=897, y=2502, z=8}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	local coin = getThingfromPos(magic_sulphur)
	if isPlayer(cid) and coin.itemid == 5904 then
		if doRemoveItem(coin.uid, 5) then
			doTeleportThing(cid, playernewPos)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doSendMagicEffect(magic_sulphur, CONST_ME_FIREAREA)
		else
			doCreatureSay(cid, "Você precisa por 5 magic sulphur no coal basin para o sacrifício.", TALKTYPE_ORANGE_1)
			doTeleportThing(cid, playerposcancel)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	else
		doCreatureSay(cid, "Coloque os 5 magic sulphur no coal basin.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, playerposcancel)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end