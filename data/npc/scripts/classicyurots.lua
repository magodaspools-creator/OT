local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

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
	
	if (msgcontains(msg, "blessings") or msgcontains(msg, "blessing") or msgcontains(msg, "bless") or msgcontains(msg, "all")) then
		npcHandler:say("Para comprar bless, utilize o comando {!bless}.", cid)
		npcHandler.topic[cid] = 0
			
	elseif (msgcontains(msg, "poi") or msgcontains(msg, "pits") or msgcontains(msg, "pits of inferno")) then
		npcHandler.topic[cid] = 1
		npcHandler:say("Você quer ser teleportado para sala de teleports da POI por {10000} golds?", cid)
		
		
	elseif (msgcontains(msg, "yes") or msgcontains(msg, "ok")) then	
		if npcHandler.topic[cid] == 1 then
			if getPlayerStorageValue(cid, 45220) >= 0 then
				if doPlayerRemoveMoney(cid, 10000) then
					npcHandler:say("Boa sorte!", cid)
					doTeleportThing(cid, {x = 146, y = 1939, z = 13})
					npcHandler.topic[cid] = 0
				else
					npcHandler:say("Desculpe, você não possui {10000} golds.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Desculpe, para ser teleportado você precisa ao menos chegar na sala dos teleports.", cid)
				npcHandler.topic[cid] = 0
			end
		end
				
	elseif (msgcontains(msg, "heal") or msgcontains(msg, "cure")) then
		if getCreatureCondition(cid, CONDITION_FIRE) == true then
			npcHandler:say("Oh "..getCreatureName(cid)..", você está queimando! Vou te ajudar.", cid)
			doRemoveCondition(cid, CONDITION_FIRE)
			doSendMagicEffect(getCreaturePosition(cid), 14)
			npcHandler.topic[cid] = 0
		elseif getCreatureCondition(cid, CONDITION_POISON) == true then
			npcHandler:say("Você está envenenado. Vou te ajudar.", cid)
			doRemoveCondition(cid, CONDITION_POISON)
			doSendMagicEffect(getCreaturePosition(cid), 13)
			npcHandler.topic[cid] = 0
		elseif getCreatureHealth(cid) < 250 then
			npcHandler:say("Você está parecendo muito mal. Deixe-me curar suas feridas.", cid)
			doCreatureAddHealth(cid, 250 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Você não está muito mal,  " .. getCreatureName(cid) .. ". Eu só ajudo em casos de emergências reais. Cure sua saúde simplesmente comendo {food}.", cid)
			npcHandler.topic[cid] = 0
		end
    end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())