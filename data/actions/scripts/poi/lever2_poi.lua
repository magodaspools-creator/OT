-- >> By SasiR --
-- Stone Item ID.
local ponteID = 1284
-- Stone Position.
local pontePos = {x = 169, y = 2014, z = 11}
-- Config << --

-- Main function.
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local dirt1 = getTileItemById({x = 169, y = 2014, z = 11}, 4808)
	local dirt2 = getTileItemById({x = 169, y = 2014, z = 11}, 4810)
    if (item.itemid == 1945) then
		if dirt1.uid > 0 and dirt2.uid > 0 then
			doRemoveItem(dirt1.uid, 1)
			doRemoveItem(dirt2.uid, 1)
		end
		
		doCreateItem(ponteID, 1, pontePos)
		doSendMagicEffect(pontePos, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid + 1)
		
    elseif (item.itemid == 1946) then
        return true
    end
    return true
end