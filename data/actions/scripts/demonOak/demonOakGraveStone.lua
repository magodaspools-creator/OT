function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not isPlayerPzLocked(cid) then
		covaDemonOak(cid)
	else
		return doPlayerSendCancel(cid, "Você não pode estar com PZ Bloked.")
	end
	return true
end