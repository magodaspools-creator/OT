local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 33000)
setConditionFormula(condition, 0.3, -24, 0.3, -24)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
local pos = variantToPosition(var)
	local block_area = {
	{{x=248,y=102,z=9}, {x=280,y=134,z=9}}, -- pos começo e final da área
	{{x=408,y=39,z=9}, {x=539,y=99,z=9}}
	}
	
	for _, var in ipairs(block_area) do
		if isInRange(getCreaturePosition(cid), var[1], var[2]) then
			doPlayerSendCancel(cid, "Você não pode usar utani hur nesta área.")
			return false
		end
	end
	return doCombat(cid, combat, var)
end
