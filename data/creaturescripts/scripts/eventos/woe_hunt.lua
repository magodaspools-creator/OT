function onLogin(cid)
	local temple_cave_exc = {x = 2052, y = 2051, z = 7}
	if getPlayerStorageValue(cid, 45450) == 1 then
		setPlayerStorageValue(cid, 45450, 0)
		doTeleportThing(cid, temple_cave_exc)
		doPlayerSendTextMessage(cid, 27, "[War Castle] Você não pode logar dentro das hunts. Você foi teleportado para o templo.")
	end
	return true
end

function onDeath(cid, corpse)
	if getPlayerStorageValue(cid, 45450) == 1 then
		setPlayerStorageValue(cid, 45450, 0)
	end
	return true
end