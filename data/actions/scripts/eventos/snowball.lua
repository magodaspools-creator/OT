function onUse(cid, item, frompos, item2, topos)
	if item.actionid == 45391 then
		if(SBW_AMMOINFI) then
			doPlayerSendTextMessage(cid, 27, "[SnowBall WAR] Bolas de neve infinitas! Não precisa comprar.")
		else
			if (getPlayerStorageValue(cid, SBW_SCORE) > 0) and (getPlayerStorageValue(cid, SBW_AMMO) < 30) then
				doPlayerSetStorageValue(cid, SBW_SCORE, getPlayerStorageValue(cid, SBW_SCORE)-1)
				doPlayerSetStorageValue(cid, SBW_AMMO, getPlayerStorageValue(cid, SBW_AMMO)+SBW_AMMOBUY)
				doPlayerSendTextMessage(cid, 27, "[SnowBall WAR] Você trocou " .. SBW_AMMOBUY .. "x bolas de neve por 1 ponto de jogo.")
				doSendMagicEffect(getCreaturePosition(cid),4)
			else
				doPlayerSendTextMessage(cid, 27, "[SnowBall WAR] Você não possui pontos de jogo suficiente ou já está carregando muitas bolas de neve.")                      
			end
		end
	end
end