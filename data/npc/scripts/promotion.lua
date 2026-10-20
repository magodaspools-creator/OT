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
	
	if msgcontains(msg, "yes") or msgcontains(msg, "sim") or msgcontains(msg, "promotion") or msgcontains(msg, "promote") then
		if getPlayerVocation(cid) == 1 then -- SORCERER
			setPlayerPromotionLevel(cid, 1)
			npcHandler:say("".. getCreatureName(cid) .." Você agora é um Epic Master Sorcerer! Um Mage muito poderoso. Poderá utilizar a spell {exevo gran mas mort} para dizimar seus inimigos.", cid)
			npcHandler.topic[cid] = 0
		elseif getPlayerVocation(cid) == 2 then -- DRUID
			setPlayerPromotionLevel(cid, 1)
			npcHandler:say("".. getCreatureName(cid) .." Você agora é um Epic Elder Druid! Um Druida com uma excelente cura, um paralize devastador e um dano muito grande. Poderá utilizar a spell {exevo gran mas pox} para acabar com seus inimigos.", cid)
			npcHandler.topic[cid] = 0
		elseif getPlayerVocation(cid) == 3 then -- PALADIN
			setPlayerPromotionLevel(cid, 1)
			npcHandler:say("".. getCreatureName(cid) .." Você agora é um Epic Royal Paladin! Um Caçador e Assassino impiedoso. Poderá utilizar a spell {exori gran con} para deletar seus inimigos. Combando com utito tempo san, essa spell fica ainda mais poderosa.", cid)
			npcHandler.topic[cid] = 0
		elseif getPlayerVocation(cid) == 4 then -- KNIGHT
			setPlayerPromotionLevel(cid, 1)
			npcHandler:say("".. getCreatureName(cid) .." Você agora é um Epic Elite Knight! Um guerreiro temido por muitos e sua defesa desejada por todos. Poderá utilizar a spell {exori gran ico} para aniquilar seus inimigos. Combando com utito tempo, essa spell fica ainda mais poderosa.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Desculpe ".. getCreatureName(cid) .." mas você já possui a promotion.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Parabéns |PLAYERNAME|, você é um MITO! Estou aqui para lhe promover. Você quer receber sua promotion? Diga {yes}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())