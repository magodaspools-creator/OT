local positions = {
{texto = "Teleports " , pos = {x = 1563, y = 2068, z = 6}},
{texto = "..:VIP:.." , pos = {x = 2059, y = 2046, z = 7}},
{texto = " Teleports" , pos = {x = 2048, y = 2049, z = 7}},
{texto = " Quests " , pos = {x = 2047, y = 2049, z = 7}},
{texto = " Daily " , pos = {x = 2046, y = 2049, z = 7}}
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
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_LIGHTGREEN)
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end