local pos = {x = 48, y = 2101, z = 13}

function onUse(cid, item, frompos, item2, topos)
	
	doTeleportThing(cid, pos)
	doCreatureSay(cid, "Beauty has to be rewarded! Muahahaha!", TALKTYPE_ORANGE_1)
	return true
end