local positions = {
{texto = "Duelo PVP" , pos = {x = 298, y = 99, z = 8}} -- Duelo PVP area
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_RED)
						doSendMagicEffect(pid.pos, CONST_ME_MORTAREA) -- EFEITOS
                    end
                end
            end
   end
 return true
end