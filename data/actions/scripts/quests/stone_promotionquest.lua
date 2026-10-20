function onUse(cid, item, frompos, item2, topos)

local pospedra = {x = 894, y = 2010, z = 13, stackpos = 1}
local new_alavanca = item.itemid == 1945 and 1946 or 1945
local pedra = getTileItemById(pospedra, 1354).uid

	if (item.itemid  == 1946) then
		doPlayerSendTextMessage(cid, 27, "Você fechou a passagem.")
		doTransformItem(item.uid, new_alavanca)
		if pedra < 1 then
			doCreateItem(1354, 1, pospedra)
		end
	elseif (item.itemid  == 1945) then
		doPlayerSendTextMessage(cid, 27, "Você abriu a passagem.")
		doTransformItem(item.uid, new_alavanca)
		if pedra > 0 then
			doRemoveItem(pedra, 1)
		end
	end
    return true
end