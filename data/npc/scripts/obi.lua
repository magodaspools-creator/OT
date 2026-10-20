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
	   npcHandler:say("Agora são exatamente: ".. time.hours ..":".. time.minutes ..".", cid)
	   npcHandler.topic[cid] = 0
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

--RINGS
shopModule:addBuyableItem({'axe ring'}, 2208, 500, 'axe ring')
shopModule:addBuyableItem({'club ring'}, 2209, 500, 'club ring')
shopModule:addBuyableItem({'dwarven ring'}, 2213, 2000, 'dwarven ring')
shopModule:addBuyableItem({'energy ring'}, 2167, 2000, 'energy ring')
shopModule:addBuyableItem({'life ring'}, 2168, 900, 'life ring')
shopModule:addBuyableItem({'might ring'}, 2164, 15000, 'might ring')
shopModule:addBuyableItem({'power ring'}, 2166, 100, 'power ring')
shopModule:addBuyableItem({'ring of healing'}, 2214, 2000, 'ring of healing')
shopModule:addBuyableItem({'stealth ring'}, 2165, 5000, 'stealth ring')
shopModule:addBuyableItem({'sword ring'}, 2207, 500, 'sword ring')
shopModule:addBuyableItem({'time ring'}, 2169, 2000, 'time ring')
--AMULET E NECKLACE
shopModule:addBuyableItem({'amulet of loss'}, 2173, 50000, 'amulet of loss')
--shopModule:addBuyableItem({'beetle necklace'}, 11374, 15000, 'beetle necklace')
shopModule:addBuyableItem({'bronze amulet'}, 2172, 100, 'bronze amulet')
--shopModule:addBuyableItem({'dragon necklace'}, 2201, 1000, 'dragon necklace')
shopModule:addBuyableItem({'elven amulet'}, 2198, 500, 'elven amulet')
shopModule:addBuyableItem({'garlic necklace'}, 2199, 100, 'garlic necklace')
--shopModule:addBuyableItem({'leviathan\'s amulet'}, 10220, 30000, 'leviathan\'s amulet')
shopModule:addBuyableItem({'lightning pendant'}, 7889, 15000, 'lightning pendant')
shopModule:addBuyableItem({'magma amulet'}, 7890, 15000, 'magma amulet')
shopModule:addBuyableItem({'platinum amulet'}, 2171, 10000, 'platinum amulet')
shopModule:addBuyableItem({'protection amulet'}, 2200, 700, 'protection amulet')
shopModule:addBuyableItem({'scarf'}, 2661, 15, 'scarf')
shopModule:addBuyableItem({'stone skin amulet'}, 2197, 15000, 'stone skin amulet')
shopModule:addBuyableItem({'strange talisman'}, 2161, 100, 'strange talisman')
shopModule:addBuyableItem({'terra amulet'}, 7887, 15000, 'terra amulet')

-- RINGS
shopModule:addSellableItem({'axe ring'}, 2208, 100, 'axe ring')
shopModule:addSellableItem({'club ring'}, 2209, 100, 'club ring')
shopModule:addSellableItem({'dwarven ring'}, 2213, 100, 'dwarven ring')
shopModule:addSellableItem({'energy ring'}, 2167, 100, 'energy ring')
shopModule:addSellableItem({'life ring'}, 2168, 50, 'life ring')
shopModule:addSellableItem({'might ring'}, 2164, 250, 'might ring')
shopModule:addSellableItem({'power ring'}, 2166, 50, 'power ring')
shopModule:addSellableItem({'ring of healing'}, 2214, 100, 'ring of healing')
shopModule:addSellableItem({'stealth ring'}, 2165, 200, 'stealth ring')
shopModule:addSellableItem({'sword ring'}, 2207, 100, 'sword ring')
shopModule:addSellableItem({'time ring'}, 2169, 100, 'time ring')
-- AMULET E NECKLACE
shopModule:addSellableItem({'ancient amulet'}, 2142, 200, 'ancient amulet')
shopModule:addSellableItem({'amulet of loss'}, 2173, 45000, 'amulet of loss')
shopModule:addSellableItem({'beetle necklace'}, 11374, 1500, 'beetle necklace')
shopModule:addSellableItem({'bronze amulet'}, 2172, 10, 'bronze amulet')
shopModule:addSellableItem({'dragon necklace'}, 2201, 100, 'dragon necklace')
shopModule:addSellableItem({'elven amulet'}, 2198, 50, 'elven amulet')
shopModule:addSellableItem({'garlic necklace'}, 2199, 10, 'garlic necklace')
shopModule:addSellableItem({'golden amulet'}, 2130, 2000, 'agolden amulet')
shopModule:addSellableItem({'leviathan\'s amulet'}, 10220, 3000, 'leviathan\'s amulet')
shopModule:addSellableItem({'lightning pendant'}, 7889, 4500, 'lightning pendant')
shopModule:addSellableItem({'magma amulet'}, 7890, 1500, 'magma amulet')
shopModule:addSellableItem({'platinum amulet'}, 2171, 1000, 'platinum amulet')
shopModule:addSellableItem({'protection amulet'}, 2200, 70, 'protection amulet')
shopModule:addSellableItem({'scarf'}, 2661, 1, 'scarf')
shopModule:addSellableItem({'stone skin amulet'}, 2197, 500, 'stone skin amulet')
shopModule:addSellableItem({'strange talisman'}, 2161, 10, 'strange talisman')
shopModule:addSellableItem({'terra amulet'}, 7887, 1500, 'terra amulet')

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Tenho muitas variedades de amuletos e anéis. Você gostaria de me vender seu anel?")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())