local firePos = {x=143, y=2042, z=11}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
local fire = getTileItemById(firePos, 6289)
    if item.itemid == 1945 then
		doRemoveItem(fire.uid)
		doSendMagicEffect(firePos, CONST_ME_POFF)
		doCreatureSay(cid, "The fire wall has been removed!", TALKTYPE_ORANGE_1)
    elseif item.itemid == 1946 then
        doPlayerSendCancel(cid, "The fire wall has already removed.")
    return TRUE
    end
end