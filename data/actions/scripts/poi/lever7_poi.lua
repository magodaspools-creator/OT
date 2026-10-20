-- >> By SasiR --
-- Stone Item ID.
local ponteID = 407
-- Stone Position.
local pontePos1 = {x = 219, y = 1919, z = 15}
local pontePos2 = {x = 220, y = 1919, z = 15}
local pontePos3 = {x = 219, y = 1918, z = 15}
local pontePos4 = {x = 220, y = 1918, z = 15}

local levertwo = {x = 223, y = 1924, z = 15}
-- Config << --

-- Main function.
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == 1945) then
		doCreateItem(ponteID, 1, pontePos1)
		doCreateItem(ponteID, 1, pontePos2)
		doCreateItem(ponteID, 1, pontePos3)
		doCreateItem(ponteID, 1, pontePos4)
		doSendMagicEffect(pontePos1, CONST_ME_POFF)
		doSendMagicEffect(pontePos2, CONST_ME_POFF)
		doSendMagicEffect(pontePos3, CONST_ME_POFF)
		doSendMagicEffect(pontePos4, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid + 1)
		doTransformItem(getTileItemById(levertwo,1945).uid,1946)
		
    elseif (item.itemid == 1946) then
        return true
    end
    return true
end