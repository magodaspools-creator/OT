function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	local effect_pos = getCreaturePosition(target)
	if getCreatureName(target) == "Newgate Promotion" and bit.band(flags, 1) == 1 then
		doSendMagicEffect(effect_pos, CONST_ME_TUTORIALARROW)
	end
	return true
end 