function getScoreArena(value, max, RankName)
	local str = "[".. (RankName == nil and "RANK COOKING POINTS" or ""..RankName.."") .."]\n"
	local query = db.getResult("SELECT `player_id`, `value` FROM `player_storage` WHERE `key` = "..value.." ORDER BY cast(value as SIGNED) DESC;")
	if (query:getID() ~= -1) then 
		k = 1
		repeat
			str = str .. "\n " .. k .. ". "..getPlayerNameByGUID(query:getDataString("player_id")).." - " .. query:getDataInt("value") .. ""
			k = k + 1 
		until k > max or not query:next()
	end 
	return str
end

function onLook(cid, thing, position, lookDistance)
	local stor = 45471
	local max = 5
	local name = "RANK COOKING POINTS - TOP 5"
	if thing.itemid == 12878 then
		if getPlayerStorageValue(cid, 45468) >= os.time() then
			doPlayerSendCancel(cid, "Aguarde ".. convertTime(getPlayerStorageValue(cid, 45468) - os.time()) .." para visualizar o placar novamente.")
			return false
		end

		setPlayerStorageValue(cid, 45468, os.time()+60)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, getScoreArena(stor, max, name))
		return false
	end
	return true
end