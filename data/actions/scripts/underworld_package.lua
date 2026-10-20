local reward = {
	[0] = {id = 12850, amount = 1, chance = 4}, -- Full Stamina Refiller
	[1] = {id = 12849, amount = 1, chance = 8}, -- Stamina Refiller
	[2] = {id = 2160, amount = 50, chance = 10}, -- Gold Coin
	[3] = {id = 12698, amount = 1, chance = 20}, -- Exp Potion
	[4] = {id = 12854, amount = 14, chance = 30}, -- Rusty Gear
	[5] = {id = 12686, amount = 2, chance = 40}, -- Event Coin
	[6] = {id = 12854, amount = 12, chance = 50}, -- Rusty Gear
	[7] = {id = 12854, amount = 10, chance = 60}, -- Rusty Gear
	[8] = {id = 12854, amount = 8, chance = 70}, -- Rusty Gear
	[9] = {id = 12854, amount = 7, chance = 80}, -- Rusty Gear
	[10] = {id = 12854, amount = 6, chance = 85}, -- Rusty Gear
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 12855 then
		local rand = math.random(1,100)
		for i = 0, #reward do
			if (reward[i].chance > rand) then
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
				doTransformItem(item.uid, reward[i].id, reward[i].amount)
				return doSendAnimatedText(getCreaturePosition(cid), "Opened!", TEXTCOLOR_LIGHTGREEN)
			end
		end
		
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return doSendAnimatedText(getCreaturePosition(cid), "Failed!", TEXTCOLOR_RED)
	end
    return true
end