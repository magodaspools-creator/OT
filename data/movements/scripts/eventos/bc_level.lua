function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if isPlayer(cid) then
		if getPlayerLevel(cid) < 100 then
			doTeleportThing(cid, fromPosition, true)
			doCreatureSay(cid, "Only for level 100+", TALKTYPE_ORANGE_1, false, 0, position)
		end
	end
return true
end