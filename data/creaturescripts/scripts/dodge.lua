local lvldodge = 45820
local percent_mana = 0.2
local percent_hp = 0.4

function onStatsChange(cid, attacker, type, combat, value)
	if type == STATSCHANGE_MANALOSS and isCreature(attacker) then
		if (getPlayerStorageValue(cid, lvldodge)*3) >= math.random (0,1000) then
			value = math.ceil(value*(percent_mana))
			doTargetCombatHealth(attacker, cid, combat, -value, -value, 255)
			doSendAnimatedText(getCreaturePos(cid), "Dodge", COLOR_BLUE)
			return false
		end
	elseif type == STATSCHANGE_HEALTHLOSS and isCreature(attacker) then
		if (getPlayerStorageValue(cid, lvldodge)*3) >= math.random (0,1000) then
			value = math.ceil(value*(percent_hp))
			doTargetCombatHealth(attacker, cid, combat, -value, -value, 255)
			doSendAnimatedText(getCreaturePos(cid), "Dodge", COLOR_DARKRED)
			return false
		end
	end
	return true
end