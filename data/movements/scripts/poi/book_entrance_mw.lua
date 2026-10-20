local pos = {x = 99, y = 2036, z = 10}
local itemid = 1970 -- ID do item 

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if getPlayerItemCount(cid,itemid) >= 1 then
		doTeleportThing(cid, pos) 
		doSendMagicEffect(getThingPos(cid), 37)
	else
		doCreatureSay(cid, "You need to book 'The Holy Tible'.", TALKTYPE_ORANGE_1, false, 0, position)
		doTeleportThing(cid, fromPosition, true)
	end
	return true
end