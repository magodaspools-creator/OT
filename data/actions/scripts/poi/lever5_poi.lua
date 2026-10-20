function onUse(cid, item, frompos, item2, topos)
 
	if item.itemid == 1945 then
		doCreatureSay(cid, "Não precisa fazer isto aqui.", 19)
		doTransformItem(item.uid, item.itemid + 1)
	elseif item.itemid == 1946 then
		doTransformItem(item.uid, item.itemid - 1)
	end
    return true
end