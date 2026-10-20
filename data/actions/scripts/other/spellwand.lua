local config = {
	outfits = {"rat", "green frog", "chicken"}, -- possible outfits
	duration = 45, -- duration of the outfit in seconds
	breakChance = 80, -- a chance of losing the wand (invertido... 80 = 20%)
	MadSheep = 30 -- a chance of summon mad sheep
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(math.random(1, 100) <= config.MadSheep) then
		doSummonCreature("Mad Sheep", toPosition) -- There should be Mad Sheep, but we don't have Mad Sheep :(
		doRemoveItem(item.uid, 1)
		return true
	elseif(math.random(1, 100) >= config.breakChance) then
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your SpellWand is Broke.")
		return true
	end

	if(isPlayer(itemEx.uid)) then
		doSetMonsterOutfit(itemEx.uid, config.outfits[math.random(1, table.maxn(config.outfits))], config.duration * 1000)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
	end

	return true
end
