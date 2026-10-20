function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end
	
	local position = getCreaturePosition(target)
	local t = getThingPos(target)
    if isPlayer(cid) and bit.band(flags, 1) == 1 then
		if getCreatureName(target) == "Snake God Essence" and not(getCreatureByName("Snake Think")) then
			doCreateMonster("Snake Thing", t, false, true);
			doCreatureSay(cid, "IT'S NOT THAT EASY, MORTALS! FEEL THE POWER OF A GOD!", TALKTYPE_ORANGE_1, false, 0, position)
		elseif getCreatureName(target) == "Snake Think" and not(getCreatureByName("Lizard Abomination")) then
			doCreateMonster("Lizard Abomination", t, false, true);
			doCreatureSay(cid, "IT'S NOT THAT EASY, MORTALS! FEEL THE POWER OF A GOD!", TALKTYPE_MONSTER, false, 0, position)
		elseif getCreatureName(target) == "Lizard Abomination" and not(getCreatureByName("Mutated Zalamon")) then
			doCreateMonster("Mutated Zalamon", t, false, true);
			doCreatureSay(cid, "IT'S NOT THAT EASY, MORTALS! FEEL THE POWER OF A GOD!", TALKTYPE_MONSTER, false, 0, position)
		end
	end
    return true
end