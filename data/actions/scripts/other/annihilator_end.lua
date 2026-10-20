local pos = {x=2076, y=2117, z=10}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, 42226) == 1 then
		doTeleportThing(cid, pos)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		setPlayerStorageValue(cid, 42226, -1)
	else
		doPlayerSendCancel(cid, "Você não deveria estar dentro da ANIHI!")
		doTeleportThing(cid, {x=2085,y=2113,z=9})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
return TRUE
end
