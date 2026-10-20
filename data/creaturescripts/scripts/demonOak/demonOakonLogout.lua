function onLogout(cid)
	if getPlayerStorageValue(cid, DOAK_STORAGE.ARVORE) > 0 and getPlayerStorageValue(cid, DOAK_STORAGE.FINALIZACAO) < 1 then
		doPlayerSetStorageValue(cid, DOAK_STORAGE.ARVORE, 0)
	end
	return true
end