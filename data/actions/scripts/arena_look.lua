function onLook(cid, thing, position, lookDistance)
	if item.actionid == 45468 then
		doItemSetAttribute(item.uid, "description", "TESTE")
	end
	return true
end