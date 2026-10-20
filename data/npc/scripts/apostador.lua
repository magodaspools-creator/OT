local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(SOUTH)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(SOUTH)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "info") or msgcontains(msg, "tutorial") then
		npcHandler:say({"Você escolhe entre {L} ou {H}. Em seguida o valor para apostar, entre {1k} até {1kk}. ...",
						"{L} significa LOW que vai de 1 à 3. {H} significa HIGH que vai de 4 à 6. ...",
						"Se o dado cair no número que você escolheu, receberá o VALOR apostado * 1.5. ...",
						"Para apostar, digite: {apostar} ou {jogar}!"}, cid, 4000)
						npcHandler.topic[cid] = 0
	
	elseif msgcontains(msg, "jogar") or msgcontains(msg, "apostar") then
		npcHandler:say("Escolha entre {L} ou {H}.", cid)
		npcHandler.topic[cid] = 1
		
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "l") or msgcontains(msg, "low") then
			npcHandler:say("Digite o valor: Mínimo {1000}(1k) e Máximo {1000000}(1kk).", cid)
			npcHandler.topic[cid] = 2
			
		elseif msgcontains(msg, "h") or msgcontains(msg, "high") then
			npcHandler:say("Digite o valor: Mínimo {1000}(1k) e Máximo {1000000}(1kk).", cid)
			npcHandler.topic[cid] = 3
		end
			
	elseif npcHandler.topic[cid] == 2 then -- LOW
		local valor = tonumber(msg)
		local playerNumber = math.random(1, 6)
		if tonumber(msg) == nil or valor <= 999 or valor >= 1000001 then
			npcHandler:say("São aceitos apenas números entre {1000 ~ 1000000}.", cid)
			npcHandler.topic[cid] = 0
			
		elseif doPlayerRemoveMoney(cid, valor) then
			local npceffect = getCreaturePosition(getNpcCid())
			local pagamento = math.ceil(valor * 1.5)
			if playerNumber >= 1 and playerNumber <= 3 then
				doSendMagicEffect(npceffect, 26)
				doCreatureSay(getNpcCid(), "Rolled a " .. playerNumber .. ".", TALKTYPE_ORANGE_1)
				npcHandler:say("Parabéns! Você ganhou " .. pagamento .. " gold coins! Se quiser jogar novamente digite: {L} ou {H}.", cid)
				doSendAnimatedText(getCreaturePosition(cid), "You Win!", TEXTCOLOR_LIGHTGREEN)
				doPlayerAddMoney(cid, pagamento)
				npcHandler.topic[cid] = 1
			else
				doSendMagicEffect(npceffect, 26)
				doCreatureSay(getNpcCid(), "Rolled a " .. playerNumber .. ".", TALKTYPE_ORANGE_1)
				npcHandler:say("Você perdeu. Se quiser jogar novamente digite: {L} ou {H}.", cid)
				doSendAnimatedText(getCreaturePosition(cid), "You Lose!", TEXTCOLOR_RED)
				npcHandler.topic[cid] = 1
			end
		else
			npcHandler:say("Você não tem dinheiro para apostar.", cid)
			npcHandler.topic[cid] = 0
		end
		
	elseif npcHandler.topic[cid] == 3 then -- HIGH
		local valor = tonumber(msg)
		local playerNumber = math.random(1, 6)
		if tonumber(msg) == nil or valor <= 999 or valor >= 1000001 then
			npcHandler:say("São aceitos apenas números entre {1000 ~ 1000000}.", cid)
			npcHandler.topic[cid] = 0
			
		elseif doPlayerRemoveMoney(cid, valor) then
			local npceffect = getCreaturePosition(getNpcCid())
			local pagamento = math.ceil(valor * 1.5)
			if playerNumber >= 4 and playerNumber <= 6 then
				doSendMagicEffect(npceffect, 26)
				doCreatureSay(getNpcCid(), "Rolled a " .. playerNumber .. ".", TALKTYPE_ORANGE_1)
				npcHandler:say("Parabéns! Você ganhou " .. pagamento .. " gold coins! Se quiser jogar novamente digite: {L} ou {H}.", cid)
				doSendAnimatedText(getCreaturePosition(cid), "You Win!", TEXTCOLOR_LIGHTGREEN)
				doPlayerAddMoney(cid, pagamento)
				npcHandler.topic[cid] = 1
			else
				doSendMagicEffect(npceffect, 26)
				doCreatureSay(getNpcCid(), "Rolled a " .. playerNumber .. ".", TALKTYPE_ORANGE_1)
				npcHandler:say("Você perdeu. Se quiser jogar novamente digite: {L} ou {H}.", cid)
				doSendAnimatedText(getCreaturePosition(cid), "You Lose!", TEXTCOLOR_RED)
				npcHandler.topic[cid] = 1
			end
		else
			npcHandler:say("Você não tem dinheiro para apostar.", cid)
			npcHandler.topic[cid] = 0
		end
		
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|! Para informações, digite: {info}. Para apostar, digite: {jogar}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Hm.")

keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "I am Klaus."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())