local positions = {
{texto = "Trainers" , pos = {x = 2055, y = 2049, z = 7}},
{texto = " Eventos " , pos = {x = 2056, y = 2049, z = 7}},
{texto = "Boss Task" , pos = {x = 2057, y = 2049, z = 7}},
{texto = "  EXIT " , pos = {x = 233, y = 280, z = 10}},
{texto = " Templo " , pos = {x = 1540, y = 2066, z = 9}},
{texto = "  Templo " , pos = {x = 1495, y = 2164, z = 6}}, -- TRAIN VIP area
{texto = "Templo  " , pos = {x = 2034, y = 2014, z = 8}}, -- PVP area DUELO
{texto = "  Templo" , pos = {x = 1488, y = 2227, z = 6}}, -- TRAIN VIP area
{texto = " Templo  " , pos = {x = 301, y = 111, z = 9}}, -- DAILY area
{texto = " BOSS  " , pos = {x = 1563, y = 2069, z = 6}}, -- Boss VIP area
{texto = "Boss Room" , pos = {x = 2040, y = 2044, z = 7}}, -- Invasion area
{texto = "   EXIT" , pos = {x = 164, y = 195, z = 8}}, -- Exit World Boss area
{texto = " Itens" , pos = {x = 3382, y = 754, z = 11}}, -- Exit World Boss area
{texto = "WorldBoss" , pos = {x = 2053, y = 2051, z = 6}}, -- World Boss area
{texto = "DUEL RANK" , pos = {x = 2043, y = 2015, z = 8}},
{texto = "TOPS COOK" , pos = {x = 54, y = 121, z = 11}},
{texto = " LVL 500+" , pos = {x = 2057, y = 2045, z = 6}},
{texto = "Arena PVP" , pos = {x = 2046, y = 2040, z = 7}}
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
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_RED)
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end