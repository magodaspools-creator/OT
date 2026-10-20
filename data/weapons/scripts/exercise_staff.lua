local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
 
function onUseWeapon(cid, var)
	local target = getCreatureTarget(cid)
	local crit = math.random(1, 100)
	
    if getCreatureName(target) == "Exercise Dummy" then
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 then
			if getPlayerMagLevel(cid) <= 0 then
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa ao menos de ML 1 para usar este item.")
			
			elseif getPlayerMagLevel(cid) >= 1 and getPlayerMagLevel(cid) <= 9 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.7, false) -- 90%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 70%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.5, false) -- 70%
					doSendAnimatedText(getPlayerPosition(cid),"+ 50%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 10 and getPlayerMagLevel(cid) <= 19 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.4, false) -- 90%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 40%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.2, false) -- 70%
					doSendAnimatedText(getPlayerPosition(cid),"+ 20%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 20 and getPlayerMagLevel(cid) <= 29 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.2, false) -- 80%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 20%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.1, false) -- 60%
					doSendAnimatedText(getPlayerPosition(cid),"+ 10%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 30 and getPlayerMagLevel(cid) <= 39 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.15, false) -- 70%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 15%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.08, false) -- 50%
					doSendAnimatedText(getPlayerPosition(cid),"+ 8%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 40 and getPlayerMagLevel(cid) <= 49 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.1, false) -- 60%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 10%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.05, false) -- 40%
					doSendAnimatedText(getPlayerPosition(cid),"+ 5%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 50 and getPlayerMagLevel(cid) <= 54 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.04, false) -- 40%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 4%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.02, false) -- 20%
					doSendAnimatedText(getPlayerPosition(cid),"+ 2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 55 and getPlayerMagLevel(cid) <= 59 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.02, false) -- 30%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.01, false) -- 15%
					doSendAnimatedText(getPlayerPosition(cid),"+ 1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 60 and getPlayerMagLevel(cid) <= 69 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.01, false) -- 20%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.005, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.5%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
		
			elseif getPlayerMagLevel(cid) >= 70 and getPlayerMagLevel(cid) <= 79 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.004, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.4%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.002, false) -- 5%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
		
			elseif getPlayerMagLevel(cid) >= 80 and getPlayerMagLevel(cid) <= 89 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0025, false) -- 6%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.25%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.001, false) -- 3%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 90 and getPlayerMagLevel(cid) <= 109 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.001, false) -- 2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0005, false) -- 1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.05%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 110 and getPlayerMagLevel(cid) <= 119 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0005, false) -- 0.4%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.05%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.00025, false) -- 0.2%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.025%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 120 and getPlayerMagLevel(cid) <= 129 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0002, false) -- 0.2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.02%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0001, false) -- 0.1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.01%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 130 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0001, false) -- 0.2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.01%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.00005, false) -- 0.1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.005%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			end
		
		-- RP
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
			if getPlayerMagLevel(cid) <= 0 then
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa ao menos de ML 1 para usar este item.")
				
			elseif getPlayerMagLevel(cid) >= 1 and getPlayerMagLevel(cid) <= 3 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.4, false) -- 50%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 40%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.2, false) -- 30%
					doSendAnimatedText(getPlayerPosition(cid),"+ 20%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 4 and getPlayerMagLevel(cid) <= 6 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.2, false) -- 30%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 20%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.1, false) -- 15%
					doSendAnimatedText(getPlayerPosition(cid),"+ 10%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 7 and getPlayerMagLevel(cid) <= 8 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.1, false) -- 30%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 10%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.05, false) -- 15%
					doSendAnimatedText(getPlayerPosition(cid),"+ 5%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 9 and getPlayerMagLevel(cid) <= 10 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.04, false) -- 20%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 4%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.02, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"+ 2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) >= 11 and getPlayerMagLevel(cid) <= 12 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.02, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.01, false) -- 5%
					doSendAnimatedText(getPlayerPosition(cid),"+ 1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 13 and getPlayerMagLevel(cid) <= 14 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.004, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.4%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.002, false) -- 5%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 15 and getPlayerMagLevel(cid) <= 16 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.002, false) -- 2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.001, false) -- 1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 17 and getPlayerMagLevel(cid) <= 18 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.001, false) -- 1%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0005, false) -- 0.5%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.05%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 19 and getPlayerMagLevel(cid) <= 20 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0002, false) -- 0.2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.02%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0001, false) -- 0.1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.01%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			else
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você atingiu o valor máximo de ML com este item liberado para sua classe.")
			end
			
		-- EK
		elseif getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
			if getPlayerMagLevel(cid) <= 0 then
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa ao menos de ML 1 para usar este item.")
				
			elseif getPlayerMagLevel(cid) >= 1 and getPlayerMagLevel(cid) <= 2 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.1, false) -- 40%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 10%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.05, false) -- 20%
					doSendAnimatedText(getPlayerPosition(cid),"+ 5%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 3 and getPlayerMagLevel(cid) <= 4 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.04, false) -- 20%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 4%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.02, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"+ 2%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) >= 5 and getPlayerMagLevel(cid) <= 6 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.01, false) -- 10%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.005, false) -- 5%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.5%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			
			elseif getPlayerMagLevel(cid) == 7 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.001, false) -- 2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.1%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0005, false) -- 1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.05%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) == 8 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0005, false) -- 1%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.05%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0002, false) -- 0.5%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.02%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) == 9 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0002, false) -- 0.4%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.02%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0001, false) -- 0.2%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.01%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
				
			elseif getPlayerMagLevel(cid) == 10 then
				if crit <= 5 then
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.0001, false) -- 0.2%
					doSendAnimatedText(getPlayerPosition(cid),"CRIT+ 0.01%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				else
					doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true)) * 0.00005, false) -- 0.1%
					doSendAnimatedText(getPlayerPosition(cid),"+ 0.005%", TEXTCOLOR_RED)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
					return doCombat(cid, combat, var)
				end
			else
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você atingiu o valor máximo de ML com este item liberado para sua classe.")
			end
		end
    else
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você só pode usar o exercise weapon no 'Exercise Dummy'.")
    end
end