local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 13, 16)

local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
if isPlayer(cid) then	
	if getPlayerStorageValue(cid, ANTIENTROSA_BLOCK_UE) == 1 then
		doPlayerSendCancel(cid, "Essa magia está bloqueada no Anti-Entrosa.")
		return false
	end
end

	return doCombat(cid, combat, var)
end
