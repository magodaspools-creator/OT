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
	
	if msgcontains(msg, "cozinhar") or msgcontains(msg, "cook") or msgcontains(msg, "gastronomia") then
	    npcHandler:say("Procure o {Erique Jacquan} na área de treiners. Ele pode lhe ajudar com a gastronomia.", cid)
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "bunch of Ripe Rice") then
	    npcHandler:say("Você pode adquirir esse item dropando de: {Killer Caiman}, {Lizard High Guard}, {Lizard Dragon Priest} e {Lizard Legionnaire}.", cid)
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "rice ball") then
	    npcHandler:say("Se você me der 1 {Bunch of Ripe Rice}, eu lhe darei 10 Rice Balls. Diga {yes} se tiver o item.", cid)
		npcHandler.topic[cid] = 1
	end
	
	if msgcontains(msg, "yes") or msgcontains(msg, "sim") then	
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid, 11245) >= 1 then
				if doPlayerRemoveItem(cid, 11245, 1) then
					doPlayerAddItem(cid, 11246, 10)
					npcHandler:say("Fico muito agradecido.", cid)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem o item.", cid)
				npcHandler.topic[cid] = 0
			end
		end
		
	elseif(msgcontains(msg, "no") and isInArray({1}, npcHandler.topic[cid])) then
		npcHandler:say("Tudo bem!", cid)
		npcHandler.topic[cid] = 0
	end

	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'brown mushroom'}, 2789, 10, 'brown mushroom')
shopModule:addBuyableItem({'carrot'}, 2684, 8, 'carrot')
shopModule:addBuyableItem({'cheese'}, 8112, 6, 'cheese')
shopModule:addBuyableItem({'cherry'}, 2679, 1, 'cherry')
shopModule:addBuyableItem({'ham'}, 2671, 15, 'ham')
shopModule:addBuyableItem({'meat'}, 2666, 10, 'meat')
shopModule:addBuyableItem({'white mushroom'}, 2787, 10, 'white mushroom')

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo, |PLAYERNAME|. Na minha loja vendemos todo tipo de alimento. Caso queira fazer FOOD's, digite: {cozinhar}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte logo!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Volte logo!") 
npcHandler:setMessage(MESSAGE_SENDTRADE, "Compre tudo e fique cheio HAHA!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())