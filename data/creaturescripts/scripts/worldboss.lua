function onLogin(cid)
	local temple_cave_exc = {x = 2052, y = 2051, z = 7}
	if getPlayerStorageValue(cid, 45459) == 1 then
		setPlayerStorageValue(cid, 45459, 0)
		doTeleportThing(cid, temple_cave_exc)
		doPlayerSendTextMessage(cid, 27, "[World Boss] Você não pode logar na sala do World Boss. Você foi teleportado para o templo.")
	end
	return true
end

function onDeath(cid, corpse)
	if getPlayerStorageValue(cid, 45459) == 1 then
		setPlayerStorageValue(cid, 45459, 0)
	end
	return true
end