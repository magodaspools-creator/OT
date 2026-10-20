local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STONES)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1.4, 2.8, 40, 70)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
if isPlayer(cid) then
	if getPlayerStorageValue(cid, ANTIENTROSA_BLOCK_RUNES) == 1 then
		doPlayerSendCancel(cid, "Essa Runa está bloqueada no Anti-Entrosa.")
		return false
	end
end

	return doCombat(cid, combat, var)
end
