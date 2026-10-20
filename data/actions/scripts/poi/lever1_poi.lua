-- >> By SasiR --
-- Stone Item ID.
local stoneItemID = 386

-- Stone Position.
local stonePos = {x = 168, y = 2022, z = 11, stackpos = 1}
-- Config << --

-- Main function.
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == 1945) then
        local stone = getTileItemById(stonePos, stoneItemID)

        -- Avoid removing a non-existent stone.
        if (stone.itemid == stoneItemID) then doRemoveItem(stone.uid) end

        doSendMagicEffect(stonePos, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid + 1)
    elseif (item.itemid == 1946) then
        return true
    end
    return TRUE
end