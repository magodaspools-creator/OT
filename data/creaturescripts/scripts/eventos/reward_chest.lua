function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	if getCreatureName(target) == "Reward Chest" and bit.band(flags, 1) == 1 then
		local ran = math.random(1, 50)
		if ran >= 1 and ran <= 35 then
			local ran2 = math.random(2, 5)
			doPlayerAddItem(cid, 2160, ran2)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu "..ran2.."0k.")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb)
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
		
		elseif ran >= 36 and ran <= 40 then	
			doPlayerAddItem(cid, 12686, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 1 Event Coin.")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb) 
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
			
		elseif ran >= 41 and ran <= 45 then
			doPlayerAddItem(cid, 12854, 2)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 2 Rusty Gears.")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb)
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
			
		elseif ran >= 46 and ran <= 47 then
			doPlayerAddItem(cid, 12714, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 1 Holy Icon (1 charge).")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb)
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
			
		elseif ran == 48 then
			doPlayerAddItem(cid, 12849, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 1 Stamina Refill.")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb) 
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
			
		elseif ran == 49 then		
			doPlayerAddItem(cid, 12804, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 1 Dodge.")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb)
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
			
		elseif ran == 50 then		
			doPlayerAddItem(cid, 12805, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 1 Critical.")
			local rb = getGlobalStorageValue(cid, 30073) - 1
			setGlobalStorageValue(cid, 30073, rb)
			if getGlobalStorageValue(cid, 30073) == 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu o último baú! Todos os baús foram encontrados. Aguarde até o próximo evento de caça ao tesouro.")
			elseif getGlobalStorageValue(cid, 30073) > 0 then
				doBroadcastMessage("[CAÇA AO TESOURO] O jogador ".. getPlayerName(cid) .." abriu um baú! Ainda restam ".. getGlobalStorageValue(cid, 30073) .." baús espalhados pelo mapa.", MESSAGE_STATUS_CONSOLE_BLUE)
			end
		end
	end
	return true
end