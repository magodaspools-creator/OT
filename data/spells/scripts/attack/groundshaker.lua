local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, skill, attack, element, factor)
	local attackTotal, elementTotal, levelTotal = skill + attack, skill + element, level / 8
	return -(attackTotal * 1.0 + levelTotal), -(attackTotal * 1.4 + levelTotal),
		-math.random(math.ceil(elementTotal * 1.0), math.ceil(elementTotal * 1.4))
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat2, COMBAT_PARAM_USECHARGES, true)

local area2 = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat2, area2)

function onGetFormulaValues2(cid, level, skill, attack, element, factor)
	local attackTotal2, elementTotal2, levelTotal2 = skill + attack, skill + element, level / 8
	return -(attackTotal2 * 1.4 + levelTotal2), -(attackTotal2 * 1.7 + levelTotal2),
		-math.random(math.ceil(elementTotal2 * 1.4), math.ceil(elementTotal2 * 1.7))
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

function onCastSpell(cid, var)
	if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == 12719 then
		return doCombat(cid, combat2, var)
	else
		return doCombat(cid, combat, var)
	end
end
