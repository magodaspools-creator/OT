local config = {
        timeToRemove = 60, -- seconds
        message = "You now have 1 minute to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear.",
        teleportId = 9740,
        bosses = { -- Monster Name,  Teleport Position
                ["Ushuriel"] = {  pos={ x=452, y=1939, z=8, stackpos=1 }, aid=39001},
                ["Zugurosh"] = {  pos={ x=568, y=1888, z=8, stackpos=1 }, aid=39002},
                ["Madareth"] = {  pos={ x=587, y=1940, z=8, stackpos=1 }, aid=39003},
                ["Annihilon"] = {  pos={ x=701, y=2091, z=8, stackpos=1 }, aid=39005},
                ["Hellgorak"] = {  pos={ x=695, y=1996, z=8, stackpos=1 }, aid=39006}
                },
        brothers ={
        ["Golgordan"] = {pos={ x=487, y=2053, z=8, stackpos=1 },aid=39004, brother = "Latrivan"},
        ["Latrivan"] = {pos={ x=487, y=2053, z=8, stackpos=1 },aid=39004, brother = "Golgordan"},
        brothersArea = {
                fromPos = {x = 479, y = 2041, z = 8},
                toPos = {x = 495, y = 2053, z = 8}  }   }
}

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

local function removal(position)
    doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
    return TRUE
end
 
function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

    if(config.bosses[getCreatureName(target)]) and bit.band(flags, 1) == 1 then
        local t = config.bosses[getCreatureName(target)]
        local teleport = doCreateItem(config.teleportId, t.pos)
        local position = t.pos
		local pos_msg = getCreaturePosition(target)
        doItemSetAttribute(teleport, "aid", t.aid)
		doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1, false, 0, pos_msg)
        addEvent(removal, config.timeToRemove * 1000, position)
		countTextRed(cid, position, 60)
		countTutorialArrow(cid, position, 60)
		
    elseif(config.brothers[getCreatureName(target)]) and bit.band(flags, 1) == 1 then
        local t = config.brothers[getCreatureName(target)]
        local brother = getCreatureByName(t.brother)
        if(isMonster(brother) == true) then
            if(isInRange(getCreaturePosition(brother), config.brothers.brothersArea.fromPos, config.brothers.brothersArea.toPos) == true) then
                return TRUE
            end
        else
            local teleport = doCreateItem(config.teleportId, t.pos)
            local position = t.pos
			local pos_msg = getCreaturePosition(target)
            doItemSetAttribute(teleport, "aid", t.aid)
			doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1, false, 0, pos_msg)
            addEvent(removal, config.timeToRemove * 1000, position)
			countTextRed(cid, position, 60)
			countTutorialArrow(cid, position, 60)
        end
    end
    return TRUE
end