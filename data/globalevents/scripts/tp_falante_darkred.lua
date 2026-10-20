local positions = {
{texto = "Submundo" , pos = {x = 2055, y = 2050, z = 6}},
{texto = "Templo" , pos = {x = 3355, y = 754, z = 11}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
                       -- doCreatureSay(pid.pos, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos) -- IN ORANGE
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_DARKRED)
					    doSendMagicEffect(pid.pos, CONST_ME_BATS) -- EFEITOS
                    end
                end
            end
   end
 return true
end