local m_1 = {x=716, y=155, z=8}
local m_2 = {x=716, y=160, z=8}
local m_3 = {x=719, y=161, z=8}
local m_4 = {x=722, y=157, z=8}

function onUse(cid, item, frompos, itemEx, topos)
	
	local ran_2 = math.random(1, 100)
	local ran_3 = math.random(1, 100)
	local ran_4 = math.random(1, 100)
	if(itemEx.itemid == 12704) then
        if getPlayerStorageValue(cid, 45315) <= 0 then -- QTD = 1
			doCreateMonster("Cave Hydra", m_1, false, true);
		elseif getPlayerStorageValue(cid, 45315) == 1 then -- QTD = 2
			if (ran_2 <= 85) then
				doCreateMonster("Cave Hydra", m_2, false, true);
			end
			doCreateMonster("Cave Hydra", m_1, false, true);
			
		elseif getPlayerStorageValue(cid, 45315) == 2 then -- QTD = 3
			if (ran_2 <= 85) then
				doCreateMonster("Cave Hydra", m_2, false, true);
			end
			if (ran_3 <= 60) then
				doCreateMonster("Cave Hydra", m_3, false, true);
			end
			doCreateMonster("Cave Hydra", m_1, false, true);
			
		elseif getPlayerStorageValue(cid, 45315) == 3 then -- QTD = 4
			if (ran_2 <= 85) then
				doCreateMonster("Cave Hydra", m_2, false, true);
			end
			if (ran_3 <= 60) then
				doCreateMonster("Cave Hydra", m_3, false, true);
			end
			if (ran_4 <= 50) then
				doCreateMonster("Cave Hydra", m_4, false, true);
			end
			doCreateMonster("Cave Hydra", m_1, false, true);
		end
			
        doTransformItem(item.uid, 12705)
		doDecayItem(item.uid)
		
	elseif(itemEx.itemid == 12705) then
        doPlayerSendCancel(cid, "Aguarde 15 segundos para usar novamente.") 
    end
	return true
end