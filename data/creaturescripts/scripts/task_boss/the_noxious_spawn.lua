function onKill(cid, target)
if isPlayer(target) then
	return true
end

local stg = 14022 -- valor da storage

	if getCreatureName(target) == "The Noxious Spawn" and getPlayerStorageValue(cid, stg + (stg < 14500 and 100 or 0)) == 1 then
		setPlayerStorageValue(cid, stg + (stg < 14500 and 100 or 0), 2)
	end
	return true
end