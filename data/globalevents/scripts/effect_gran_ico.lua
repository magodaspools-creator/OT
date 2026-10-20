local position = {x = 349, y = 184, z = 9}
local positions = {
{texto = " gran ico " , pos = {x = 351, y = 184, z = 9}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_YELLOW)
						doSendDistanceShoot(position, {x = position.x + 2, y = position.y, z = position.z}, CONST_ANI_WHIRLWINDSWORD)
                    end
                end
            end
   end
 return true
end