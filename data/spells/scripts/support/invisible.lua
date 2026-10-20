local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 200000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
    local pos = variantToPosition(var)
	local block_area = {
	{{x=231,y=102,z=9}, {x=280,y=134,z=9}}, -- Zombie event + daily reward room
	{{x=408,y=39,z=9}, {x=539,y=99,z=9}}, -- Bomberman
	{{x=408,y=39,z=8}, {x=539,y=99,z=8}}, -- Bomberman area de assistir
	{{x=461,y=102,z=9}, {x=492,y=118,z=9}}, -- Bomberman Wait Room
	{{x=280,y=74,z=9}, {x=304,y=97,z=9}}, -- Arena
	{{x=291,y=100,z=9}, {x=320,y=122,z=9}}, -- Daily arena
	{{x=478,y=177,z=7}, {x=524,y=223,z=7}}, -- Snowball
	{{x=497,y=196,z=6}, {x=505,y=204,z=6}}, -- Snowball Wait Room
	{{x=346,y=194,z=7}, {x=358,y=206,z=7}}, -- DTT Wait Room
	{{x=296,y=166,z=6}, {x=406,y=235,z=6}}, -- DTT
	{{x=839,y=2183,z=8}, {x=872,y=2315,z=8}}, -- BloodCastle
	{{x=244,y=71,z=8}, {x=324,y=136,z=8}}, -- SALA evento
	{{x=613,y=168,z=7}, {x=652,y=197,z=7}} -- SALA The Rain Event
	}
	
	for _, var in ipairs(block_area) do
		if isInRange(getCreaturePosition(cid), var[1], var[2]) then
			doPlayerSendCancel(cid, "Você não pode usar essa spell nesta área.")
			return false
		end
	end

	return doCombat(cid, combat, var)
end
