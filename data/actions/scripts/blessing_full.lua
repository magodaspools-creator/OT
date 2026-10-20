function onUse(cid, item, fromPosition, itemEx, toPosition)
--if (not getTilePzInfo(getCreaturePosition(cid))) then 
--   return doPlayerSendCancel(cid, "Você precisa estar em Protect Zone para utilizar o item.") 
--end
	
	if item.itemid == 12710 then
		if (not getPlayerBlessing(cid,1)) then
			if doTransformItem(item.uid, 12711) then
				for b=1, 5 do
					doPlayerAddBlessing(cid, b)
				end
				doPlayerSendTextMessage(cid, 27, "Você recebeu 'All Blessings'.")
				doSendMagicEffect(fromPosition, 49)
			else
				doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
			end
		else
			doPlayerSendTextMessage(cid,25,"Você já possui bless.")
		end
		
	elseif item.itemid == 12711 then
		if (not getPlayerBlessing(cid,1)) then
			if doTransformItem(item.uid, 12712) then
				for b=1, 5 do
					doPlayerAddBlessing(cid, b)
				end
				
				doPlayerSendTextMessage(cid, 27, "Você recebeu 'All Blessings'.")
				doSendMagicEffect(fromPosition, 49)
			else
				doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
			end
		else
			doPlayerSendTextMessage(cid,25,"Você já possui bless.")
		end
		
	elseif item.itemid == 12712 then
		if (not getPlayerBlessing(cid,1)) then
			if doTransformItem(item.uid, 12713) then
				for b=1, 5 do
					doPlayerAddBlessing(cid, b)
				end
				
				doPlayerSendTextMessage(cid, 27, "Você recebeu 'All Blessings'.")
				doSendMagicEffect(fromPosition, 49)
			else
				doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
			end
		else
			doPlayerSendTextMessage(cid,25,"Você já possui bless.")
		end
		
	elseif item.itemid == 12713 then
		if (not getPlayerBlessing(cid,1)) then
			if doTransformItem(item.uid, 12714) then
				for b=1, 5 do
					doPlayerAddBlessing(cid, b)
				end
				
				doPlayerSendTextMessage(cid, 27, "Você recebeu 'All Blessings'.")
				doSendMagicEffect(fromPosition, 49)
			else
				doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
			end
		else
			doPlayerSendTextMessage(cid,25,"Você já possui bless.")
		end
		
	elseif item.itemid == 12714 then
		if (not getPlayerBlessing(cid,1)) then
			if doRemoveItem(item.uid, 1) then
				for b=1, 5 do
					doPlayerAddBlessing(cid, b)
				end
				doPlayerSendTextMessage(cid, 27, "Você recebeu 'All Blessings'.")
				doSendMagicEffect(fromPosition, 49)
			else
				doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
			end
		else
			doPlayerSendTextMessage(cid,25,"Você já possui bless.")
		end
	end
	return true
end