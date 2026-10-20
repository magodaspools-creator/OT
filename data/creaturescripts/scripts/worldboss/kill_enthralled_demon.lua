function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	local position = getCreaturePosition(target)
	local ran = math.random (1, 10)
	if getCreatureName(target) == "Enthralled Demon" and bit.band(flags, 1) == 1 then
		if ran <= 5 then
			doCreatureSay(cid, "VOCÊS NÃO SABEM O ERRO QUE COMETERAM!!", TALKTYPE_MONSTER, false, 0, position)
		else
			doCreatureSay(cid, "VOCÊS ESTÃO PERDIDOS!!", TALKTYPE_MONSTER, false, 0, position)
		end
		
		doCreateMonster("Enthralled Demon", position, false, true);
		doCreateMonster("Enthralled Demon", position, false, true);
	end
	return true
end