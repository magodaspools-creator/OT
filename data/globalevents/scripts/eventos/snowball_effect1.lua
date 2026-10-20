local positions = {
{texto = "[GERADOR] " , pos = {x = 501, y = 201, z = 7}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_YELLOW)
                    end
                end
            end
   end
 return true
end