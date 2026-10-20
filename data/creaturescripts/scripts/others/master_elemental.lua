function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	local position = getCreaturePosition(target)
    if isPlayer(cid) then
		if getCreatureName(target) == "Master Elemental" and bit.band(flags, 1) == 1 then
			doCreatureSay(cid, "Clique no corpo para ser teleportado e receber sua recompensa.", TALKTYPE_ORANGE_1, false, 0, position)
		end
	end
    return true
end