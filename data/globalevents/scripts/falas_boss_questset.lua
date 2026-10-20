local ran = {
    [1] = "SOCORR ",
    [2] = " MATE-O  ",
	[3] = "ME AJUDE PF ",
	[4] = "NÃO ME DEIXE ",
	[5] = "AAAAHHHH ",
	[6] = "VAI SANGRAR ",
	[7] = "CORRAA  ",
	[8] = " SE F@D4U ",
	[9] = "NNNOOOO  "
}

local positions = {
{texto = ran[math.random(9)], pos= {x = 1009, y = 2466, z = 9}},
{texto = ran[math.random(9)], pos = {x = 1007, y = 2471, z = 9}},
{texto = ran[math.random(9)], pos = {x = 1008, y = 2478, z = 9}},
{texto = ran[math.random(9)], pos = {x = 1010, y = 2485, z = 9}},
{texto = ran[math.random(9)], pos = {x = 1026, y = 2482, z = 9}},
{texto = ran[math.random(9)], pos = {x = 1026, y = 2472, z = 9}}
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
		if t then
			for _, cid in ipairs(t) do
				if isPlayer(cid) then
					doCreatureSay(cid, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos)
				end
			end
		end
   end
 return true
end