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
	
	local tp_yurots = {x=2052, y=2051, z=7}
	local tp_upper = {x=2793, y=622, z=6}
	if msgcontains(msg, "exit") or msgcontains(msg, "yurots") then
		npcHandler:say("Posso te levar para o templo yurots de graça. Você quer ir? Diga: {yes}", cid)
		npcHandler.topic[cid] = 1
		
	elseif msgcontains(msg, "north") or msgcontains(msg, "upper") then
		if getPlayerStorageValue(cid, 45490) >= 2 then
			npcHandler:say("Posso te levar para o norte de roshamuul de graça. Você quer ir? Diga: {yes}", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Você precisa fazer a primeira missão de acesso com o npc {Sandomo}. Ele fica localizado aqui, em uma cabana um pouco ao norte.", cid)
			npcHandler.topic[cid] = 0
		end
	
----------------------------------------------------------------------------

	elseif msgcontains(msg, "yes") or msgcontains(msg, "sim") then
		if npcHandler.topic[cid] == 1 then
			if not isPlayerPzLocked(cid) then
				npcHandler:say("Vamos nessa.", cid)
				npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
				doTeleportThing(cid, tp_yurots)
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 2 then
			if not isPlayerPzLocked(cid) then
				npcHandler:say("Dentro da cidade você estará seguro.", cid)
				npcHandler.topic[cid] = 0 -- TOPIC vem primeiro antes de teleportar (evitar BUG)
				doTeleportThing(cid, tp_upper)
			else
				npcHandler:say("Desculpe, você não pode estar com {'PZ Bloked'}.", cid)
				npcHandler.topic[cid] = 0
			end
		end
		
	elseif(msgcontains(msg, "no") and isInArray({1,2}, npcHandler.topic[cid])) then
		npcHandler:say("Ok.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Seja bem vindo, |PLAYERNAME|. Diga {exit} se quiser voltar para yurots ou {upper} para eu te levar ao norte de roshamuul.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus. Você é sempre bem vindo.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())