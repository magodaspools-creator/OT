function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end
	
	local position = getCreaturePosition(target)
	local t = getThingPos(target)
    if isPlayer(cid) and bit.band(flags, 1) == 1 then
		if getCreatureName(target) == "Devovorga" and not(getCreatureByName("Rise of Devovorga")) then
			doSummonCreature("Rise of Devovorga", t, false, true);
			doCreatureSay(cid, "THE SEVEN? THEY WERE NOT ABLE TO CONTROL ME!", TALKTYPE_ORANGE_1, false, 0, position)
		end
	end
    return true
end