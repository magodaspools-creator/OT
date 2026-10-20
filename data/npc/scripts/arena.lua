local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                    npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    elseif msgcontains(msg, 'yes') or msgcontains(msg, 'fight') or msgcontains(msg, 'arena') then
        if getPlayerStorageValue(cid, arenaSvar.config.talkNPC) < 1 then
            if getPlayerStorageValue(cid, arenaSvar.config.myArenaLevel) < 3 then
                local enterArena = arenaSvar.myArenaLevelIs(cid)
                if getPlayerLevel(cid) >= enterArena.RLV then
                    if doPlayerRemoveMoney(cid, enterArena.RC) then
                        setPlayerStorageValue(cid, arenaSvar.config.talkNPC, 1)
                        selfSay("Now you can go to test, ".. enterArena.LN ..".", cid)
						npcHandler.topic[cid] = 0
                    else
                        selfSay("You don\'t have ".. enterArena.RC .." gold, come back when you're ready!", cid)
						npcHandler.topic[cid] = 0
                    end
                else
                    selfSay("You don\'t have ".. enterArena.RLV .." level, come back when you're ready!")
					npcHandler.topic[cid] = 0
                end
            else
                selfSay('You already completed all the arena levels.', cid)
				npcHandler.topic[cid] = 0
            end
        else
            selfSay('You have already paid the price to enter the arena.', cid)
			npcHandler.topic[cid] = 0
        end
        npcHandler:releaseFocus(cid)
    end
    return true
end
 
npcHandler:setMessage(MESSAGE_GREET, 'Hello |PLAYERNAME|, Do you want to make arena?')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())