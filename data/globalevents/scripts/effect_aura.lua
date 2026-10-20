local positions = {
{texto = " AURA " , pos = {x = 372, y = 194, z = 9}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_DARKPINK)
						doSendMagicEffect(pid.pos, CONST_ME_HEARTS) -- EFEITOS
                    end
                end
            end
   end
 return true
end