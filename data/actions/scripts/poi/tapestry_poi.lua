function onUse(cid, item, frompos, item2, topos)
    local stonePos, stonePos1 = { x=47, y=2101, z=14, stackpos=2}, { x=47, y=2102, z=14, stackpos=2}
    local getItem, getItem1 = getThingFromPos(stonePos), getThingFromPos(stonePos1)
    local stoneId = 6434
 
    if getItem.itemid == stoneId then
        doRemoveItem(getItem.uid,1)
        local new = doCreateItem(6434,1,stonePos1)
        doItemSetAttribute(new, "aid", 45214) -- 45214 = ActionID do item
	elseif getItem1.itemid == stoneId then
        doRemoveItem(getItem1.uid,1)
        local new = doCreateItem(6434,1,stonePos)
        doItemSetAttribute(new, "aid", 45214) -- 45214 = ActionID do item
    end
end