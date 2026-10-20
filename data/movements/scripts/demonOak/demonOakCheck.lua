function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	local oak_monsters = removeMonsterDemonOak(DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2], isMonster);
    while(#oak_monsters > 0) do
		for _,oak_m in pairs(oak_monsters) do
			doRemoveCreature(oak_m);
		end
		
		oak_monsters = removeMonsterDemonOak(DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2], isMonster);
    end
	
	if item.uid == 45299 and getPlayerStorageValue(cid, 45299) <= 0 then
		setPlayerStorageValue(cid, 45299, 1)
	else
		return false
	end
	return true
end