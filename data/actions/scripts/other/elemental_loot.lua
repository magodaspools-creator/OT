function onUse(cid, item, itemEx, topos, frompos) 

	if (item.itemid == 12801) then 
		doRemoveItem(item.uid)
		local ran = math.random (1, 6)
		if ran == 1 then
			doPlayerAddItem(cid, 12795, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Holy Element.")
		elseif ran == 2 then
			doPlayerAddItem(cid, 12796, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Ice Element.")
		elseif ran == 3 then
			doPlayerAddItem(cid, 12797, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Fire Element.")
		elseif ran == 4 then
			doPlayerAddItem(cid, 12798, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Earth Element.")
		elseif ran == 5 then
			doPlayerAddItem(cid, 12799, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Energy Element.")
		elseif ran == 6 then
			doPlayerAddItem(cid, 12800, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu um Death Element.")
		end
			doTeleportThing(cid, {x = 2052, y = 2051, z = 7})
	end
   return true
end