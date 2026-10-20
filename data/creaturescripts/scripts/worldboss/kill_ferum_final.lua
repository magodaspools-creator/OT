function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end
	
	local position = getCreaturePosition(target)
	if getCreatureName(target) == "Corrupted Ascending Ferumbras" then
		setPlayerStorageValue(cid, 45462, os.time()+10*60)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[World Boss] Você derrotou o Ascending Ferumbras. Corra até o NPC para receber seu prêmio.")
		
		if bit.band(flags, 1) == 1 then
			doCreateNpc("Rise Of Underworld", {x=159,y=198,z=8});
			doCreatureSay(cid, "YOUR PUNY HUMANS!", TALKTYPE_ORANGE_1, false, 0, position)
			doBroadcastMessage("[World Boss] Ascending Ferumbras foi derrotado! Todos que participaram da batalha tem 10 minutos para falar com o NPC dentro da sala World Boss para receber sua recompensa.")
			addEvent(doBroadcastMessage, 6*1000, "[World Boss] O jogador que deu o último dano: ".. getPlayerName(cid) ..". Parabéns a todos!")
			setPlayerStorageValue(cid, 45461, os.time()+10*60)
		end
	end
    return true
end