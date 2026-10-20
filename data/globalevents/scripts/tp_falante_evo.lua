local positions = {
{texto = " NPCS " , pos = {x = 2493, y = 2037, z = 7}},
{texto = "  NPCS " , pos = {x = 2422, y = 2279, z = 7}},
{texto = " TEMPLO " , pos = {x = 2518, y = 2024, z = 7}},
{texto = "  TEMPLO" , pos = {x = 2528, y = 2040, z = 7}},
{texto = " TRAINERS " , pos = {x = 2484, y = 2041, z = 7}},
{texto = " TELEPORT" , pos = {x = 2485, y = 2044, z = 7}},
{texto = "TELEPORT " , pos = {x = 2422, y = 2281, z = 7}},
{texto = "VILA SUL" , pos = {x = 2484, y = 2040, z = 7}},
{texto = "EVOLUTION" , pos = {x = 2422, y = 2279, z = 6}},
{texto = " YUROTS" , pos = {x = 2422, y = 2281, z = 6}},
{texto = " YUROTS " , pos = {x = 2480, y = 1845, z = 5}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
						doSendAnimatedText(pid.pos, pid.texto, TEXTCOLOR_YELLOW)
                    end
                end
            end
   end
 return true
end