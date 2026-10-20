local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(SOUTH)     npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
	return false
end
 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "hallowed axe") or msgcontains(msg, "axe") then
		selfSay("Voce quer que eu encante seu Axe por " .. DOAK_HALLOWEDAXE_PRICE .. " gold coins?", cid)
		talkState[talkUser] = 1
		
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid, 45502) >= 1 then
			if getPlayerItemCount(cid, DOAK_IDAXE) >= 1 and getPlayerMoney(cid) >= DOAK_HALLOWEDAXE_PRICE then
				if doPlayerRemoveMoney(cid, DOAK_HALLOWEDAXE_PRICE) then
					doPlayerRemoveItem(cid, DOAK_IDAXE, 1)
					doPlayerAddItem(cid, DOAK_IDHALLOWEDAXE, 1)
					selfSay("Pronto, aqui está. Com esse Hallowed Axe, você pode defender o mundo contra o {demon oak}.", cid)
					talkState[talkUser] = 0
				end
			else
				selfSay("Eu preciso de um axe e " .. DOAK_HALLOWEDAXE_PRICE.. " gold coins para fazer um {hallowed axe}.", cid)
				talkState[talkUser] = 0
			end
		else
			selfSay("Primeiro você deve finalizar a task especial dos 6666 demons com o NPC {Grizzly Adams} ou comprar de algum jogador.", cid)
			talkState[talkUser] = 0
		end
		
	elseif msgcontains(msg, "demon oak") or msgcontains(msg, "quest") or msgcontains(msg, "mission") then
		selfSay("Você conseguiu derrotar o Demon Oak?", cid)
		talkState[talkUser] = 2
 
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
		if getPlayerStorageValue(cid, DOAK_STORAGE.FINALIZACAO) == 1 then
			doPlayerSetStorageValue(cid, DOAK_STORAGE.FINALIZACAO, 2)
			selfSay("Muito Bem! Agora você tem acesso ao tesouro do Demon Oak. Ele fica localizado no cemitério da cidade Yurots, à esquerda do DEPOT. Basta dar use em uma das lápides {gravestone}.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Voce deve derrotar o Demon Oak primeiro.", cid)
			talkState[talkUser] = 0
		end
 
	elseif msgcontains(msg, "no") and (talkState[talkUser] >= 1 and talkState[talkUser] <= 3) then
		selfSay("Ta bom.", cid)
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())