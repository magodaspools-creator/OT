local use_pick_stone = {
    {x = 481, y = 2040, z = 8},
    {x = 482, y = 2040, z = 8},
    {x = 483, y = 2040, z = 8},
    {x = 484, y = 2040, z = 8},
    {x = 485, y = 2040, z = 8},
    {x = 486, y = 2040, z = 8},
    {x = 487, y = 2040, z = 8},
    {x = 488, y = 2040, z = 8},
    {x = 489, y = 2040, z = 8},
    {x = 490, y = 2040, z = 8},
    {x = 491, y = 2040, z = 8},
    {x = 492, y = 2040, z = 8},
    {x = 493, y = 2040, z = 8}
}

function onUse(cid, item, frompos, itemEx, topos)
	
	if(itemEx.aid == 45256 and itemEx.itemid == 1945) then
        for i = 1, #use_pick_stone do
            --doCreateItem(5815, 1, use_pick_stone[i])
			doTransformItem(getTileItemById(use_pick_stone[i], 1524).uid, 1052)
        end		
        doTransformItem(itemEx.uid, 1946)
		
	elseif(itemEx.aid == 45256 and itemEx.itemid == 1946) then
        for i = 1, #use_pick_stone do
            --doCreateItem(5815, 1, use_pick_stone[i])
			doTransformItem(getTileItemById(use_pick_stone[i], 1052).uid, 1524)
        end		
        doTransformItem(itemEx.uid, 1945)
	
    end
	return true
end