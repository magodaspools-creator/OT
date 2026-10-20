local HORN = 2079
local EMPTY_BIRD_CAGE = 2094
local BIRD_CAGE = 2095
local WOODEN_WHISTLE = 5786
local DIDGERIDOO = 3952
local WAR_DRUM = 3953
local CORNUCOPIA = 2369
local PARTY_TRUMPET = 6572
local USED_PARTY_TRUMPET = 6573
local GREEN_NOTES = {2070, 2071, 2072, 2073, 2075, 2076, 2078, 2332, 2364, 2367, 2368, 2370, 2372, 2374, 3951, 3953, 3957, 6123, 9561, 10295}
local YODA_FON = 12683
local frases_yoda = {
    "FON",
    "TRAB",
    "ÉOQ",
	"SEHLOIRO",
	"HHHHIIIIIIIIII",
	"LAGO AQUI, LAGO AI?!",
	"ÉOQ MALUCO",
	"HUUUU EOQ YODAUMM",
	"CIRCO DE SOLED",
	"TRABSON",
	"KAPPA",
	"KEPPO",
	"VEM PRO DUELO",
	"QUE POHA É ESSA CHUPINGOLE",
	"SOLADO MALUCOO",
	"NÃO SABE JOGAR NÃO PICKA",
	"DALE"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local random = math.random(1, 5)
	if(item.itemid == BIRD_CAGE) then
		if(random == 1) then
			doTransformItem(item.uid, EMPTY_BIRD_CAGE)
			doCreatureSay(cid, "OH NO! The bird run away.", TALKTYPE_ORANGE_1)
			return true
		end

		doSendMagicEffect(fromPosition, CONST_ME_SOUND_YELLOW)
	elseif(item.itemid == DIDGERIDOO) then
		if(random == 1) then
			doSendMagicEffect(fromPosition, CONST_ME_SOUND_BLUE)
			return true
		end
	elseif(item.itemid == PARTY_TRUMPET) then
		doTransformItem(item.uid, USED_PARTY_TRUMPET)
		doCreatureSay(cid, "TOOOOOOT!", TALKTYPE_MONSTER)

		doSendMagicEffect(fromPosition, CONST_ME_SOUND_BLUE)
		doDecayItem(item.uid)
	elseif(item.itemid == CORNUCOPIA) then
		for i = 1, 11 do
			doPlayerAddItem(cid, 2681)
		end

		doRemoveItem(item.uid, 1)
		doSendMagicEffect(fromPosition, CONST_ME_SOUND_YELLOW)
	elseif(item.itemid == WOODEN_WHISTLE) then
		if(random == 2) then
			doSendMagicEffect(fromPosition, CONST_ME_SOUND_RED)
			doRemoveItem(item.uid, 1)
			return true
		end

		local position = getPlayerPosition(cid)
		position.x = position.x + 1

		doSendMagicEffect(fromPosition, CONST_ME_SOUND_PURPLE)
		doSummonCreature("Wolf", position)
	else
		local effect = CONST_ME_SOUND_BLUE
		if(item.itemid == HORN) then
			effect = CONST_ME_SOUND_PURPLE
		elseif(item.itemid == WAR_DRUM) then
			effect = CONST_ME_SOUND_RED
		elseif(isInArray(GREEN_NOTES, item.itemid)) then
			effect = CONST_ME_SOUND_GREEN
		elseif(item.itemid == YODA_FON) then
			local b = getPlayerStorageValue(cid, 20035) + 1
			if getPlayerStorageValue(cid, 20035) < 99 then
				setPlayerStorageValue(cid, 20035, b)
			elseif getPlayerStorageValue(cid, 20035) == 99 then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você adquiriu Jester Outfit.")
				doPlayerAddOutfit(cid, 270, 0)
				doPlayerAddOutfit(cid, 273, 0)
				setPlayerStorageValue(cid, 20035, 101)
			end
			
			effect = CONST_ME_SOUND_RED
			--doSendAnimatedText(getPlayerPosition(cid), frases_yoda[math.random(#frases_yoda)], COLOR_ORANGE)
			doCreatureSay(cid, frases_yoda[math.random(#frases_yoda)], TALKTYPE_ORANGE_1)
			if math.random(1,10) <= 4 then
				doTransformItem(itemEx.uid, 12684)
				doDecayItem(itemEx.uid)
			end
		end

		doSendMagicEffect(fromPosition, effect)
	end

	return true
end
