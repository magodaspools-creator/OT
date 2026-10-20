local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

function onCastSpell(cid, var)
	local pally = math.random(120,210) -- minimo mana, maximo mana
	local mage = math.random(220,340) -- minimo mana, maximo mana
	local kina = math.random(80,150) -- minimo mana, maximo mana
	local vocation = getPlayerVocation(cid)
	
	if vocation == 3 or vocation == 7 then
		doCreatureAddMana(cid, pally)
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
		return doCombat(cid, combat, var)
	elseif vocation == 4 or vocation == 8 then
		doCreatureAddMana(cid, kina)
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
		return doCombat(cid, combat, var)
	elseif vocation == 1 or vocation == 2 or vocation == 5 or vocation == 6 then
		doCreatureAddMana(cid, mage)
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
		return doCombat(cid, combat, var)
	end
end