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
	
	if msgcontains(msg, "time") then
	   local time = getTibiaTime()
	   npcHandler:say("Claro! Agora são: ".. time.hours ..":".. time.minutes ..".", cid)
	   npcHandler.topic[cid] = 0
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'black pearl'}, 2144, 560, 'black pearl')
shopModule:addBuyableItem({'small amethyst'}, 2150, 400, 'small amethyst')
shopModule:addBuyableItem({'small diamond'}, 2145, 600, 'small diamond')
shopModule:addBuyableItem({'small emerald'}, 2149, 500, 'small emerald')
shopModule:addBuyableItem({'small ruby'}, 2147, 500, 'small ruby')
shopModule:addBuyableItem({'small sapphire'}, 2146, 500, 'small sapphire')
shopModule:addBuyableItem({'small topaz'}, 9970, 500, 'small topaz')
shopModule:addBuyableItem({'white pearl'}, 2143, 320, 'white pearl')

shopModule:addSellableItem({'black pearl'}, 2144, 280, 'black pearl')
shopModule:addSellableItem({'giant shimmering pearl'}, 7632, 3000, 'giant shimmering pearl')
shopModule:addSellableItem({'gold ingot'}, 9971, 5000, 'gold ingot')
shopModule:addSellableItem({'blue gem'}, 2158, 5000, 'blue gem')
shopModule:addSellableItem({'green gem'}, 2155, 5000, 'green gem')
shopModule:addSellableItem({'red gem'}, 2156, 1000, 'red gem')
shopModule:addSellableItem({'violet gem'}, 2153, 10000, 'violet gem')
shopModule:addSellableItem({'yellow gem'}, 2154, 1000, 'yellow gem')
shopModule:addSellableItem({'small amethyst'}, 2150, 200, 'small amethyst')
shopModule:addSellableItem({'small diamond'}, 2145, 300, 'small diamond')
shopModule:addSellableItem({'small emerald'}, 2149, 250, 'small emerald')
shopModule:addSellableItem({'small enchanted amethyst'}, 7762, 200, 'small enchanted amethyst')
shopModule:addSellableItem({'small enchanted emerald'}, 7761, 250, 'small enchanted emerald')
shopModule:addSellableItem({'small enchanted sapphire'}, 7759, 250, 'small enchanted sapphire')
shopModule:addSellableItem({'small enchanted ruby'}, 7760, 250, 'small enchanted ruby')
shopModule:addSellableItem({'small ruby'}, 2147, 250, 'small ruby')
shopModule:addSellableItem({'small sapphire'}, 2146, 250, 'small sapphire')
shopModule:addSellableItem({'small topaz'}, 9970, 200, 'small topaz')
shopModule:addSellableItem({'white pearl'}, 2143, 160, 'white pearl')
shopModule:addSellableItem({'orichalcum pearl'}, 5022, 40, 'orichalcum pearl')

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo, |PLAYERNAME|! Eu compro todas as jóias e gemas.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Dê uma olhada.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())