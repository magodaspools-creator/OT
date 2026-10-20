function onLogin(cid)
	local temple_cave_exc = {x = 2052, y = 2051, z = 7}
	if getPlayerStorageValue(cid, 45316) == 1 then
		setPlayerStorageValue(cid, 45316, 0)
		doTeleportThing(cid, temple_cave_exc)
		doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você não pode logar na sala da Cave Exclusiva. Você foi teleportado para o templo.")
	end
	return true
end

function onDeath(cid, corpse)
	if getPlayerStorageValue(cid, 45316) == 1 then
		setPlayerStorageValue(cid, 45316, 0)
	end
	return true
end