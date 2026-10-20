function onDeath(cid, corpse, deathList)

	if getPlayerStorageValue(cid, arenaSvar.config.isIN) == 1 then
		I = 0        
		for i = 48300, 48329 do
			if getPlayerStorageValue(cid, i) == 1 then
				I = i
			end
		end
		
		GlobalStor = I - arenaSvar.ArenaAdding[arenaSvar.myArenaLevelIs(cid).LV]
		setGlobalStorageValue(GlobalStor, 0)
		setPlayerStorageValue(cid, arenaSvar.config.isIN, 0)
		
		if isCreature(getPlayerStorageValue(cid, arenaSvar.config.MonStor)) then
			doRemoveCreature(getPlayerStorageValue(cid, arenaSvar.config.MonStor))
		end
	end
	return true
end