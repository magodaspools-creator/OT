local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 4, 4, 25, 30)

local area = createCombatArea(AREA_CROSS1X1)
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
