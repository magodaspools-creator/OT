function onUse(cid, item, fromPosition, itemEx, toPosition)

	local value = math.random(5792, 5797)
	for i, pid in ipairs(getSpectators(getThingPosition(item.uid), 3, 3)) do
		if(isPlayer(pid)) then
			doCreatureSay(cid, getCreatureName(cid) .. ' rolled a ' .. value - 5791 .. '.', TALKTYPE_MONSTER, false, pid)
			if(fromPosition.x ~= CONTAINER_POSITION) then
				doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
			else
				doSendMagicEffect(getThingPos(cid), CONST_ME_CRAPS)
			end
		end
	end

	doTransformItem(item.uid, value)
	return true
end
