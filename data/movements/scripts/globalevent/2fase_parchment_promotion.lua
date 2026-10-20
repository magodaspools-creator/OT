local positions = {
    { x = 850, y = 1937, z = 12 }, -- Demon Position
    { x = 854, y = 1933, z = 12 }, -- Demon Position
    { x = 858, y = 1937, z = 12 }, -- Demon Position
    { x = 852, y = 1936, z = 12 } -- Parchement Position
}

function onRemoveItem(moveitem, tileitem, pos)
    if comparePositions(pos, positions[4]) == true then
        if getGlobalStorageValue(30000) ~= 1 then
            for i = 1, 3 do
                doCreateMonster("Demonlord", positions[i], false, true);
            end
            
            setGlobalStorageValue(30000, 1)
        end
    end
    return true
end