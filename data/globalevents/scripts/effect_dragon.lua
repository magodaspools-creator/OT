local positions = {
{pos = {x = 3387, y = 752, z = 12}},
{pos = {x = 2058, y = 2045, z = 7}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
                       -- doCreatureSay(pid.pos, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos) -- IN ORANGE
					   -- doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_DARKRED)
					    doSendMagicEffect(pid.pos, CONST_ME_DRAGONHEAD) -- EFEITOS
                    end
                end
            end
   end
 return true
end