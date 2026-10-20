local frases = {
    "Chaavess?!",
    "Chaves?",
    "Chavinho?",
	"Chavinhoo?!"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if item.aid == 45465 then
		doCreatureSay(cid, frases[math.random(#frases)], TALKTYPE_ORANGE_1, nil, cid, getCreaturePosition(cid))
	end
	return true	
end
