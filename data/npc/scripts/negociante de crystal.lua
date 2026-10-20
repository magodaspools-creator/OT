local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(WEST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(WEST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function getItemsFromList(items)
	local str = ''
	if table.maxn(items) > 0 then
		for i = 1, table.maxn(items) do
			str = str .. items[i][2] .. ' ' .. getItemNameById(items[i][1])
			if i ~= table.maxn(items) then str = str .. ', ' 
			end 
		end 
	end
	return str
end

function doRemoveItemsFromList(cid,items)
	local count = 0
	if table.maxn(items) > 0 then
		for i = 1, table.maxn(items) do
			if getPlayerItemCount(cid,items[i][1]) >= items[i][2] then
			count = count + 1 end 
		end 
	end
	if count == table.maxn(items) then
		for i = 1, table.maxn(items) do doPlayerRemoveItem(cid,items[i][1],items[i][2]) end
	else 
		return false 
	end
	return true 
end

function doChangeWeapon(cid, message, keywords, parameters, node) -- by vodka
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if (isPlayerPremiumCallback == nil or isPlayerPremiumCallback(cid) == true or parameters.premium == false) then
		if(parameters.level ~= nil and getPlayerLevel(cid) < parameters.level) then
			npcHandler:say('Desculpe, você precisa ter level ' .. parameters.level .. ' ou mais para forjar este item.', cid)
			npcHandler.topic[cid] = 0
		elseif not doRemoveItemsFromList(cid,parameters.items) then
			npcHandler:say('Desculpe, mas você não tem {'..getItemsFromList(parameters.items)..'} para forjar este item!', cid)
			npcHandler.topic[cid] = 0
		else
			local r = parameters.chance
			local v = math.random(1, 100)
			if r > v then
				npcHandler:say('Sucesso! Aqui está seu item.', cid)
				doPlayerAddItem(cid,parameters.give,1)
				doSendMagicEffect(getPlayerPosition(cid), math.random(28,30)) 
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('Desculpe, mas seu item falhou na forja!', cid)
				doSendMagicEffect(getPlayerPosition(cid), 2) 
				npcHandler.topic[cid] = 0
			end
			
			npcHandler:resetNpc()
		end
	else
		npcHandler:say('Desculpe, mas apenas forjo esse item para jogadores premium account.', cid)
		npcHandler.topic[cid] = 0
	end
	
	npcHandler:resetNpc()
	return true
end


	local list = {
	{"random elemental bag", items = {{12681,100}}, item_give = 12802, chance = 80, level = 50, premium = false},
	{"upgrade gem", items = {{12681,1000}, {2160, 50}}, item_give = 12803, chance = 40, level = 100, premium = false},
	{"exp potion", items = {{12681,550},{2160,10}}, item_give = 12698, chance = 20, level = 100, premium = false},
	{"stamina refiller", items = {{12681,550},{2160,10}}, item_give = 12849, chance = 30, level = 100, premium = false},
	{"itens", text = "Eu posso forjar: {random elemental bag}, {upgrade gem}, {exp potion} e {stamina refiller}!"}
	}
	
	for i = 1, #list do local get = list[i] if type(get.items) == "table" then
		local node = keywordHandler:addKeyword({get[1]}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Para forjar o item {" .. get[1] .. "} é necessário {"..getItemsFromList(get.items).."}. Você tem tudo isso para me dar? Lembre-se: Possui chances de falhar."})
		node:addChildKeyword({"yes"}, doChangeWeapon, {items = get.items, give = get.item_give, chance = get.chance, level = get.level, premium = get.premium})
		node:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tudo bem então. Quem sabe na próxima rs", reset = true})
	else 
		keywordHandler:addKeyword({get[1]}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = get.text})
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|! Eu forjo materiais usando os {concentrated red crystals} e talvez, outros materiais. Para saber mais, diga {itens}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte logo!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até logo e nunca esqueça, febre da mineração!")
mounts = nil npcHandler:addModule(FocusModule:new())