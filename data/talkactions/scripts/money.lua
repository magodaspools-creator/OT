function onSay(cid, words, param, channel)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have " .. doNumberFormat(getPlayerMoney(cid)) .. " gold.")
	return true
end
