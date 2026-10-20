local frases = {
    "Mwahaha!",
    "THE POWER IS MINE!",
    "NO ONE WILL STOP ME NEXT TIME!"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if item.id == 12856 then
		doCreatureSay(cid, frases[math.random(#frases)], TALKTYPE_ORANGE_1, false, 0, fromPosition.x ~= CONTAINER_POSITION and fromPosition or getThingPosition(cid))
		doSendMagicEffect(toPosition, CONST_ME_FIREAREA)
	end
	return true	
end
