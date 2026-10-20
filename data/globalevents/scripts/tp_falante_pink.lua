local positions = {
{texto = "Trainers " , pos = {x = 1563, y = 2067, z = 6}},
{texto = "Trainer 1" , pos = {x = 1486, y = 2227, z = 6}},
{texto = "Trainer 2" , pos = {x = 1493, y = 2164, z = 6}},
{texto = " SALA 1 " , pos = {x = 469, y = 108, z = 9}},
{texto = " SALA 2 " , pos = {x = 474, y = 108, z = 9}},
{texto = " SALA 3 " , pos = {x = 479, y = 108, z = 9}},
{texto = " SALA 4 " , pos = {x = 482, y = 108, z = 9}},
{texto = " SALA 5 " , pos = {x = 469, y = 111, z = 9}},
{texto = " SALA 6 " , pos = {x = 474, y = 111, z = 9}},
{texto = " SALA 7 " , pos = {x = 479, y = 111, z = 9}},
{texto = " SALA 8 " , pos = {x = 482, y = 111, z = 9}},
{texto = "++ TPS ++" , pos = {x = 233, y = 262, z = 9}},
{texto = "+ TPS +" , pos = {x = 2556, y = 1986, z = 8}},
{texto = "Roshamuul" , pos = {x = 2040, y = 2042, z = 7}},
{texto = "Yalahar " , pos = {x = 2040, y = 2040, z = 7}},
{texto = "Evolution" , pos = {x = 2041, y = 2039, z = 7}}
}

local colors = {
TEXTCOLOR_RED,
TEXTCOLOR_BLUE,
TEXTCOLOR_PINK,
TEXTCOLOR_GREEN,
TEXTCOLOR_ORANGE
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
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_PINK)
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end