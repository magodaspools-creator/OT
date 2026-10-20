function onCastSpell(cid, var)
	local v = doPlayerAddItem(cid, 12770, 100)
	if v then
		doDecayItem(v)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_GREEN)
		return true
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
		return true
	end
end