function onUse(cid, item, frompos, item2, topos)

local wall1 = {x=109, y=2045, z=11, stackpos=1}
local splash = {x=108, y=2048, z=11, stackpos=1}
local oil = getThingfromPos(splash)
local lever = getThingfromPos(splash)
local bplayer = {x=109, y=2045, z=11, stackpos=253}
local bplayer2 = getThingfromPos(bplayer)
 
	if item.aid == 45119 and item.itemid == 1945 and oil.itemid == 2016 and oil.type == 11 then
		doCreateItem(5770,1,wall1)
		doTransformItem(item.uid,item.itemid+1)
		doSendMagicEffect(splash,13)
	elseif item.aid == 45119 and item.itemid == 1946 and oil.itemid == 2016 and oil.type == 11 then
		doCreatureSay(cid, "The lever has broken.", 19)
	else
		doCreatureSay(cid, "The lever is creaking and rusty.", 19)
	end
    return true
end