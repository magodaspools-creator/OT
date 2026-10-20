local config = {
	jamChance = 5
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if(math.random(1, 100) <= config.jamChance) then
		doTransformItem(item.uid, item.itemid + 1)
		doDecayItem(item.uid)
	end
	
	return TOOLS.MACHETE(cid, item, fromPosition, itemEx, toPosition, true)
		or TOOLS.PICK(cid, item, fromPosition, itemEx, toPosition)
		or TOOLS.ROPE(cid, item, fromPosition, itemEx, toPosition)
		or TOOLS.SCYTHE(cid, item, fromPosition, itemEx, toPosition, true)
		or TOOLS.SHOVEL(cid, item, fromPosition, itemEx, toPosition)
		or TOOLS.KNIFE(cid, item, fromPosition, itemEx, toPosition)
end