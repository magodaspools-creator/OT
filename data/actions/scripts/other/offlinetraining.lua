local statue = {
	[1444] = SKILL_SWORD,
	[10349] = SKILL_AXE,
	[8626] = SKILL_CLUB,
	[10353] = SKILL_DISTANCE,
	[8834] = SKILL__MAGLEVEL
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayerPzLocked(cid) then
		return false
	end

	if item.actionid == 1000 then
		doPlayerSetOfflineTrainingSkill(cid, statue[item.itemid])
		doRemoveCreature(cid)
	else
		doPlayerSendCancel(cid, "Sorry, not possible.")
	end

	return true
end
