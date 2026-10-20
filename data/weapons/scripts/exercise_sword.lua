local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
 
function onUseWeapon(cid, var)
	local skill = getPlayerRequiredSkillTries(cid, SKILL_SWORD, getPlayerSkillLevel(cid, SKILL_SWORD))
	local target = getCreatureTarget(cid)
	local crit = math.random(1, 100)
	
    if getCreatureName(target) == "Exercise Dummy" then
		if getPlayerSkillLevel(cid, SKILL_SWORD) >= 0 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 19 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.7), false) -- 70%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 70%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.5), false) -- 50%
				doSendAnimatedText(getPlayerPosition(cid),"+ 50%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 20 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 29 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.5), false) -- 60%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 50%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.3), false) -- 40%
				doSendAnimatedText(getPlayerPosition(cid),"+ 30%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 30 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 39 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.4), false) -- 50%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 40%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.2), false) -- 30%
				doSendAnimatedText(getPlayerPosition(cid),"+ 20%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 40 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 49 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.2), false) -- 40%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 20%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.1), false) -- 20%
				doSendAnimatedText(getPlayerPosition(cid),"+ 10%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 50 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 59 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.05), false) -- 20%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.025), false) -- 10%
				doSendAnimatedText(getPlayerPosition(cid),"+ 2.5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 60 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 69 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.02), false) -- 14%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 2%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.01), false) -- 7%
				doSendAnimatedText(getPlayerPosition(cid),"+ 1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 70 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 79 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.01), false) -- 10%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.005), false) -- 5%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.5%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
		
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 80 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 89 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.004), false) -- 6%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.4%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.002), false) -- 3%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.2%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
		
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 90 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 99 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.002), false) -- 2%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.2%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.001), false) -- 1%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 100 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 109 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.001), false) -- 1%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.1%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.0005), false) -- 0.5%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.05%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 110 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 119 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.0005), false) -- 0.4%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.05%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.00025), false) -- 0.2%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.025%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 120 and getPlayerSkillLevel(cid, SKILL_SWORD) <= 129 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.00025), false) -- 0.3%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.025%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.0001), false) -- 0.15%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.01%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
			
		elseif getPlayerSkillLevel(cid, SKILL_SWORD) >= 130 then
			if crit <= 5 then
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.0001), false) -- 0.2%
				doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.01%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			else
				doPlayerAddSkillTry(cid, SKILL_SWORD, math.ceil(skill*0.00005), false) -- 0.1%
				doSendAnimatedText(getPlayerPosition(cid),"+ 0.005%", TEXTCOLOR_RED)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				return doCombat(cid, combat, var)
			end
		end
    else
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você só pode usar o exercise weapon no 'Exercise Dummy'.")
    end
end