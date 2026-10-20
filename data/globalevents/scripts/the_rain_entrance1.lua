local positions = {
{pos = {x = 292, y = 112, z = 8}},
{pos = {x = 293, y = 114, z = 8}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendDistanceShoot({x = (pid.pos).x - 2, y = (pid.pos).y - 2, z = (pid.pos).z}, pid.pos, CONST_ANI_ICE) -- efeito chuva
						doSendMagicEffect(pid.pos, CONST_ME_LOSEENERGY) -- efeito chuva caindo chão
                    end
                end
            end
   end
 return true
end