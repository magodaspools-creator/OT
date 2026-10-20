function onUse(cid, item, fromPosition, itemEx, toPosition)
    for _, v in ipairs({{x=154, y=2027, z=12},{x=151, y=2068, z=12},{x=182, y=2043, z=12},{x=195, y=2039, z=12},{x=155, y=2041, z=13},{x=158, y=2075, z=13},{x=167, y=2073, z=13},{x=182, y=2074, z=13},{x=195, y=2064, z=13},{x=194, y=2046, z=13},{x=151, y=2061, z=14},{x=161, y=2068, z=14},{x=182, y=2063, z=14},{x=199, y=2037, z=14},{x=197, y=2058, z=15}}) do
        if getTileItemById(v, 1946).uid == 0 then
            return doPlayerSendCancel(cid, 'You haven\'t pulled all 15 levers.')
        end
    end
    for _, v in ipairs({{x=159, y=2042, z=12},{x=160, y=2042, z=12}}) do
        if item.itemid == 1945 then
            doSendMagicEffect(v, CONST_ME_EXPLOSIONAREA)
            doRemoveItem(getTileItemById(v, 1304).uid)
		else
			return true
		end
    end
end