-- Yalahar 10th mission By QuaS~~
-- Config #1 --  
local BlindField = {x=276, y=2002, z=9, stackpos=1}
local topLeft = {x=270, y=2001, z=9}
local buttomRight = {x=287, y=2021, z=9}
local tpin = {{x=279, y=2022, z=8}, {x=278, y=2018, z=9}}
local tpout = {{x=278, y=2020, z=9}, {x=278, y=2023, z=8}}
local glo = {x=278, y=2011, z=9}
local m_posi = {
 {x= glo.x - 4,y=glo.y,z=glo.z},
 {x= glo.x + 4,y=glo.y,z=glo.z},
 {x=glo.x,y=glo.y + 4,z=glo.z},
 {x=glo.x,y=glo.y - 4,z=glo.z},
 {x=glo.x,y=glo.y + 5,z=glo.z},
 {x=glo.x,y=glo.y - 5,z=glo.z}
}
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
 
local function getCreatureFromArea(fromPos, toPos,name)
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(tmp > 0)then
                    if(string.lower(name) == string.lower(getCreatureName(tmp)))then
                        return tmp;
                    end
                end
            end
        end
    end
    local tmp = getTopCreature(BlindField).uid;
    if(tmp > 0)then
        if(string.lower(name) == string.lower(getCreatureName(tmp)))then
            return tmp;
        end
    end
    return 0;
end
 
local function FirstWave(count, spawnazerus)
    if(getStorage(isEvent) < 1)then
        return;
    end
    spawnazerus = spawnazerus or false;
    if(spawnazerus)then
        doCreateMonster("Azerus", m_posi[math.random(1,#m_posi)], false, true);
        for _,pos in pairs(m_posi) do
            doCreateMonster("Rift Worm", pos, false, true);
        end
    else
        for i =1, count do
            doCreateMonster("Rift Worm", m_posi[math.random(1,#m_posi)], false, true);
        end
    end
    --addEvent(FirstWave,math.random(ttime[1],ttime[2])*1000,math.random(1,#m_posi));
end
 
local function SecondWave(count, replaceazerus)
    if(getStorage(isEvent) < 1)then
        return;
    end
    replaceazerus = replaceazerus or false;
    if(replaceazerus)then
        local tmp = getCreatureByName("Azerus");
        if(tmp > 0)then
            doRemoveCreature(tmp);
        end
        doCreateMonster("Azerus1", m_posi[math.random(1,#m_posi)], false, true);
       
        for _,pos in pairs(m_posi) do
            doCreateMonster("Rift Brood", pos, false, true);
        end
    else
        for i =1, count do
            doCreateMonster("Rift Brood", m_posi[math.random(1,#m_posi)], false, true);
        end
    end
    --addEvent(SecondWave,math.random(ttime[1],ttime[2])*1000,math.random(1,#m_posi));
end
 
local function ThirdWave(count, replaceazerus)
    if(getStorage(isEvent) < 1)then
        return;
    end
    replaceazerus = replaceazerus or false;
    if(replaceazerus)then
        local tmp = getCreatureByName("Azerus");
        if(tmp > 0)then
            doRemoveCreature(tmp);
        end
        doCreateMonster("Azerus2", m_posi[math.random(1,#m_posi)], false, true);
        for _,pos in pairs(m_posi) do
            doCreateMonster("Rift Scythe", pos, false, true);
        end
    else
        for i =1, count do
            doCreateMonster("Rift Scythe", m_posi[math.random(1,#m_posi)], false, true);
        end
    end
    --addEvent(ThirdWave,math.random(ttime[1],ttime[2])*1000,math.random(1,#m_posi));
end
 
local function FourthWave(count, replaceazerus)
    if(getStorage(isEvent) < 1)then
        return;
    end
    if(replaceazerus)then
        local tmp = getCreatureByName("Azerus");
        if(tmp > 0)then
            doRemoveCreature(tmp);
        end
        tmp = doCreateMonster("Azerus3", m_posi[math.random(1,#m_posi)], false, true);
        registerCreatureEvent(tmp, "AzerusDeath");
       
        for _,pos in pairs(m_posi) do
            doCreateMonster("War Golem", pos, false, true);
        end
    else
        for i =1, count do
            doCreateMonster("War Golem", m_posi[math.random(1,#m_posi)], false, true);
        end
    end
    --addEvent(FourthWave,math.random(ttime[1],ttime[2])*1000,math.random(1,#m_posi));
end
 
local function fixGlobe()
    doItemSetAttribute(getTileItemById(glo, 9767).uid, "aid", 58261)
end
 
local function checkArea()
    if(getStorage(isEvent) > 0)then
        local players = getCreaturesFromArea(topLeft, buttomRight, isPlayer);
        if(#players < 1)then
            doSetStorage(isEvent,0);
            endAzerusFightA();
            addEvent(fixGlobe, 60*1000);
        else
            addEvent(checkArea, 10*1000);
        end
    end
end
 
function endAzerusFightA()
    local monsters = getCreaturesFromArea(topLeft,buttomRight,isMonster);
    while(#monsters > 0)do
        for _,m in pairs(monsters)do
            doRemoveCreature(m);
        end
        monsters = getCreaturesFromArea(topLeft,buttomRight,isMonster);
    end
    doCreateTeleport(1387, tpin[2],tpin[1]);
    doCreateTeleport(1387, tpout[2],tpout[1]);
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.actionid == 58261 then
        doItemSetAttribute(item.uid, "aid", 58263)
    else
        doCreatureSay(cid, "You have to wait some time before this globe will charge.", TALKTYPE_ORANGE_1)
        return;
    end
 
    local tp = getTileItemById(tpin[1],1387).uid;
    if(tp > 0)then
        doRemoveItem(tp)
    end
    tp = getTileItemById(tpout[1],1387).uid;
    if(tp > 0)then
        doRemoveItem(tp)
    end
   
    doSetStorage(isEvent,1);
    checkArea();
    FirstWave(0,true)
    addEvent(SecondWave, 60*1000,0,true)
    addEvent(ThirdWave, 90*1000,0,true)
    addEvent(FourthWave, 180*1000,0,true)
    return true
end