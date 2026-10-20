function onUse(cid, item, frompos, item2, topos)
 
local cfg = {
    pos = {x = 124, y = 2054, z = 13},    --Coordenadas de onde o teleport se encontra/será criado.
    onde = {x = 75, y = 2075, z = 15},  --Para onde o teleport vai levar.
}
    
local new_alavanca = item.itemid == 1945 and 1946 or 1945
local tp = getTileItemById(cfg.pos, 1387).uid

	if tp > 0 then
		doPlayerSendTextMessage(cid, 27, "Você fechou o teleport.")
		doTransformItem(item.uid, new_alavanca)
		doRemoveItem(tp, 1)
	else
		doPlayerSendTextMessage(cid, 27, "Você abriu o teleport.")
		doTransformItem(item.uid, new_alavanca)
		doCreateTeleport(1387, cfg.onde, cfg.pos)
	end
    return true
end