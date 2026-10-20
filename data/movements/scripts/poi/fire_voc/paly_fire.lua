function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

local voc1 = 3
local voc2 = 7
local voc_id = getPlayerVocation(cid)
 
    if item.uid == 45153 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        end
		
    elseif item.uid == 45154 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45155 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45156 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45157 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1200, -1200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45158 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1200, -1200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45159 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -1200, -1200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45160 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -600, -600, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -2400, -2400, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45161 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -900, -900, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -4800, -4800, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45162 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -900, -900, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -6200, -6200, 15)
            doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
		
    elseif item.uid == 45163 then
        if voc_id == voc1 or voc_id == voc2 then
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -900, -900, 15)
        else
            doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -9999, -9999, 15)
			doCreatureSay(cid, "You seem to be on the wrong path.", TALKTYPE_ORANGE_1)
        end
    end
	return true
end