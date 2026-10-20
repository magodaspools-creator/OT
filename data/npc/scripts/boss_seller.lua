local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(WEST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(WEST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, 'dodge') then 
		npcHandler:say("Você quer trocar {20 boss points} por {1 dodge}?", cid)
		npcHandler.topic[cid] = 1
	end
		
	if msgcontains(msg, 'critical') then 
		npcHandler:say("Você quer trocar {20 boss points} por {1 critical}?", cid)
		npcHandler.topic[cid] = 2
	end
		
	if msgcontains(msg, 'event ring') then 
		npcHandler:say("Você quer trocar {5 boss points} por {1 event ring}?", cid)
		npcHandler.topic[cid] = 3
	end
	
	if msgcontains(msg, 'might ring') then 
		npcHandler:say("Você quer trocar {5 boss points} por {1 might ring}?", cid)
		npcHandler.topic[cid] = 4
	end
	
	if msgcontains(msg, 'stone skin amulet') then 
		npcHandler:say("Você quer trocar {5 boss points} por {1 stone skin amulet}?", cid)
		npcHandler.topic[cid] = 5
	end
	
	if msgcontains(msg, 'stamina refiller') then 
		npcHandler:say("Você quer trocar {20 boss points} por {1 stamina refiller}?", cid)
		npcHandler.topic[cid] = 6
	end
	
	if msgcontains(msg, 'event backpack') then 
		npcHandler:say("Você quer trocar {65 boss points} por {1 event backpack}?", cid)
		npcHandler.topic[cid] = 7
	end
	
	if msgcontains(msg, 'bronze vip days') then 
		npcHandler:say("Você quer trocar {40 boss points} por {1 bronze vip days}?", cid)
		npcHandler.topic[cid] = 8
	end
		
	
-----------------------------------------------------------------------------------
	
	if msgcontains(msg, "yes") or msgcontains(msg, "sim") then	
		if npcHandler.topic[cid] == 1 then -- dodge
			if getPlayerItemCount(cid, 12700) >= 20 then
				if doPlayerRemoveItem(cid, 12700, 20) then
					npcHandler:say("Boa escolha! Dodge.", cid)
					doPlayerAddItem(cid, 12804, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
		
		elseif npcHandler.topic[cid] == 2 then -- critical
			if getPlayerItemCount(cid, 12700) >= 20 then
				if doPlayerRemoveItem(cid, 12700, 20) then
					npcHandler:say("Boa escolha! Critical.", cid)
					doPlayerAddItem(cid, 12805, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
		
		elseif npcHandler.topic[cid] == 3 then -- event ring
			if getPlayerItemCount(cid, 12700) >= 5 then
				if doPlayerRemoveItem(cid, 12700, 5) then
					npcHandler:say("Boa escolha! Event Ring.", cid)
					doPlayerAddItem(cid, 12847, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 4 then -- might ring
			if getPlayerItemCount(cid, 12700) >= 5 then
				if doPlayerRemoveItem(cid, 12700, 5) then
					npcHandler:say("Boa escolha! Might Ring.", cid)
					doPlayerAddItem(cid, 2164, 35)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 5 then -- stone skin amulet
			if getPlayerItemCount(cid, 12700) >= 5 then
				if doPlayerRemoveItem(cid, 12700, 5) then
					npcHandler:say("Boa escolha! Stone Skin Amulet.", cid)
					doPlayerAddItem(cid, 2197, 20)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 6 then -- stamina refiller
			if getPlayerItemCount(cid, 12700) >= 20 then
				if doPlayerRemoveItem(cid, 12700, 20) then
					npcHandler:say("Boa escolha! Stamina Refiller.", cid)
					doPlayerAddItem(cid, 12849, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 7 then -- event backpack
			if getPlayerItemCount(cid, 12700) >= 65 then
				if doPlayerRemoveItem(cid, 12700, 65) then
					npcHandler:say("Boa escolha! Event Backpack.", cid)
					doPlayerAddItem(cid, 12882, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 8 then -- bronze vip days
			if getPlayerItemCount(cid, 12700) >= 40 then
				if doPlayerRemoveItem(cid, 12700, 40) then
					npcHandler:say("Boa escolha! Bronze Vip Days.", cid)
					doPlayerAddItem(cid, 12879, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui boss points suficiente.", cid)
				npcHandler.topic[cid] = 0
			end

		end

	elseif(msgcontains(msg, "no") and isInArray({1,2,3,4,5,6,7,8}, npcHandler.topic[cid])) then
		npcHandler:say("Ok then.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end


npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|! Eu vendo alguns itens em troca de Boss Points. Para saber mais, diga {itens}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")

keywordHandler:addKeyword({"itens"}, StdModule.say, {npcHandler = npcHandler, text = "Eu vendo os seguintes itens: {Dodge}, {Critical}, {Event Ring}, {Might Ring}, {Stone Skin Amulet}, {Stamina Refiller}, {Event Backpack} e {Bronze Vip Days}."})
keywordHandler:addAliasKeyword({"item"})
keywordHandler:addAliasKeyword({"itens"})
keywordHandler:addAliasKeyword({"iten"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())