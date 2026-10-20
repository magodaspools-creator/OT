function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local rand = math.random(1, 100)
	if rand <= 25 then
		return doCreatureSay(cid, DOAK_SOUNDS[DOAK_PISO][math.random(#DOAK_SOUNDS[DOAK_PISO])], TALKTYPE_MONSTER_YELL, false, cid, DOAK_ROSTO)
	end
end