function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

    if param == "on" then
		if getCreatureStorage(cid, 29999) < 1 then
			doCreatureSetStorage(cid, 29999, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Emote spells: ON")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You emoted spells is already activated.")
		end
    elseif param == "off" then
		if getCreatureStorage(cid, 29999) == 1 then
			doCreatureSetStorage(cid, 29999, 0)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Emote spells: OFF")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You emoted spells is already disabled.")
		end
    end
    return true
end