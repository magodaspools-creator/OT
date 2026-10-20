local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENCHANTEDSPEAR)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 0, 1.0, 0)

local condition = createConditionObject(CONDITION_FREEZING)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 1, 1000, -90)
setCombatCondition(combat, condition)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENCHANTEDSPEAR)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 0, 0, 1.0, 0)

local condition2 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 500)
setConditionFormula(condition2, -0.5, 0, -0.5, 0)
setCombatCondition(combat2, condition2)

function onUseWeapon(cid, var)
	local target = getCreatureTarget(cid)
	local ran = math.random(1, 10)
	if ((getCreatureCondition(target, CONDITION_PARALYZE) == false) and ran <= 2) then
		return doCombat(cid, combat2, var)
	else
		return doCombat(cid, combat, var)
	end
end