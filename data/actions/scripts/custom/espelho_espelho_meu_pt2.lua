local config = {
	storage = 45105,
	grito = {x=233, y=220, z=9},
	pos_monstro = {x=233, y=223, z=9},
	name = "Bela",
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, config.storage) == 1 then
		doCreatureSay(cid, "?", TALKTYPE_MONSTER, nil, cid, config.grito)
		doSendMagicEffect({x=231, y=220, z=9}, 11)
		doSendMagicEffect({x=234, y=221, z=9}, 11)
		doSendMagicEffect({x=232, y=222, z=9}, 11)
		doSendMagicEffect({x=231, y=224, z=9}, 11)
		doSendMagicEffect({x=234, y=223, z=9}, 11)
		doSummonCreature(config.name, config.pos_monstro)
		setPlayerStorageValue(cid, config.storage, 2)
	else
		doPlayerSendCancel(cid, "You cannot use this object.")
	end
	return true
end