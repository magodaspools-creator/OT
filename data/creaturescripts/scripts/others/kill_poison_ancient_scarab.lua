function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	local pos_msg = getCreaturePosition(target)
	local t = getThingPos(target)
	if getCreatureName(target) == "Poison Ancient Scarab" and bit.band(flags, 1) == 1 then
		doCreatureSay(cid, "Ancients.... Scarabs....", TALKTYPE_ORANGE_1, false, 0, pos_msg)
		doSummonCreature("Poison Scarab", t, false, true);
	end
	return true
end