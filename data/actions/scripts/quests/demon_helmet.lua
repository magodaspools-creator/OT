function onUse(cid, item, frompos, item2, topos)
 
local cfg = {
    pos = {x = 2242, y = 2096, z = 13},    --Coordenadas de onde o teleport se encontra/será criado.
    onde = {x = 2249, y = 2098, z = 12},  --Para onde o teleport vai levar.
	pospedra = {x = 2241, y = 2098, z = 13, stackpos = 1},  --Coordenadas da pedra.
}
    
local new_alavanca = item.itemid == 1945 and 1946 or 1945
local tp = getTileItemById(cfg.pos, 1387).uid
local pedra = getTileItemById(cfg.pospedra, 1355).uid

	if tp > 0 then
		doPlayerSendTextMessage(cid, 27, "Você fechou o teleport.")
		doTransformItem(item.uid, new_alavanca)
		doRemoveItem(tp, 1)
		if pedra < 1 then
			doCreateItem(1355, 1, cfg.pospedra)
		end
	else
		doPlayerSendTextMessage(cid, 27, "Você abriu o teleport.")
		doTransformItem(item.uid, new_alavanca)
		doCreateTeleport(1387, cfg.onde, cfg.pos)
		if pedra > 0 then
			doRemoveItem(pedra, 1)
		end
	end
    return true
end