-- Config # --
local areafrom = {x = 316, y = 2261, z = 9} -- ENTRADA from
local areato = {x = 360, y = 2309, z = 9} -- ENTRADA to
local newpos = {x = 276, y = 2277, z = 9} -- POSIÇÃO PARA ONDE O JOGADOR VAI
local nobug = {x = 357, y = 2273, z = 9} -- POSIÇÃO PARA ONDE O JOGADOR VAI
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
	
	if #checkm > 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "É necessário elimitar todos os monstros na sala.")
		return true
	else
		doTeleportThing(cid, newpos)
		doSendMagicEffect(getCreaturePosition(cid), 12)
		doPlayerSendTextMessage(cid, 27, "Avance e pegue sua recompensa.")
	end
	return true
end