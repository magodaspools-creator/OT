local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 9, 8, 8, 10)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 10, 9, 9, 11)

local condition2 = createConditionObject(CONDITION_CURSED)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 5, 100, -60)
setCombatCondition(combat2, condition2)

function onCastSpell(cid,var)
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == 12717 then
		return doCombat(cid, combat2, var)
	else
		return doCombat(cid, combat, var)
	end
end