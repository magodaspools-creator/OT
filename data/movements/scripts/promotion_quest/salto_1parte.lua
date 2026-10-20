local pos = {x = 864, y = 2041, z = 13} -- para onde o tp vai levar
local msg = {
"UUHHUUUU COMO UMA FOLHA AO VENTO",
"P*T@ QUE P@R1$",
"OMG OMG OMGGGGG",
"AAAAAAAAAAHHHH",
"NÃO QUERO MORRERRRRRRR"
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	doCreatureSay(cid, msg[math.random(1,#msg)], TALKTYPE_ORANGE_1, false, 0, position)
	doTeleportThing(cid, pos)
	doSendMagicEffect(getCreaturePosition(cid), 10)
   return true
end