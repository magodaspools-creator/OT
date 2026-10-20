local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(EAST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(EAST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	-- Receitas - WORK in Website ONLY
	if msgcontains(msg, "receitas") then
		npcHandler:say("Acesse o site do servidor, em {Library > Cooking}. Você vai encontrar todas as receitas lá. Basta me dizer o nome do food para fazê-lo.", cid)
		npcHandler.topic[cid] = 0
	end
	
	-- Se tornando cozinheiro
	if msgcontains(msg, "enter") or msgcontains(msg, "entrar") then
		if getPlayerStorageValue(cid, 45470) <= 0 then
			npcHandler:say("Você quer se tornar um cozinheiro ao custo de {100k}?", cid)
			npcHandler.topic[cid] = 1
		elseif getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("Você já é um cozinheiro... Aumente seus pontos e troque-os para cozinhar melhores alimentos.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Breads
	if msgcontains(msg, "bread") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("10 Breads = 1 ponto! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Party Cake
	if msgcontains(msg, "party cake") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Party Cake = 3 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 3
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Chocolate Cake
	if msgcontains(msg, "chocolate cake") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Chocolate Cake = 15 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 4
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Banana Chocolate Shake
	if msgcontains(msg, "banana chocolate shake") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Banana Chocolate Shake = -10 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 5
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Blessed Steak
	if msgcontains(msg, "blessed steak") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Blessed Steak = -60 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 6
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Carrot Cake
	if msgcontains(msg, "carrot cake") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Carrot Cake = -50 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Coconut Shrimp Bake
	if msgcontains(msg, "coconut shrimp bake") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Coconut Shrimp Bake = -10 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 8
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Filled Jalapeño Peppers
	if msgcontains(msg, "filled jalapeño peppers") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Filled Jalapeño Peppers = -10 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 9
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Tropical Fried Terrorbird
	if msgcontains(msg, "tropical fried terrorbird") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Tropical Fried Terrorbird = -50 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 10
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Hydra Tongue Salad
	if msgcontains(msg, "hydra tongue salad") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Hydra Tongue Salad = -10 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 11
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Pot of Blackjack
	if msgcontains(msg, "pot of blackjack") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Pot of Blackjack = -80 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 12
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Roasted Dragon Wings
	if msgcontains(msg, "roasted dragon wings") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Roasted Dragon Wings = -20 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 13
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Rotworm Stew
	if msgcontains(msg, "rotworm stew") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Rotworm Stew = -60 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 14
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Sweet Mangonaise Elixir
	if msgcontains(msg, "sweet mangonaise elixir") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Sweet Mangonaise Elixir = -10 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 15
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	-- Veggie Casserole
	if msgcontains(msg, "veggie casserole") then
		if getPlayerStorageValue(cid, 45470) > 0 then
			npcHandler:say("1 Veggie Casserole = -50 pontos! Basta falar: {yes}.", cid)
			npcHandler.topic[cid] = 16
		else
			npcHandler:say("Você precisa se tornar um cozinheiro. Diga: {entrar}.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	
-----------------------------------------------------------------------------------
	if msgcontains(msg, "yes") or msgcontains(msg, "sim") then	
		if npcHandler.topic[cid] == 1 then -- enter - se tornando cozinheiro
			if getPlayerMoney(cid) >= 100000 then -- gold coin
				if doPlayerRemoveMoney(cid, 100000) then -- gold coin
					setPlayerStorageValue(cid, 45470, 1) -- acesso a porta
					setPlayerStorageValue(cid, 45471, 0) -- pontos
					npcHandler:say("Parabéns! Você agora é um cozinheiro e vai aprender com o melhor.", cid)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem dinheiro suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 2 then
			if getPlayerItemCount(cid, 2689) >= 10 then -- breads
				if doPlayerRemoveItem(cid, 2689, 10) then
					local stor = getPlayerStorageValue(cid, 45471) + 1
					setPlayerStorageValue(cid, 45471, stor)
					npcHandler:say("Você recebeu 1 ponto. Diga {yes} se quiser trocar mais 10 breads em 1 ponto.", cid)
					npcHandler.topic[cid] = 2
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem o item.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 3 then
			if getPlayerItemCount(cid, 6280) >= 1 then -- party cake
				if doPlayerRemoveItem(cid, 6280, 1) then
					local stor = getPlayerStorageValue(cid, 45471) + 3
					setPlayerStorageValue(cid, 45471, stor)
					npcHandler:say("Você recebeu 3 pontos. Diga {yes} se quiser trocar mais 1 party cake em 3 pontos.", cid)
					npcHandler.topic[cid] = 3
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem o item.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 4 then
			if getPlayerItemCount(cid, 8847) >= 1 then -- chocolate cake
				if doPlayerRemoveItem(cid, 8847, 1) then
					local stor = getPlayerStorageValue(cid, 45471) + 15
					setPlayerStorageValue(cid, 45471, stor)
					npcHandler:say("Você recebeu 15 pontos. Diga {yes} se quiser trocar mais 1 chocolate cake em 15 pontos.", cid)
					npcHandler.topic[cid] = 4
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem o item.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 5 then -- banana chocolate shake
			if getPlayerStorageValue(cid, 45471) >= 10 then
				if getPlayerItemCount(cid, 6574) >= 1 and getPlayerItemCount(cid, 6394) >= 1 and getPlayerItemCount(cid, 2676) >= 2 and getPlayerItemCount(cid, 2006, 6) >= 2 and getPlayerItemCount(cid, 2802) >= 1 and getPlayerItemCount(cid, 2800) >= 1 then
					if doPlayerRemoveItem(cid, 6574, 1) and doPlayerRemoveItem(cid, 6394, 1) and doPlayerRemoveItem(cid, 2676, 2) and doPlayerRemoveItem(cid, 2006, 2, 6) and doPlayerRemoveItem(cid, 2802, 1) and doPlayerRemoveItem(cid, 2800, 1) then
						local stor = getPlayerStorageValue(cid, 45471) - 10
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9996, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 6 then -- blessed steak
			if getPlayerStorageValue(cid, 45471) >= 60 then
				if getPlayerItemCount(cid, 2671) >= 1 and getPlayerItemCount(cid, 8839) >= 5 and getPlayerItemCount(cid, 8843) >= 1 and getPlayerItemCount(cid, 8845) >= 2 and getPlayerItemCount(cid, 2683) >= 1 and getPlayerItemCount(cid, 8844) >= 2 then
					if doPlayerRemoveItem(cid, 2671, 1) and doPlayerRemoveItem(cid, 8839, 5) and doPlayerRemoveItem(cid, 8843, 1) and doPlayerRemoveItem(cid, 8845, 2) and doPlayerRemoveItem(cid, 2683, 1) and doPlayerRemoveItem(cid, 8844, 2) then
						local stor = getPlayerStorageValue(cid, 45471) - 60
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9999, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 7 then -- carrot cake
			if getPlayerStorageValue(cid, 45471) >= 50 then
				if getPlayerItemCount(cid, 2684) >= 5 and getPlayerItemCount(cid, 2006, 6) >= 1 and getPlayerItemCount(cid, 8841) >= 1 and getPlayerItemCount(cid, 2692) >= 10 and getPlayerItemCount(cid, 2328) >= 2 and getPlayerItemCount(cid, 2687) >= 10 and getPlayerItemCount(cid, 7910) >= 2 then
					if doPlayerRemoveItem(cid, 2684, 5) and doPlayerRemoveItem(cid, 2006, 1, 6) and doPlayerRemoveItem(cid, 8841, 1) and doPlayerRemoveItem(cid, 2692, 10) and doPlayerRemoveItem(cid, 2328, 2) and doPlayerRemoveItem(cid, 2687, 10) and doPlayerRemoveItem(cid, 7910, 2) then
						local stor = getPlayerStorageValue(cid, 45471) - 50
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 10000, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 8 then -- coconut shrimp bake
			if getPlayerStorageValue(cid, 45471) >= 10 then
				if getPlayerItemCount(cid, 2006, 6) >= 5 and getPlayerItemCount(cid, 2789) >= 5 and getPlayerItemCount(cid, 2788) >= 5 and getPlayerItemCount(cid, 11246) >= 10 and getPlayerItemCount(cid, 2670) >= 10 then
					if doPlayerRemoveItem(cid, 2006, 5, 6) and doPlayerRemoveItem(cid, 2789, 5) and doPlayerRemoveItem(cid, 2788, 5) and doPlayerRemoveItem(cid, 11246, 10) and doPlayerRemoveItem(cid, 2670, 10) then
						local stor = getPlayerStorageValue(cid, 45471) - 10
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 12540, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 9 then -- filled jalapeño peppers
			if getPlayerStorageValue(cid, 45471) >= 10 then
				if getPlayerItemCount(cid, 8844) >= 10 and getPlayerItemCount(cid, 8112) >= 2 and getPlayerItemCount(cid, 2805) >= 1 and getPlayerItemCount(cid, 2804) >= 1 and getPlayerItemCount(cid, 2006, 51) >= 1 and getPlayerItemCount(cid, 2328) >= 2 then
					if doPlayerRemoveItem(cid, 8844, 10) and doPlayerRemoveItem(cid, 8112, 2) and doPlayerRemoveItem(cid, 2805, 1) and doPlayerRemoveItem(cid, 2804, 1) and doPlayerRemoveItem(cid, 2006, 1, 51) and doPlayerRemoveItem(cid, 2328, 2) then
						local stor = getPlayerStorageValue(cid, 45471) - 10
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9998, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 10 then -- tropical fried terrorbird
			if getPlayerStorageValue(cid, 45471) >= 50 then
				if getPlayerItemCount(cid, 4265) >= 1 and getPlayerItemCount(cid, 8841) >= 2 and getPlayerItemCount(cid, 2675) >= 2 and getPlayerItemCount(cid, 5097) >= 2 and getPlayerItemCount(cid, 2799) >= 1 and getPlayerItemCount(cid, 2006, 14) >= 2 then
					if doPlayerRemoveItem(cid, 4265, 1) and doPlayerRemoveItem(cid, 8841, 2) and doPlayerRemoveItem(cid, 2675, 2) and doPlayerRemoveItem(cid, 5097, 2) and doPlayerRemoveItem(cid, 2799, 1) and doPlayerRemoveItem(cid, 2006, 2, 14) then
						local stor = getPlayerStorageValue(cid, 45471) - 50
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9995, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 11 then -- tropical fried terrorbird
			if getPlayerStorageValue(cid, 45471) >= 10 then
				if getPlayerItemCount(cid, 7250) >= 2 and getPlayerItemCount(cid, 2685) >= 2 and getPlayerItemCount(cid, 8842) >= 1 and getPlayerItemCount(cid, 2328) >= 2 and getPlayerItemCount(cid, 2805) >= 1 and getPlayerItemCount(cid, 2006, 15) >= 1 then
					if doPlayerRemoveItem(cid, 7250, 2) and doPlayerRemoveItem(cid, 2685, 2) and doPlayerRemoveItem(cid, 8842, 1) and doPlayerRemoveItem(cid, 2328, 2) and doPlayerRemoveItem(cid, 2805, 1) and doPlayerRemoveItem(cid, 2006, 1, 15) then
						local stor = getPlayerStorageValue(cid, 45471) - 10
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9993, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 12 then -- Pot of Blackjack
			if getPlayerStorageValue(cid, 45471) >= 80 then
				if getPlayerItemCount(cid, 11373) >= 5 and getPlayerItemCount(cid, 2006, 1) >= 2 and getPlayerItemCount(cid, 2684) >= 20 and getPlayerItemCount(cid, 8838) >= 10 and getPlayerItemCount(cid, 8844) >= 3 then
					if doPlayerRemoveItem(cid, 11373, 5) and doPlayerRemoveItem(cid, 2006, 2, 1) and doPlayerRemoveItem(cid, 2684, 20) and doPlayerRemoveItem(cid, 8838, 10) and doPlayerRemoveItem(cid, 8844, 3) then
						local stor = getPlayerStorageValue(cid, 45471) - 80
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 12542, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 13 then -- Roasted Dragon Wings
			if getPlayerStorageValue(cid, 45471) >= 20 then
				if getPlayerItemCount(cid, 4298) >= 1 and getPlayerItemCount(cid, 8844) >= 3 and getPlayerItemCount(cid, 2691) >= 5 and getPlayerItemCount(cid, 2328) >= 2 and getPlayerItemCount(cid, 2803) >= 1 and getPlayerItemCount(cid, 2788) >= 5 then
					if doPlayerRemoveItem(cid, 4298, 1) and doPlayerRemoveItem(cid, 8844, 3) and doPlayerRemoveItem(cid, 2691, 5) and doPlayerRemoveItem(cid, 2328, 2) and doPlayerRemoveItem(cid, 2803, 1) and doPlayerRemoveItem(cid, 2788, 5) then
						local stor = getPlayerStorageValue(cid, 45471) - 20
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9994, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 14 then -- Rotworm Stew
			if getPlayerStorageValue(cid, 45471) >= 60 then
				if getPlayerItemCount(cid, 2666) >= 2 and getPlayerItemCount(cid, 2006, 3) >= 2 and getPlayerItemCount(cid, 8838) >= 20 and getPlayerItemCount(cid, 8843) >= 1 and getPlayerItemCount(cid, 9114) >= 1 and getPlayerItemCount(cid, 2692) >= 5 then
					if doPlayerRemoveItem(cid, 2666, 2) and doPlayerRemoveItem(cid, 2006, 2, 3) and doPlayerRemoveItem(cid, 8838, 20) and doPlayerRemoveItem(cid, 8843, 1) and doPlayerRemoveItem(cid, 9114, 1) and doPlayerRemoveItem(cid, 2692, 5) then
						local stor = getPlayerStorageValue(cid, 45471) - 60
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9992, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 15 then -- Sweet Mangonaise Elixir
			if getPlayerStorageValue(cid, 45471) >= 10 then
				if getPlayerItemCount(cid, 2328) >= 40 and getPlayerItemCount(cid, 5097) >= 20 and getPlayerItemCount(cid, 5902) >= 10 and getPlayerItemCount(cid, 9674) >= 1 and getPlayerItemCount(cid, 5942) >= 1 then
					if doPlayerRemoveItem(cid, 2328, 40) and doPlayerRemoveItem(cid, 5097, 20) and doPlayerRemoveItem(cid, 5902, 10) and doPlayerRemoveItem(cid, 9674, 1) and doPlayerRemoveItem(cid, 5942, 1) then
						local stor = getPlayerStorageValue(cid, 45471) - 10
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 12544, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 16 then -- Veggie Casserole
			if getPlayerStorageValue(cid, 45471) >= 50 then
				if getPlayerItemCount(cid, 2684) >= 2 and getPlayerItemCount(cid, 2685) >= 2 and getPlayerItemCount(cid, 2686) >= 2 and getPlayerItemCount(cid, 8842) >= 2 and getPlayerItemCount(cid, 8843) >= 1 and getPlayerItemCount(cid, 9114) >= 1 and getPlayerItemCount(cid, 8112) >= 1 and getPlayerItemCount(cid, 2787) >= 20 and getPlayerItemCount(cid, 2789) >= 5 then
					if doPlayerRemoveItem(cid, 2684, 2) and doPlayerRemoveItem(cid, 2685, 2) and doPlayerRemoveItem(cid, 2686, 2) and doPlayerRemoveItem(cid, 8842, 2) and doPlayerRemoveItem(cid, 8843, 1) and doPlayerRemoveItem(cid, 9114, 1) and doPlayerRemoveItem(cid, 8112, 1) and doPlayerRemoveItem(cid, 2787, 20) and doPlayerRemoveItem(cid, 2789, 5) then
						local stor = getPlayerStorageValue(cid, 45471) - 50
						setPlayerStorageValue(cid, 45471, stor)
						doPlayerAddItem(cid, 9997, 1)
						npcHandler:say("bon appétit.", cid)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem o item.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem pontos suficientes.", cid)
				npcHandler.topic[cid] = 0
			end
			
		end
	
	elseif(msgcontains(msg, "no") and isInArray({1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, npcHandler.topic[cid])) then
		npcHandler:say("Hmm!", cid)
		npcHandler.topic[cid] = 0
	end
		
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'brown mushroom'}, 2789, 10, 'brown mushroom')
shopModule:addBuyableItem({'white mushroom'}, 2787, 10, 'white mushroom')
shopModule:addBuyableItem({'cherry'}, 2679, 1, 'cherry')
shopModule:addBuyableItem({'onion'}, 8843, 2, 'onion')
shopModule:addBuyableItem({'lemon'}, 8841, 3, 'lemon')
shopModule:addBuyableItem({'tomato'}, 2685, 5, 'tomato')
shopModule:addBuyableItem({'cucumber'}, 8842, 5, 'cucumber')
shopModule:addBuyableItem({'potato'}, 8838, 5, 'potato')
shopModule:addBuyableItem({'juice squeezer'}, 5865, 100, 'juice squeezer')
shopModule:addBuyableItem({'vial of milk'}, 2006, 500, 6, 'vial of milk')


npcHandler:setMessage(MESSAGE_GREET, "Boas vindas, |PLAYERNAME|! Se deseja se tornar um cozinheiro, digite: {entrar}. Se deseja comprar minhas mercadorias, digite: {trade}. Para cozinhar, digite o nome do food. Para ver todas as receitas, digite: {receitas}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Eu vendo alguns alimentos! Dê uma olhada.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())