local pos1 = {x = 901, y = 2041, z = 13}
local pos2 = {x = 938, y = 2041, z = 13}
local pos3 = {x = 975, y = 2041, z = 13}
local pos4 = {x = 864, y = 2030, z = 13}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if (item.actionid == 45280) then
		doTeleportThing(cid, pos1)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	elseif (item.actionid == 45281) then
		doTeleportThing(cid, pos2)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	elseif (item.actionid == 45282) then
		doTeleportThing(cid, pos3)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	elseif (item.actionid == 45283) then
		doTeleportThing(cid, pos4)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	end
   return true
end