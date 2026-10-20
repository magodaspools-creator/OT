function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sobreviva por 5 minutos e você será teleportado para sala de recompensas. SIMPLES ASSIM rs")
	return true
end