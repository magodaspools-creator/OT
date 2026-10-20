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
	    npcHandler:say("Agora são ".. time.hours ..":".. time.minutes ..". Talvez você queira comprar um relógio?", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "foot") or msgcontains(msg, "ball") or msgcontains(msg, "football") then
		npcHandler:say("Vocês humanos gostam deste jogo, hamm. Eu posso te vender por {5000} golds. Você aceita?",cid)
		npcHandler.topic[cid] = 1
	   
	--
	elseif msgcontains(msg, 'yes') then
        if npcHandler.topic[cid] == 1 then
			if getPlayerMoney(cid) >= 5000 then -- gold coin
				if doPlayerRemoveMoney(cid, 5000) then -- gold coin
					doPlayerAddItem(cid, 2109, 1) -- football
					npcHandler:say("Aqui está. Tenha cuidado com os quintais e telhados dos vizinhos.", cid)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você está brincando comigo? Você não tem dinheiro.", cid)
				npcHandler.topic[cid] = 0
			end
		end
		
	elseif(msgcontains(msg, "no") and isInArray({1}, npcHandler.topic[cid])) then
		npcHandler:say("Ok then.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'empty potion flask'}, 7636, 100, 'empty potion flask')
shopModule:addBuyableItem({'flask of rust remover'}, 9930, 50, 'flask of rust remover')
shopModule:addBuyableItem({'broom'}, 2324, 12, 'broom')
shopModule:addBuyableItem({'basket'}, 1989, 6, 'basket')
shopModule:addBuyableItem({'black book'}, 2325, 15, 'black book')
shopModule:addBuyableItem({'bottle'}, 2007, 3, 0, 'bottle')
shopModule:addBuyableItem({'baking tray'}, 2561, 20, 'baking tray')
shopModule:addBuyableItem({'bucket'}, 2005, 4, 0, 'bucket')
shopModule:addBuyableItem({'cleaver'}, 2568, 15, 'cleaver')
shopModule:addBuyableItem({'cup'}, 3941, 2, 0, 'cup')
shopModule:addBuyableItem({'candelabrum'}, 2041, 8, 'candelabrum')
shopModule:addBuyableItem({'closed trap'}, 2578, 280, 'closed trap')
shopModule:addBuyableItem({'crowbar'}, 2416, 260, 'crowbar')
shopModule:addBuyableItem({'empty flower pot'}, 7655, 250, 'empty flower pot')
shopModule:addBuyableItem({'document'}, 1952, 12, 'document')
shopModule:addBuyableItem({'fishing rod'}, 2580, 150, 'fishing rod')
shopModule:addBuyableItem({'backpack'}, 1988, 20, 'backpack')
shopModule:addBuyableItem({'bag'}, 1987, 5, 'bag')
shopModule:addBuyableItem({'machete'}, 2420, 35, 'machete')
shopModule:addBuyableItem({'fork'}, 2564, 10, 'fork')
shopModule:addBuyableItem({'pot'}, 2562, 30, 0, 'pot')
shopModule:addBuyableItem({'rolling pin'}, 2570, 12, 'rolling pin')
shopModule:addBuyableItem({'spoon'}, 2565, 10, 'spoon')
shopModule:addBuyableItem({'wooden spoon'}, 2567, 5, 'wooden spoon')
shopModule:addBuyableItem({'jug'}, 7244, 10, 0, 'jug')
shopModule:addBuyableItem({'kitchen knife'}, 2566, 10, 0, 'kitchen knife')
shopModule:addBuyableItem({'parchment'}, 1990, 10, 'parchment')
shopModule:addBuyableItem({'pick'}, 2553, 100, 'pick')
shopModule:addBuyableItem({'present'}, 1990, 10, 'present')
shopModule:addBuyableItem({'mug'}, 2012, 4, 0, 'mug')
shopModule:addBuyableItem({'rope'}, 2120, 50, 'rope')
shopModule:addBuyableItem({'scroll'}, 1949, 5, 'scroll')
shopModule:addBuyableItem({'pitchfork'}, 2548, 25, 'pitchfork')
shopModule:addBuyableItem({'hoe'}, 2552, 15, 'hoe')
shopModule:addBuyableItem({'rake'}, 2549, 20, 'rake')
shopModule:addBuyableItem({'scythe'}, 2550, 50, 'scythe')
shopModule:addBuyableItem({'hammer'}, 2557, 80, 'hammer')
shopModule:addBuyableItem({'oven spatula'}, 2569, 12, 'oven spatula')
shopModule:addBuyableItem({'pan'}, 2563, 20, 'pan')
shopModule:addBuyableItem({'inkwell'}, 2600, 10, 'inkwell')
shopModule:addBuyableItem({'shovel'}, 2554, 50, 'shovel')
shopModule:addBuyableItem({'torch'}, 11995, 2, 'torch')
shopModule:addBuyableItem({'saw'}, 2558, 95, 'saw')
shopModule:addBuyableItem({'watering can'}, 7734, 50, 'watering can')
shopModule:addBuyableItem({'plate'}, 2035, 6, 'plate')
shopModule:addBuyableItem({'watch'}, 2036, 20, 'watch')
shopModule:addBuyableItem({'vial of oil'}, 2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'worm'}, 3976, 1, 'worm')

