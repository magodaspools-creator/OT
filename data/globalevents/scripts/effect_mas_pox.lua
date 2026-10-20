local positions = {
{texto = " mas pox " , pos = {x = 355, y = 186, z = 9}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_YELLOW)
						doSendMagicEffect(pid.pos, CONST_ME_GREEN_RINGS) -- EFEITOS
                    end
                end
            end
   end
 return true
end