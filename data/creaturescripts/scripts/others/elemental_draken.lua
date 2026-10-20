function onStatsChange(cid, attacker, type, combat, value)
if isPlayer(target) then
	return true
end

    if(combat == COMBAT_UNDEFINEDDAMAGE) then
        return true
    end
    if(type == STATSCHANGE_HEALTHLOSS) then
		if isPlayer(attacker) then
			local dmg = math.ceil((value/2) * (getCreatureHealth(cid) / getCreatureMaxHealth(cid)))
			local pos = getCreaturePosition(cid)
			doCreatureAddHealth(cid, -dmg)
			doPlayerSendTextMessage(attacker, MESSAGE_DAMAGE_DEALT, "Elemental Draken loses " .. dmg .. " hitpoints due to your attack.", dmg, COLOR_RED, pos)
			doSendMagicEffect(pos, CONST_ME_DRAWBLOOD)
			local item1 = doCreateItem(2019, 2, pos)
			doDecayItem(item1)
			pos = getCreaturePosition(attacker)
			dmg = math.ceil(value / 2)
			doCreatureAddHealth(attacker, -dmg)
			doPlayerSendTextMessage(attacker, MESSAGE_DAMAGE_RECEIVED, "You lose " .. dmg .. " hitpoints due to an attack by Elemental Draken.", dmg, COLOR_RED, pos)
			doSendMagicEffect(pos, CONST_ME_DRAWBLOOD)
			local item2 = doCreateItem(2019, 2, pos)
			doDecayItem(item2)
			return false
		end
    end
    return false
end