local config = {
    items = { -- {position = posição_do_item, itemid = id_do_item},
        {position = {x = 2010, y = 2091, z = 8}, itemid = 2455}, -- crossbow
        {position = {x = 2010, y = 2103, z = 8}, itemid = 2376}, -- sword
        {position = {x = 2004, y = 2094, z = 8}, itemid = 2674}, -- red apple
		{position = {x = 2004, y = 2099, z = 8}, itemid = 2175}  -- spellbook
        --etc
    },
    players = {
        {position = {x = 2010, y = 2093, z = 8}, toPos = {x = 2015, y = 2052, z = 8}, vocation = {3, 7}},   --{position = posi?_do_jogador, toPos = posi?_final, vocation = ID_das_voca?s},
        {position = {x = 2010, y = 2101, z = 8}, toPos = {x = 2016, y = 2052, z = 8}, vocation = {4, 8}},
        {position = {x = 2006, y = 2094, z = 8}, toPos = {x = 2017, y = 2052, z = 8}, vocation = {2, 6}},
		{position = {x = 2006, y = 2099, z = 8}, toPos = {x = 2018, y = 2052, z = 8}, vocation = {1, 5}}
        --etc
    }
}
 
function onUse(cid)
    local items, quest_players = {}, {}
    for _, item in pairs(config.items) do
        local position_item = getTileItemById(item.position, item.itemid).uid
        if position_item > 0 then
            table.insert(items, position_item)
        else
            return doPlayerSendCancel(cid, "Certifique-se de que todos os itens estão posicionados corretamente.")
        end
    end
    for _, player in pairs(config.players) do
        local pid = getTopCreature(player.position).uid
        if isPlayer(pid) and isInArray(player.vocation, getPlayerVocation(pid)) then
            table.insert(quest_players, pid)
        else
            return doPlayerSendCancel(cid, "Estão faltando jogadores ou estão em suas posições erradas.")
        end
    end
    for i = 1, #items do
        doRemoveItem(items[i])
    end
    for i = 1, #quest_players do
        doPlayerSendTextMessage(quest_players[i], MESSAGE_INFO_DESCR, "Congratulations!!")
        doTeleportThing(quest_players[i], config.players[i].toPos)
    end
    return true
end
 