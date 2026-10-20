local positions = {
{texto = "  EXIT" , pos= {x = 351, y = 197, z = 9}},
{texto = "EXIT   " , pos = {x = 55, y = 127, z = 10}},
{texto = "GO TRAIN " , pos = {x = 57, y = 126, z = 10}},
{texto = "EXIT " , pos = {x = 232, y = 279, z = 9}},
{texto = " EXIT " , pos = {x = 2554, y = 1991, z = 8}},
{texto = "TEMPLE" , pos = {x = 1954, y = 2000, z = 7}},
{texto = "TASK BOSS" , pos = {x = 233, y = 276, z = 9}},
{texto = " EXIT   " , pos = {x = 238, y = 259, z = 9}}, -- TP area
{texto = "Yurots" , pos = {x = 1563, y = 2071, z = 6}},
{texto = "YUROTS " , pos = {x = 2486, y = 2037, z = 7}},
{texto = "Mining " , pos = {x = 2040, y = 2046, z = 7}},
{texto = "Cave Exc" , pos = {x = 2044, y = 2039, z = 7}}
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
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_ORANGE)
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end