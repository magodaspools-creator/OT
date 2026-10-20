local positions = {
{texto = "Bomberman" , pos = {x = 289, y = 103, z = 8}},
{texto = " Zombie " , pos = {x = 284, y = 105, z = 8}},
{texto = "  DTT " , pos = {x = 289, y = 114, z = 8}},
{texto = "SnowBall" , pos = {x = 297, y = 114, z = 8}},
{texto = "BC Event" , pos = {x = 297, y = 103, z = 8}},
{texto = "WarCastle" , pos = {x = 2049, y = 2052, z = 6}},
{texto = " The Rain" , pos = {x = 292, y = 114, z = 8}},
{texto = "CS Battle" , pos = {x = 295, y = 101, z = 8}},
{texto = "TEMPLO" , pos = {x = 3773, y = 2593, z = 7}}
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
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_YELLOW)
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end