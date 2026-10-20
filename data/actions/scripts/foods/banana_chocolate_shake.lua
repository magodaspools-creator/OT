function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 45822) - os.time() > 0 then
	return doPlayerSendCancel(cid, "Aguarde ".. convertTime(getPlayerStorageValue(cid, 45822) - os.time()) .." para comer um special food novamente.")
end

		doRemoveItem(item.uid, 1)
		doCreatureSay(cid, "You don't really know what this did to you, but suddenly you feel very happy.", TALKTYPE_MONSTER)
		doSendMagicEffect(getThingPos(cid), CONST_ME_HEARTS)
		setPlayerStorageValue(cid, 45822, os.time()+5*60)
	return true
end
