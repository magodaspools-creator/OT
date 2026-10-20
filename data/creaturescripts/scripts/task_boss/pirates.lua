function onKill(cid, target)
if isPlayer(target) then
	return true
end

local stg = 14025 -- valor da storage

	if getCreatureName(target) == "Lethal Lissy" or getCreatureName(target) == "Ron The Ripper" or getCreatureName(target) == "Deadeye Devious" or getCreatureName(target) == "Brutus Bloodbeard" and getPlayerStorageValue(cid, stg + (stg < 14500 and 100 or 0)) == 1 then
		setPlayerStorageValue(cid, stg + (stg < 14500 and 100 or 0), 2)
	end
	return true
end