shopModule:addSellableItem({'closed trap'}, 2578, 75, 'closed trap')
shopModule:addSellableItem({'crowbar'}, 2416, 50, 'crowbar')
shopModule:addSellableItem({'fishing rod'}, 2580, 40, 'fishing rod')
shopModule:addSellableItem({'machete'}, 2420, 6, 'machete')
shopModule:addSellableItem({'pick'}, 2553, 15, 'pick')
shopModule:addSellableItem({'rope'}, 2120, 15, 'rope')
shopModule:addSellableItem({'shovel'}, 2554, 8, 'shovel')
shopModule:addSellableItem({'scythe'}, 2550, 10, 'scythe')
shopModule:addSellableItem({'vial'}, 2006, 5, 'vial')
shopModule:addSellableItem({'watch'}, 2036, 6, 'watch')
shopModule:addSellableItem({'wooden hammer'}, 2556, 15, 'wooden hammer')
shopModule:addSellableItem({'blue book'}, 1963, 20, 'blue book')
shopModule:addSellableItem({'gemmed book'}, 1976, 100, 'gemmed book')
shopModule:addSellableItem({'green book'}, 1980, 15, 'green book')
shopModule:addSellableItem({'orange book'}, 1977, 30, 'orange book')
shopModule:addSellableItem({'inkwell'}, 2600, 8, 'inkwell')


npcHandler:setMessage(MESSAGE_GREET, "Hiho, Bezil ao seu serviço, |PLAYERNAME|. Nós vendemos equipamentos de todos os tipos.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte logo!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Volte logo!") 
npcHandler:setMessage(MESSAGE_SENDTRADE, "Não, desculpe, oi? negociar? Ok!")
 
keywordHandler:addKeyword({"dwarfs"}, StdModule.say, {npcHandler = npcHandler, text = "Meu povo é tão velho e robusto quanto a pedra da montanha em que vivemos."})
keywordHandler:addKeyword({"equipment"}, StdModule.say, {npcHandler = npcHandler, text = "Como você pode ver, nós oferecemos bastante, como tochas, pás e similares. Fale {trade} para dar uma olhada."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, text = "Eu vendo equipamentos de todo tipo. Existe alguma coisa que você precisa?"})
keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "Eu sou o Bezil Coinbiter. Eu vendo coisas, sabe?"})
keywordHandler:addKeyword({"nezil"}, StdModule.say, {npcHandler = npcHandler, text = "Ele é 'meu irmão'."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())