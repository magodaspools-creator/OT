local pos_certa = {x = 159, y = 1993, z = 9} -- Quando as alavancas estiverem na posição correta

local alavancas = {
	[1] = {x = 161, y = 2031, z = 11},
	[2] = {x = 160, y = 2032, z = 11},
	[3] = {x = 159, y = 2033, z = 11},
	[4] = {x = 163, y = 2031, z = 11},
	[5] = {x = 164, y = 2032, z = 11},
	[6] = {x = 165, y = 2033, z = 11},
	[7] = {x = 159, y = 2037, z = 11},
	[8] = {x = 160, y = 2038, z = 11},
	[9] = {x = 160, y = 2039, z = 11},
	[10] = {x = 165, y = 2037, z = 11},
	[11] = {x = 164, y = 2038, z = 11},
	[12] = {x = 164, y = 2039, z = 11}
}

local levers = { -- Estado inicial
	[1] = "e",
	[2] = "e",
	[3] = "e",
	[4] = "e",
	[5] = "e",
	[6] = "e",
	[7] = "e",
	[8] = "e",
	[9] = "e",
	[10] = "e",
	[11] = "e",
	[12] = "e"
}

local aux = {"e", "d"}

function onStepIn(cid)
	if (not isPlayer(cid)) then
        return false
    end
	
	for id, pos in ipairs(alavancas) do
		local itemid = levers[id] == "e" and 1945 or 1946
		if getTileItemById(pos, itemid).uid < 100 then
			return false
		end
	end


	doSendMagicEffect(getThingPos(cid), 10)
	doTeleportThing(cid, pos_certa, true)
	doSendMagicEffect(getThingPos(cid), 10)

	for id, pos in ipairs(alavancas) do
		local itemid = levers[id] == "e" and 1945 or 1946
		local lv = getTileItemById(pos, itemid).uid
		if lv > 100 then
			doTransformItem(lv, math.random(1945, 1946))
		end
	end
	return true
end