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
	
	local tp_continent = {x=1944, y=2037, z=7}
	if msgcontains(msg, "go") or msgcontains(msg, "travel") or msgcontains(msg, "passage") then
		npcHandler:say("Então você querendo voltar para o continente Yurots? Posso te levar de graça, aceita?", cid)
		npcHandler.topic[cid] = 1
	
----------------------------------------------------------------------------

	elseif msgcontains(msg, "yes") or msgcontains(msg, "sim") then
		if npcHandler.topic[cid] == 1 then
			if not isPlayerPzLocked(cid) then
				npcHandler:say("Boa Viagem!", cid)
				npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
				doTeleportThing(cid, tp_continent)
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
		end
		
	elseif(msgcontains(msg, "no") and isInArray({1}, npcHandler.topic[cid])) then
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