local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 11, 15)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat2, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 12, 16)

function onCastSpell(cid, var)
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == 12719 then
		return doCombat(cid, combat2, var)
	else
		return doCombat(cid, combat, var)
	end
end
