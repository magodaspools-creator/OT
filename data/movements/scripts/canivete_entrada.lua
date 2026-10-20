function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if (item.aid == 45350) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Para avançar de sala, der USE no carrinho. É necessário limpar os monstros da sala.")
	end
   return true
end