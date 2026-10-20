GuildPointsConfigs =
{
	ExecuteIntervalHours = 24,
	NeedPlayersOnline = 10,
	NeedDiferentIps = 7,
	MinLevel = 100,
	AddPointsForAcc = 10
}

function getGuildPlayersValidAccIDS(GuildID, MinLevel)
	local RanksIDS = {}
	local AccsID = {}
	local ValidAccsID = {}

	Query1 = db.getResult("SELECT `id` FROM `guild_ranks` WHERE guild_id = '".. GuildID .."'")
	if(Query1:getID() == -1) then
		return ValidAccsID
	end

	for i = 1, Query1:getRows() do
		table.insert(RanksIDS, Query1:getDataInt("id"))
		Query1:next()
	end

	Query2 = db.getResult("SELECT `account_id` FROM `players` WHERE `rank_id` IN (".. table.concat(RanksIDS, ', ') ..") AND `level` >= ".. MinLevel .."")
	if(Query2:getID() == -1) then
		return ValidAccsID
	end

	for i = 1, Query2:getRows() do
		local AccID = Query2:getDataInt("account_id")
		if #AccsID > 0 then
			for k = 1, #AccsID do
				if AccID == AccsID[k] then
					AddAccList = false
					break
				end

				AddAccList = true
			end
			
			if AddAccList then
				table.insert(AccsID, AccID)
			end
		else
			table.insert(AccsID, AccID)
		end

		Query2:next()
	end
	
	Query3 = db.getResult("SELECT `id` FROM `accounts` WHERE `guild_points_stats` = 0 AND `id` IN (".. table.concat(AccsID, ', ') ..")")
	if(Query3:getID() == -1) then
		return ValidAccsID
	end
	
	for i = 1, Query3:getRows() do
		local AccID = Query3:getDataInt("id")
		if #ValidAccsID > 0 then
			for k = 1, #ValidAccsID do
				if AccID == ValidAccsID[k] then
					AddAccList = false
					break
				end
				
				AddAccList = true
			end
			
			if AddAccList then
				table.insert(ValidAccsID, AccID)
			end
		else
			table.insert(ValidAccsID, AccID)
		end

		Query3:next()
	end
	return ValidAccsID
end

function onSay(cid, words, param, channel)
if(not checkExhausted(cid, 666, 2)) then
	return true
end
	
	if(getPlayerGuildLevel(cid) == 3) then
		local GuildID = getPlayerGuildId(cid)
		Query = db.getResult("SELECT `last_execute_points` FROM `guilds` WHERE id = '".. GuildID .."'")
		if(Query:getID() == -1) then
			return true
		end

		if Query:getDataInt("last_execute_points") < os.time() then
			local GuildMembers = {}
			local GuildMembersOnline = {}
			local PlayersOnline = getPlayersOnline()
			for i, pid in ipairs(PlayersOnline) do
				if getPlayerGuildId(pid) == GuildID then
					if getPlayerLevel(pid) >= GuildPointsConfigs.MinLevel then
						table.insert(GuildMembersOnline, pid)
					end
				end
			end

			if #GuildMembersOnline >= GuildPointsConfigs.NeedPlayersOnline then
				local IPS = {}
				for i, pid in ipairs(GuildMembersOnline) do
					local PlayerIP = getPlayerIp(pid)
					if #IPS > 0 then
						for k = 1, #IPS do
							if PlayerIP == IPS[k] then
								AddIPList = false
								break
							end
					
							AddIPList = true
						end
						
						if AddIPList then
							table.insert(IPS, PlayerIP)
						end
					else
						table.insert(IPS, PlayerIP)
					end
				end
				
				if #IPS >= GuildPointsConfigs.NeedDiferentIps then
					local ValidAccounts = getGuildPlayersValidAccIDS(GuildID, GuildPointsConfigs.MinLevel)
					db.executeQuery("UPDATE `guilds` SET `last_execute_points` = ".. os.time() +(GuildPointsConfigs.ExecuteIntervalHours * 3600) .." WHERE `guilds`.`id` = ".. GuildID ..";")
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "".. #ValidAccounts .." players receberam guild points.")
					if #ValidAccounts > 0 then
						db.executeQuery("UPDATE `accounts` SET `guild_points` = `guild_points` + " ..GuildPointsConfigs.AddPointsForAcc .. ", `guild_points_stats` = ".. os.time() .." WHERE `id` IN (" .. table.concat(ValidAccounts, ',') ..");")
						for i, pid in ipairs(GuildMembersOnline) do
							local PlayerMSGAccID = getPlayerAccountId(pid)
							for k = 1, #ValidAccounts do
								if PlayerMSGAccID == ValidAccounts[k] then
									doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Você recebeu "..GuildPointsConfigs.AddPointsForAcc .." guild points.")
									break
								end
							end
						end
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas ".. #IPS .." players são válidos, Você precisa de ".. GuildPointsConfigs.NeedDiferentIps .." players com IPs diferentes.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa de ".. GuildPointsConfigs.NeedPlayersOnline .." players online e todos no level mínimo ".. GuildPointsConfigs.MinLevel ..". Atualmente, apenas ".. #GuildMembersOnline .." players online atendem aos requisitos.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O comando só pode ser usado a cada "..GuildPointsConfigs.ExecuteIntervalHours .." hours.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas o lider da guild pode usar esse comando.")
	end
	return true
end