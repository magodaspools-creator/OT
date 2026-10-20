-- Config # --
local areafrom = {x = 852, y = 2209, z = 8}
local areato = {x = 859, y = 2302, z = 8}
local nobug = {x = 853, y = 2216, z = 8}
-- END --

local function getCreaturesFromArea(fromPos, toPos,checkFunction)
    local aloka1 = {};
    checkFunction = checkFunction or function(arg) return true; end;
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(checkFunction(tmp))then
                    table.insert(aloka1, tmp);
                end
            end
        end
    end
    local tmp = getTopCreature(nobug).uid;
    if(checkFunction(tmp))then
        table.insert(aloka1, tmp);
    end
    return aloka1;
end

function onUse(cid, item, frompos, item2, topos)
local checkm = getCreaturesFromArea(areafrom, areato, isMonster);

	if (item.aid  == 45398 and item.itemid  == 1945) then
		if #checkm > 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "É necessário elimitar todos os monstros na ponte.")
			return true
		else

			doTransformItem(getTileItemById({x=854,y=2208,z=8}, 1548).uid, 1284)
			doTransformItem(getTileItemById({x=854,y=2207,z=8}, 1548).uid, 1284)

			doTransformItem(getTileItemById({x=855,y=2208,z=8}, 1548).uid, 1284)
			doTransformItem(getTileItemById({x=855,y=2207,z=8}, 1548).uid, 1284)
			
			doTransformItem(getTileItemById({x=856,y=2208,z=8}, 1548).uid, 1284)
			doTransformItem(getTileItemById({x=856,y=2207,z=8}, 1548).uid, 1284)
			
			doTransformItem(getTileItemById({x=857,y=2208,z=8}, 1548).uid, 1284)
			doTransformItem(getTileItemById({x=857,y=2207,z=8}, 1548).uid, 1284)
			
			doTransformItem(getTileItemById({x=858,y=2208,z=8}, 1548).uid, 1284)
			doTransformItem(getTileItemById({x=858,y=2207,z=8}, 1548).uid, 1284)

			doCreateItem(5774, 1, {x=854,y=2208,z=8})
			doCreateItem(5774, 1, {x=854,y=2207,z=8})

			doCreateItem(5773, 1, {x=858,y=2208,z=8})
			doCreateItem(5773, 1, {x=858,y=2207,z=8})
			
			doCreateItem(5771, 1, {x=854,y=2208,z=8})
			doCreateItem(5771, 1, {x=855,y=2208,z=8})
			doCreateItem(5771, 1, {x=856,y=2208,z=8})
			doCreateItem(5771, 1, {x=857,y=2208,z=8})
			doCreateItem(5771, 1, {x=858,y=2208,z=8})

			doSendMagicEffect({x=854,y=2208,z=8}, 67)
			doSendMagicEffect({x=854,y=2207,z=8}, 67)

			doSendMagicEffect({x=858,y=2208,z=8}, 67)
			doSendMagicEffect({x=858,y=2207,z=8}, 67)
			
			doSendMagicEffect({x=855,y=2208,z=8}, 67)
			doSendMagicEffect({x=856,y=2208,z=8}, 67)
			doSendMagicEffect({x=857,y=2208,z=8}, 67)
			
			doTransformItem(item.uid, item.itemid + 1)
		end
	else
		doCreatureSay(cid, "The lever has broken.", 19)
	end
	return true
end