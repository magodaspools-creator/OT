local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
 
function onUseWeapon(cid, var)
	local skill = getPlayerRequiredSkillTries(cid, SKILL_DISTANCE, getPlayerSkillLevel(cid, SKILL_DISTANCE))
	local target = getCreatureTarget(cid)
	local crit = math.random(1, 100)
	
    if getCreatureName(target) == "Exercise Dummy" then
		if getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 0 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 19 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.7), false) -- 70%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 70%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.5), false) -- 50%
				doSendAnimatedText(getPlayerPosition(cid),"+ 50%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 20 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 29 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.5), false) -- 60%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 50%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.3), false) -- 40%
				doSendAnimatedText(getPlayerPosition(cid),"+ 30%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 30 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 39 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.4), false) -- 50%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 40%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.2), false) -- 30%
				doSendAnimatedText(getPlayerPosition(cid),"+ 20%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 40 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 49 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.3), false) -- 50%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 30%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.15), false) -- 25%
				doSendAnimatedText(getPlayerPosition(cid),"+ 15%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 50 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 59 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.1), false) -- 40%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 10%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.05), false) -- 20%
				doSendAnimatedText(getPlayerPosition(cid),"+ 5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 60 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 69 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.03), false) -- 30%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 3%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.015), false) -- 15%
				doSendAnimatedText(getPlayerPosition(cid),"+ 1.5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 70 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 79 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.02), false) -- 20%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 2%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.01), false) -- 10%
				doSendAnimatedText(getPlayerPosition(cid),"+ 1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
		
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 80 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 89 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.01), false) -- 10%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.005), false) -- 5%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
		
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 90 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 99 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.005), false) -- 3%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.0025), false) -- 1.5%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.25%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 100 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 109 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.0025), false) -- 1.4%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.25%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.0015), false) -- 0.7%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.15%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 110 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 119 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.001), false) -- 0.6%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.0005), false) -- 0.3%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.05%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 120 and getPlayerSkillLevel(cid, SKILL_DISTANCE) <= 129 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.0005), false) -- 0.5%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.05%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.00025), false) -- 0.25%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.025%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 130 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.0003), false) -- 0.25%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.03%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_DISTANCE, math.ceil(skill*0.00015), false) -- 0.15%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.015%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
		end
    else
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você só pode usar o exercise weapon no 'Exercise Dummy'.")
    end
end