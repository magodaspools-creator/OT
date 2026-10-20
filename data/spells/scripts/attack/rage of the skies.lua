local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 12, 14)

local area = createCombatArea(AREA_CROSS6X6)
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
