local stor = 10006

function onAdvance(cid, skill, oldLevel, newLevel)

	if getPlayerLevel(cid) >= 50 and getPlayerStorageValue(cid, stor) <= 0 then
		doPlayerSetBalance(cid, getPlayerBalance(cid) + 20000)
		doPlayerSendTextMessage(cid,27,"Parabéns pelo level 50! Foi enviado 20k para o seu banco.")
		setPlayerStorageValue(cid, stor, 1)
		
	elseif getPlayerLevel(cid) >= 100 and getPlayerStorageValue(cid, stor) == 1 then
		doPlayerSetBalance(cid, getPlayerBalance(cid) + 50000)
		doPlayerSendTextMessage(cid,27,"Parabéns pelo level 100! Foi enviado 50k para o seu banco.")
		setPlayerStorageValue(cid, stor, 2)
		
	elseif getPlayerLevel(cid) >= 150 and getPlayerStorageValue(cid, stor) == 2 then
		doPlayerSetBalance(cid, getPlayerBalance(cid) + 100000)
		doPlayerSendTextMessage(cid,27,"Parabéns pelo level 150! Foi enviado 120k para o seu banco.")
		setPlayerStorageValue(cid, stor, 3)
	
	elseif getPlayerLevel(cid) >= 200 and getPlayerStorageValue(cid, stor) == 3 then
		doPlayerSetBalance(cid, getPlayerBalance(cid) + 150000)
		doPlayerSendTextMessage(cid,27,"Parabéns pelo level 150! Foi enviado 120k para o seu banco.")
		setPlayerStorageValue(cid, stor, 4)
	
	elseif getPlayerLevel(cid) >= 250 and getPlayerStorageValue(cid, stor) == 4 then
		doPlayerAddPremiumDays(cid, 2)
		doPlayerSendTextMessage(cid,27,"Parabéns pelo level 250! Você recebeu 2 dias de VIP Account.")
		setPlayerStorageValue(cid, stor, 5)
	
	elseif getPlayerLevel(cid) >= 300 and getPlayerStorageValue(cid, stor) == 5 then
		if doPlayerAddItem(cid, 12854, 25) then
			doPlayerSendTextMessage(cid,27,"OMG!! Você pegou level 300! Você recebeu 25 Rusty Gears.")
			setPlayerStorageValue(cid, stor, 6)
		else
			doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
			return true
		end
	end

return true
end