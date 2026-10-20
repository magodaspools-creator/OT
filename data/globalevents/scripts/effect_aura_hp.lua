local positions = {
{texto = "+HP/regen", pos = {x = 373, y = 192, z = 9}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, COLOR_MAYABLUE)
                    end
                end
            end
   end
 return true
end