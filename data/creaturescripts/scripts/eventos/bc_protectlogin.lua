function onLogin(cid)
	local temple = {x = 2052, y = 2051, z = 7}
	if getPlayerStorageValue(cid, 45403) == 1 then
		setPlayerStorageValue(cid, 45403, 0)
		doTeleportThing(cid, temple)
		doPlayerSendTextMessage(cid, 27, "[Blood Castle] Você não pode logar dentro do Blood Castle. Você foi teleportado para o templo.")
	end
	return true
end

function onDeath(cid, corpse)
	if getPlayerStorageValue(cid, 45403) == 1 then
		setPlayerStorageValue(cid, 45403, 0)
	end
	return true
end