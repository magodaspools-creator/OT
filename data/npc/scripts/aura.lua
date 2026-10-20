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
	
	if msgcontains(msg, "aura") then
		if getPlayerStorageValue(cid, 25950) <= 0 then
			setPlayerStorageValue(cid, 25950, 1)
			efeitosAura(1,25000/8,cid)
			npcHandler:say("".. getCreatureName(cid) ..", você recebeu uma AURA! Ela vai ser útil em suas batalhas. Você vai receber regen HP e MP de acordo com a % dos mesmos. Ouça, para saber sobre os comandos, digite {comandos} ou utilize o comando {!aura}.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Desculpe ".. getCreatureName(cid) .." mas você já possui AURA.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "|PLAYERNAME|, você derrotou o Nervous Lizard! Diga {aura} para que eu possa lhe dar este poder de possuir uma aura em seu personagem.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus!")

keywordHandler:addKeyword({"comandos"}, StdModule.say, {npcHandler = npcHandler, text = "!aura on/off ativa ou desativa o efeito da aura (a cura da AURA permanece ativa). !aura 1 (troca de efeito, pode utilizar !aura 1, !aura 2 ...)"})
keywordHandler:addAliasKeyword({"comando"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())