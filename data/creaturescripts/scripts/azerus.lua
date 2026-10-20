-- Config #1 By Quas--  
local BlindField = {x=276, y=2002, z=9, stackpos=1}
local topLeft = {x=270, y=2001, z=9}
local buttomRight = {x=287, y=2021, z=9}
local tpin = {{x=279, y=2022, z=8}, {x=278, y=2018, z=9}}
local tpout = {{x=278, y=2020, z=9}, {x=278, y=2023, z=8}}
local glo = {x=278, y=2011, z=9}
local ttime = {10, 30}
local isEvent = 58263;
-- end --
 
local function getCreaturesFromArea(fromPos, toPos,checkFunction)
    local rarr = {};
    checkFunction = checkFunction or function(arg) return true; end;
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(checkFunction(tmp))then
                    table.insert(rarr, tmp);
                end
            end
        end
    end
    local tmp = getTopCreature(BlindField).uid;
    if(checkFunction(tmp))then
        table.insert(rarr, tmp);
    end
    return rarr;
end
 
local function fixGlobe()
    doItemSetAttribute(getTileItemById(glo, 9767).uid, "aid", 58261)
end
 
function endAzerusFightC()
    local monsters = getCreaturesFromArea(topLeft,buttomRight,isMonster);
    while(#monsters > 0)do
        for _,m in pairs(monsters)do
            doRemoveCreature(m);
        end
        monsters = getCreaturesFromArea(topLeft,buttomRight,isMonster);
    end
   
    doCreateTeleport(1387, tpin[2],tpin[1]);
    doCreateTeleport(1387, tpout[2],tpout[1]);
    addEvent(fixGlobe,60*12*1000);
end

function onDeath(cid, corpse, deathList)
    doSetStorage(isEvent,0);
    addEvent(endAzerusFightC,200*1000);
    doCreatureSay(cid, "You now have 1 minute to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear.", TALKTYPE_ORANGE_1);
    return true;
end