function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end
	
	local position = getCreaturePosition(target)
	if getCreatureName(target) == "Bela" and bit.band(flags, 1) == 1 then
		doCreatureSay(cid, "OBRIGADO POR ME LIBERTAR", TALKTYPE_MONSTER, nil, cid, position)
	end
	return true
end