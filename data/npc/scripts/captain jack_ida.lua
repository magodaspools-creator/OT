local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end


function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
	end
	
	local tp_continent = {x=1919, y=2070, z=7}
	local tp_inq = {x=393, y=2028, z=10}
	local tp_poi = {x=1831, y=2051, z=12}
	if msgcontains(msg, "go") or msgcontains(msg, "travel") or msgcontains(msg, "passage") then
		npcHandler:say("Posso te levar para: {Ferumbras Tower}, {Inquisition} ou {Pits of Inferno}. Diga para onde quer ir.", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "ferumbras") or msgcontains(msg, "ferumbras tower") or msgcontains(msg, "continent") then
		npcHandler:say("Então você está procurando por uma passagem para o continente do Ferumbras por 5000 de ouro?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "inq") or msgcontains(msg, "inquisition") then
		npcHandler:say("Eu posso te levar mas não vou ficar lá. É perigoso! Você pode pegar o acesso rápido que seria por teleport, para voltar. Você quer ir por 8000 de ouro?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "poi") or msgcontains(msg, "pits of inferno") or msgcontains(msg, "poh") then
		npcHandler:say("Eu posso te levar mas não vou ficar lá. É perigoso! Você pode pegar o acesso rápido que seria por teleport, para voltar. Você quer ir por 5000 de ouro?", cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "pumpkin") then
		npcHandler:say("Oh!! Em minhas viagens para a {ilha perdida}, eu sempre trago uns Pumpkins para mim. Eu acho que não deveria ter falado isso. Bem, lhe vendo por 1,000 golds. Diga {yes}.", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "ilha perdida") then
		npcHandler:say("O que? Eu não sei de nada, vá embora.", cid)
		npcHandler.topic[cid] = 0
	
----------------------------------------------------------------------------

	elseif msgcontains(msg, "yes") or msgcontains(msg, "sim") then
		if npcHandler.topic[cid] == 1 then
			if not isPlayerPzLocked(cid) then
				if getPlayerMoney(cid) >= 5000 then 
					if doPlayerRemoveMoney(cid, 5000) then
						npcHandler:say("Que os bons deuses tenham piedade de você.", cid)
						npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
						doTeleportThing(cid, tp_continent)
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Haha, você está pobre?!", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if not isPlayerPzLocked(cid) then
				if getPlayerMoney(cid) >= 8000 then 
					if doPlayerRemoveMoney(cid, 8000) then
						npcHandler:say("Que os bons deuses tenham piedade de você.", cid)
						npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
						doTeleportThing(cid, tp_inq)
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Haha, você está pobre?!", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			if not isPlayerPzLocked(cid) then
				if getPlayerMoney(cid) >= 5000 then 
					if doPlayerRemoveMoney(cid, 5000) then
						npcHandler:say("Que os bons deuses tenham piedade de você.", cid)
						npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
						doTeleportThing(cid, tp_poi)
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Haha, você está pobre?!", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			if not isPlayerPzLocked(cid) then
				if getPlayerMoney(cid) >= 1000 then 
					if doPlayerRemoveMoney(cid, 1000) then
						npcHandler:say("Toma! Hey, se for um bom carpinteiro e usar uma Kitchen Knife, talvez saia algo legal disso. Ah, aproveita e coloca uma candlestick para deixar brilhando.", cid)
						npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
						doPlayerAddItem(cid, 2683, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Haha, você está pobre?! Bem, eu não iria vender mesmo HIHI.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
		end
		
	elseif(msgcontains(msg, "no") and isInArray({1,2,3}, npcHandler.topic[cid])) then
		npcHandler:say("Ok. Maybe later.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ahoy, amigo. Você tem sorte de me pegar aqui. Eu estava me preparando para zarpar. Diga {travel} para viajar comigo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus. Você é bem vindo.")
 
keywordHandler:addKeyword({"monks"}, StdModule.say, {npcHandler = npcHandler, text = "The order of the white raven."})
keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "I'm m ol' Captain Jack."})
keywordHandler:addKeyword({"sail"}, StdModule.say, {npcHandler = npcHandler, text = "I work as a kind of ferryman. I transport wares and travellers for the monks between the continent and the isle."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())