local config = {
	pos = {x = 394, y = 2036, z = 10}, -- para onde o tp vai levar
	stor = 39000
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end

	if getPlayerStorageValue(cid, 45252) <= 0 then
		if getPlayerStorageValue(cid, config.stor) >= 6 then
			setPlayerStorageValue(cid, config.stor, 7)
			setPlayerStorageValue(cid, 45252, 1)
			doPlayerAddOutfit(cid, 288, 0) -- DEMON HUNTER FEMALE
			doPlayerAddOutfit(cid, 289, 0) -- DEMON HUNTER MALE
			doTeleportThing(cid, config.pos)
			doSendMagicEffect(getCreaturePosition(cid), 10)
			doCreatureSay(cid, "FINISH!",TALKTYPE_ORANGE_1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a quest e recebeu Demon Hunter Outfit.")
		else
			doTeleportThing(cid, fromPosition)
			doCreatureSay(cid, "You don't have finished all the bosses!", TALKTYPE_ORANGE_1)
		end
	else
		doTeleportThing(cid, fromPosition)
		doCreatureSay(cid, "You have already completed the quest.", TALKTYPE_ORANGE_1)
	end
   return true
end