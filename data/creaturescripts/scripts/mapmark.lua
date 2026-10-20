local config = {
    storage = 45370,
    version = 1, -- Increase this value after adding new marks, so player can step again and receive new map marks
    marks = {
        {mark = 5, pos = {x = 2052, y = 2051, z = 7}, desc = "Temple"},
        {mark = 13, pos = {x = 2019, y = 2053, z = 7}, desc = "Depot + Bank + Stores"},
        {mark = 11, pos = {x = 2030, y = 2046, z = 7}, desc = "Tools"},
		{mark = 11, pos = {x = 2018, y = 2045, z = 7}, desc = "Foods"},
		{mark = 11, pos = {x = 2065, y = 2045, z = 7}, desc = "Furnitunes"},
		{mark = 11, pos = {x = 2073, y = 2042, z = 7}, desc = "Rings + Amulets"},
		{mark = 11, pos = {x = 2073, y = 2029, z = 7}, desc = "Jewels"},
		{mark = 18, pos = {x = 2084, y = 2071, z = 7}, desc = "NPC Yasir"},
		{mark = 3, pos = {x = 2064, y = 2060, z = 7}, desc = "NPC Addon"},
		{mark = 6, pos = {x = 2052, y = 2060, z = 7}, desc = "NPC Task"},
		{mark = 9, pos = {x = 1942, y = 2037, z = 7}, desc = "NPC Travel"},
		{mark = 5, pos = {x = 1566, y = 2068, z = 6}, desc = "Temple VIP"},
		{mark = 13, pos = {x = 1565, y = 2054, z = 6}, desc = "Bank + Tools"},
		{mark = 10, pos = {x = 1553, y = 2052, z = 6}, desc = "Depot"},
		{mark = 11, pos = {x = 1539, y = 2050, z = 6}, desc = "Stores"},
		{mark = 11, pos = {x = 1534, y = 2077, z = 6}, desc = "Paladin Store"},
		{mark = 11, pos = {x = 1509, y = 2071, z = 6}, desc = "Jewels"},
		{mark = 19, pos = {x = 1571, y = 2078, z = 6}, desc = "NPC Yasir"}
    }
}

local f_addMark = doPlayerAddMapMark
if(not f_addMark) then f_addMark = doAddMapMark end

function onLogin(cid)
	
	if(getPlayerStorageValue(cid, config.storage) ~= config.version) then
		for _, m in pairs(config.marks) do
			f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
		end
	
		setPlayerStorageValue(cid, config.storage, config.version)
	end
    return true
end