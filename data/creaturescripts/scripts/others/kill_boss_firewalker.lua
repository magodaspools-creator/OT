local function countTextRed(cid, pos, tempo)
	if tempo > 0 then
		doSendAnimatedText(pos, tempo, TEXTCOLOR_RED)
		doSendMagicEffect(pos, CONST_ME_MAGIC_RED)
		addEvent(countTextRed, 1000, cid, pos, tempo-1)
	else
		doSendMagicEffect(pos, 2)
	end
end

local function countTutorialArrow(cid, pos, tempo)
	if tempo > 0 then
		doSendMagicEffect(pos, CONST_ME_TUTORIALARROW)
		addEvent(countTutorialArrow, 10000, cid, pos, tempo-10)
	end
end

function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	local pos_msg = getCreaturePosition(target)
	if getCreatureName(target) == "Pythius The Rotten" and bit.band(flags, 1) == 1 then
		doCreatureSay(cid, "O teleport vai fechar em 30 segundos.", TALKTYPE_ORANGE_1, false, 0, pos_msg)
		countTextRed(cid, pos_msg, 30)
		countTutorialArrow(cid, pos_msg, 30)
	end
	return true
end