local config = {
	increasing = {[3216] = 3217},
	decreasing = {[3217] = 3216}
}

local str = 45104 -- Storage q vai receber
local pos = {x = 1954, y = 2000, z = 7}

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
			doSendMagicEffect(pos, CONST_ME_TUTORIALARROW)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Pegue seus itens no DEPOT e em seguida, entre no teleport.")
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
	return TRUE
end