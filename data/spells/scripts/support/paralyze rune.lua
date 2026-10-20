local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.95, 0, -0.95, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
    local pos = variantToPosition(var)
	local block_area = {
	{{x=248,y=102,z=9}, {x=280,y=134,z=9}}, -- pos começo e final da área
	{{x=408,y=39,z=9}, {x=539,y=99,z=9}}
	}
	
	for _, var in ipairs(block_area) do
		if isInRange(getCreaturePosition(cid), var[1], var[2]) then
			doPlayerSendCancel(cid, "Você não pode usar runas nesta área.")
			return false
		end
	end
	
	if(not doCombat(cid, combat, var)) then
		return false
	end

	doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_GREEN)
	return true
end
