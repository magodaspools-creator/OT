function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

local voc1 = 1
local voc2 = 5
local voc_id = getPlayerVocation(cid)
 
    if item.uid == 45142 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        end
		
    elseif item.uid == 45143 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45144 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45145 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45146 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1200, -1200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45147 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1200, -1200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45148 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1200, -1200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45149 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -2400, -2400, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45150 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -900, -900, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -4800, -4800, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45151 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -900, -900, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -6200, -6200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45152 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -900, -900, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -9999, -9999, 15)
			doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
    end
	return true
end