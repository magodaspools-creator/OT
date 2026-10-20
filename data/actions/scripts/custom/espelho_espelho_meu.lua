local config = {
	storage = 45105,
	grito = {x=233, y=220, z=8},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, config.storage) <= 0 then
		if getPlayerSex(cid) == 0 then -- FEMALE
			doCreatureSay(cid, "Espelho espelho meu, existe alguém mais bela do que eu?!", TALKTYPE_ORANGE_1)
			doCreatureSay(cid, "TEMM EUU MUHAHAHAHAHAHAHAHA", TALKTYPE_MONSTER, nil, cid, config.grito)
			setPlayerStorageValue(cid, config.storage, 1)
		else -- MALE
			doCreatureSay(cid, "Espelho espelho meu, existe alguém mais bonito do que eu?!", TALKTYPE_ORANGE_1)
			doCreatureSay(cid, "TEMM EUU MUHAHAHAHAHAHAHAHA", TALKTYPE_MONSTER, nil, cid, config.grito)
			setPlayerStorageValue(cid, config.storage, 1)
		end
	else
		doPlayerSendCancel(cid, "You cannot use this object.")
	end
	return true
end