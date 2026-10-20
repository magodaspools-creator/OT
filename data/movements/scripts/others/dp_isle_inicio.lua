local config = {
	increasing = {[11062] = 11063},
	decreasing = {[11063] = 11062}
}

local str = 45103 -- Storage q vai receber
local pos1 = {x = 1946, y = 1996, z = 7}
local pos2 = {x = 1946, y = 1998, z = 7}
local pos3 = {x = 1954, y = 1996, z = 7}
local pos4 = {x = 1954, y = 1998, z = 7}
local pos5 = {x = 1946, y = 2004, z = 7}
local pos6 = {x = 1948, y = 2004, z = 7}

function onStepIn(cid, item, position, fromPosition, toPosition)
if(not config.increasing[item.itemid]) then
		return false
	end
if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.increasing[item.itemid])
	end

if (not isPlayer(cid)) then
        return false
    end

    if isPlayer(cid) then
		if getPlayerStorageValue(cid, str) <= 0 then
			setPlayerStorageValue(cid, str, 1)
			doSendMagicEffect(pos1, CONST_ME_TUTORIALARROW)
			doSendMagicEffect(pos2, CONST_ME_TUTORIALARROW)
			doSendMagicEffect(pos3, CONST_ME_TUTORIALARROW)
			doSendMagicEffect(pos4, CONST_ME_TUTORIALARROW)
			doSendMagicEffect(pos5, CONST_ME_TUTORIALARROW)
			doSendMagicEffect(pos6, CONST_ME_TUTORIALARROW)
		end
	end
    return TRUE
end

function onStepOut(cid, item, position, fromPosition)
if(not config.decreasing[item.itemid]) then
		return false
	end
if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, config.decreasing[item.itemid])
	end
	return true
end