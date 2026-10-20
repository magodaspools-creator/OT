local lvlcrit = 45821
local multiplier = 1.2

function onStatsChange(cid, attacker, type, combat, value)
	if isPlayer(attacker) and (not (attacker == cid)) and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS)  then
		if (getPlayerStorageValue(attacker, lvlcrit)*3) >= math.random (0,1000) then
			dano = math.ceil(value*(multiplier))
			doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 255)
			doSendAnimatedText(getCreaturePos(attacker), "Critical", COLOR_RED)
			return false
		end
	end
	return true
end