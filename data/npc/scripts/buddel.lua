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

	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'vial of mead'}, 2006, 50, 51, 'vial of mead')
shopModule:addBuyableItem({'hydra tongue'}, 7250, 100, 'hydra tongue')
shopModule:addBuyableItem({'bottle of bug milk'}, 9674, 200, 'bottle of bug milk')

shopModule:addSellableItem({'compass'}, 11219, 45, 'compass')

npcHandler:setMessage(MESSAGE_GREET, "Hey pessoa grande. *HICKS*")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Ahh. *HICKS*")
npcHandler:setMessage(MESSAGE_FAREWELL, "Tchau.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Bom, bom, bom! *HICKS*")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())