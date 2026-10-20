local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
--setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 10, 12)

function onGetFormulaValues(cid, level, maglevel)
    if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then 
		local min = ((level*2)+(maglevel*40))
		local max = ((level*2)+(maglevel*55))
		return min, max
	else
		local min = ((level*2)+(maglevel*2))
		local max = ((level*2)+(maglevel*3))
		return min, max
	end
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
