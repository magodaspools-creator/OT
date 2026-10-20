local m_1 = {x=698, y=94, z=8}
local m_2 = {x=704, y=94, z=8}
local m_3 = {x=697, y=100, z=8}
local m_4 = {x=703, y=101, z=8}

function onUse(cid, item, frompos, itemEx, topos)
	
	local ran_2 = math.random(1, 100)
	local ran_3 = math.random(1, 100)
	local ran_4 = math.random(1, 100)
	if(itemEx.itemid == 12704) then
        if getPlayerStorageValue(cid, 45315) <= 0 then -- QTD = 1
			doCreateMonster("Cave Souleater", m_1, false, true);
		elseif getPlayerStorageValue(cid, 45315) == 1 then -- QTD = 2
			if (ran_2 <= 85) then
				doCreateMonster("Cave Souleater", m_2, false, true);
			end
			doCreateMonster("Cave Souleater", m_1, false, true);
			
		elseif getPlayerStorageValue(cid, 45315) == 2 then -- QTD = 3
			if (ran_2 <= 85) then
				doCreateMonster("Cave Souleater", m_2, false, true);
			end
			if (ran_3 <= 60) then
				doCreateMonster("Cave Souleater", m_3, false, true);
			end
			doCreateMonster("Cave Souleater", m_1, false, true);
			
		elseif getPlayerStorageValue(cid, 45315) == 3 then -- QTD = 4
			if (ran_2 <= 85) then
				doCreateMonster("Cave Souleater", m_2, false, true);
			end
			if (ran_3 <= 60) then
				doCreateMonster("Cave Souleater", m_3, false, true);
			end
			if (ran_4 <= 50) then
				doCreateMonster("Cave Souleater", m_4, false, true);
			end
			doCreateMonster("Cave Souleater", m_1, false, true);
		end
			
        doTransformItem(item.uid, 12705)
		doDecayItem(item.uid)
		
	elseif(itemEx.itemid == 12705) then
        doPlayerSendCancel(cid, "Aguarde 15 segundos para usar novamente.") 
    end
	return true
end