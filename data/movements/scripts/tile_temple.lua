local config = {
	increasing = {[11062] = 11063},
	decreasing = {[11063] = 11062}
}

local temple = {x=2052, y=2051, z=7}
local tp = {
[1] = {x= temple.x - 1,y=temple.y - 1,z=temple.z},
[2] = {x= temple.x - 1,y=temple.y,z=temple.z},
[3] = {x=temple.x - 1,y=temple.y + 1,z=temple.z},
[4] ={x=temple.x,y=temple.y + 1,z=temple.z},
[5] ={x=temple.x + 1,y=temple.y + 1,z=temple.z},
[6] ={x=temple.x + 1,y=temple.y,z=temple.z}
}

local function countPlayers(fromPosition, toPosition)
    local count = 0
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getCreaturePosition(pid), fromPosition, toPosition) then
            count = (count + 1)
        end
    end
    return count
end

function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return false
end

	local area = countPlayers({x = 2052, y = 2051, z = 7}, {x = 2052, y = 2051, z = 7})
	
	if area >= 10 then
		local position = tp[math.random(1,6)]
		doTeleportThing(cid, position)
	end

	if(not config.increasing[item.itemid]) then
		return false
	else
		doTransformItem(item.uid, config.increasing[item.itemid])
	end
	return true
end


function onStepOut(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if(not config.decreasing[item.itemid]) then
		return false
	else
		doTransformItem(item.uid, config.decreasing[item.itemid])
	end

	return true
end