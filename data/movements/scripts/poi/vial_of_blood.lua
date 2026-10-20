function onAddItem(moveitem, tileitem, pos, cid)

     if moveitem.itemid == 2016 and moveitem.type == 2 then
        local thing = getTopCreature({x = 99, y = 2043, z = 9}).uid
        if not isPlayer(thing) then
            return false
        end
     
        doSendMagicEffect(getThingPos(thing), CONST_ME_DRAWBLOOD)
        doTeleportThing(thing, {x = 99, y = 2041, z = 10})
        doSendMagicEffect({x = 99, y = 2041, z = 10}, 17)
        doCreatureSay(thing, "Muahahahaha...", TALKTYPE_ORANGE_1)
    end
    return false
end