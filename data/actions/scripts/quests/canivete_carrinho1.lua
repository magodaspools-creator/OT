-- Config # --
local areafrom = {x = 375, y = 2291, z = 9} -- ENTRADA from
local areato = {x = 401, y = 2310, z = 9} -- ENTRADA to
local newpos = {x = 325, y = 2267, z = 9} -- POSIÇÃO PARA ONDE O JOGADOR VAI
local nobug = {x = 399, y = 2302, z = 9} -- POSIÇÃO PARA ONDE O JOGADOR VAI
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
		doPlayerSendTextMessage(cid, 27, "Elimite todos os monstros na sala e der USE no carrinho para avançar.")
	end
	return true
end