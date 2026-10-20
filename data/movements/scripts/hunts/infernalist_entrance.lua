local magic_sulphur = {x=925, y=1450, z=9, stackpos=255}
local playernewPos = {x=921, y=1445, z=10}
local playerposcancel = {x=925, y=1451, z=9}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

local coin = getThingfromPos(magic_sulphur)
	if isPlayer(cid) and coin.itemid == 5904 then
		doRemoveItem(coin.uid, 1)
		doTeleportThing(cid, playernewPos)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doSendMagicEffect(magic_sulphur, CONST_ME_YELLOWENERGY)
	else
		doCreatureSay(cid, "Put the magic sulphur on the coal basin.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, playerposcancel)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
return TRUE
end