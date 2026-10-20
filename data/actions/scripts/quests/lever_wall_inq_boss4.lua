local use_pick_stone = {
    {x = 496, y = 2051, z = 8},
    {x = 496, y = 2050, z = 8},
    {x = 496, y = 2049, z = 8},
    {x = 496, y = 2048, z = 8},
    {x = 496, y = 2047, z = 8},
    {x = 496, y = 2046, z = 8},
    {x = 496, y = 2045, z = 8},
    {x = 496, y = 2044, z = 8},
    {x = 496, y = 2043, z = 8}
}

function onUse(cid, item, frompos, itemEx, topos)
	
	if(itemEx.aid == 45257 and itemEx.itemid == 1945) then
        for i = 1, #use_pick_stone do
            --doCreateItem(5815, 1, use_pick_stone[i])
			doTransformItem(getTileItemById(use_pick_stone[i], 1526).uid, 1056)
        end		
        doTransformItem(itemEx.uid, 1946)
		
	elseif(itemEx.aid == 45257 and itemEx.itemid == 1946) then
        for i = 1, #use_pick_stone do
            --doCreateItem(5815, 1, use_pick_stone[i])
			doTransformItem(getTileItemById(use_pick_stone[i], 1056).uid, 1526)
        end		
        doTransformItem(itemEx.uid, 1945)
	
    end
	return true
end