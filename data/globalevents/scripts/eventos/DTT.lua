function onTime()
	if getGlobalStorageValue(722642) - os.time() <= 0 then -- CHECK DTT COM BOMBERMAN (EVITAR BUG)
		setGlobalStorageValue(722643, os.time()+5*60) -- EVITAR BUG COM WarCastle
		dtt.open()
	else
		return false
	end
    return true
end

