local positions = {
{pos = {x = 501, y = 201, z = 7}},
{pos = {x = 3382, y = 754, z = 11}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendMagicEffect(pid.pos, CONST_ME_TUTORIALARROW) -- EFEITO
                    end
                end
            end
   end
 return true
end