local positions = {
{texto = "Cave Exclusiva" , pos = {x = 2040, y = 2041, z = 7}}
}


function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
		if t then
			for _, cid in ipairs(t) do
				if isPlayer(cid) then
					--doCreatureSay(pid.pos, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos) -- IN ORANGE
					 doCreatureSay(cid, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos)
				end
			end
		end
	end
	return true
end