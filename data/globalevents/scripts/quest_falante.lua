local positions = {
{texto = " 100k " , pos = {x = 329, y = 189, z = 9}},
{texto = "Annihi" , pos = {x = 335, y = 187, z = 9}},
{texto = "  POI  " , pos = {x = 341, y = 184, z = 9}},
{texto = "  INQ  " , pos = {x = 353, y = 183, z = 8}},
{texto = "Yalahari" , pos = {x = 371, y = 200, z = 9}},
{texto = " WOTE " , pos = {x = 320, y = 200, z = 9}},
{texto = " ARENA " , pos = {x = 365, y = 186, z = 9}},
{texto = "Promotion" , pos = {x = 353, y = 184, z = 9}},
{texto = "FW Boots" , pos = {x = 347, y = 189, z = 9}},
{texto = "DL Quest" , pos = {x = 359, y = 189, z = 9}},
{texto = "Demon Oak" , pos = {x = 367, y = 186, z = 8}},
{texto = "QuestArma" , pos = {x = 328, y = 212, z = 10}},
{texto = "Canivete " , pos = {x = 323, y = 194, z = 9}},
{texto = " Shields " , pos = {x = 362, y = 212, z = 10}},
{texto = " Secret  " , pos = {x = 361, y = 211, z = 10}},
{texto = "RingQuest" , pos = {x = 346, y = 210, z = 9}},
{texto = "ClassicWQ" , pos = {x = 371, y = 213, z = 10}},
{texto = "Classic " , pos = {x = 366, y = 215, z = 10}},
{texto = "DH Quest" , pos = {x = 333, y = 188, z = 9}},
{texto = "Helm+Bots" , pos = {x = 367, y = 215, z = 10}}
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
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_DARKPINK)
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end