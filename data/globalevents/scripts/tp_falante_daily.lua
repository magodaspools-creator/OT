local positions = {
{texto = " CHANCE " , pos= {x = 239, y = 116, z = 9}},
{texto = " ~ 50% ~ " , pos = {x = 242, y = 116, z = 9}},
{texto = " ~ 40% ~ " , pos = {x = 241, y = 116, z = 9}},
{texto = " ~ 100% ~ " , pos = {x = 240, y = 116, z = 9}},
{texto = " ~ 20% ~ " , pos = {x = 238, y = 116, z = 9}},
{texto = " ~ 15% ~ " , pos = {x = 237, y = 116, z = 9}},
{texto = " ~ 10% ~ " , pos = {x = 236, y = 116, z = 9}}
}

local colors = {
TEXTCOLOR_RED,
TEXTCOLOR_BLUE,
TEXTCOLOR_PINK,
TEXTCOLOR_GREEN,
TEXTCOLOR_ORANGE,
TEXTCOLOR_YELLOW
}

local effects = {
CONST_ME_FIREWORK_YELLOW,
CONST_ME_FIREWORK_RED,
CONST_ME_FIREWORK_BLUE
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
                       -- doCreatureSay(pid.pos, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos) -- IN ORANGE
						doSendAnimatedText(pid.pos, pid.texto, colors[math.random(1, #colors)])
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end