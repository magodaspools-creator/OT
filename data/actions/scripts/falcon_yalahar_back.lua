function onUse(cid, item, fromPosition, itemEx, toPosition)

	if not isPlayerPzLocked(cid) then
		doTeleportThing(cid, {x=2547,y=1845,z=5})
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
	else
		doPlayerSendCancel(cid, "Desculpe, você não pode estar com 'PZ Bloked'.")
	end
	return true
end
