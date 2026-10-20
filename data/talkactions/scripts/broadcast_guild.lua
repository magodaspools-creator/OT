function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

	local playerGuild = getPlayerGuildId(cid)
	if getPlayerMoney(cid) >= 100000 then
		if doPlayerRemoveMoney(cid, 100000) then
			if playerGuild > 0 then
				local playerGuildLevel = getPlayerGuildLevel(cid)
				if playerGuildLevel >= GUILDLEVEL_VICE then
					local message = "*Guild - ".. getPlayerGuildName(cid) .."* " .. getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]: " .. param;
					for _, pid in ipairs(getPlayersOnline()) do
						doPlayerSendChannelMessage(pid, cid, message, TALKTYPE_CHANNEL_MANAGEMENT, 0)
					end
					doPlayerSendCancel(cid, "Mensagem Enviada ao GUILD CHANNEL de todas as guilds!");
				else
					doPlayerSendCancel(cid, "Você tem que ser pelo menos Vice-Líder para guildcast!");
				end
			else
				doPlayerSendCancel(cid, "Desculpe, você não está em uma guilda.");
			end
		else
			doPlayerSendCancel(cid, "ERROR! Please contact the administrator.");
		end
	else
		doPlayerSendCancel(cid, "O custo para usar esse comando é de 100k.");
	end
	return true
end
