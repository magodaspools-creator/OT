local scarab_coin = {x=433, y=480, z=11, stackpos=255}
local playernewPos = {x=427, y=481, z=11}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

local coin = getThingfromPos(scarab_coin)
	if isPlayer(cid) and coin.itemid == 2159 then
		doRemoveItem(coin.uid, 1)
		doTeleportThing(cid, playernewPos)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doSendMagicEffect(scarab_coin, CONST_ME_HITBYFIRE)
	else
		doCreatureSay(cid, "Put the scarab coin on the coal basin.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, fromPosition, true)
	end
return TRUE
end