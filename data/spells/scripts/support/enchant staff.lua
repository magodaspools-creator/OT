function onCastSpell(cid, var)

	if doPlayerRemoveItem(cid, 2401, 1) then
		local v = doPlayerAddItem(cid, 2433, 1)
		doDecayItem(v)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_GREEN)
		return true
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
		return true
	end
end