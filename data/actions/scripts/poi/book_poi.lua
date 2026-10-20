function onUse(cid, item, frompos, item2, topos)
 
if item.aid == 45170 then
  if getPlayerStorageValue(cid,45170) <= 0 then
        doPlayerSendTextMessage(cid,22,'You have found a book.')
        local book = doPlayerAddItem(cid,1950,1)
        doSetItemText(book,"  Eu descobri um atalho que envolve este teleporte.\nInfelizmente morri antes que pudesse testar.\n\n *Essas alavancas brincam comigo, não aguento mais.*\n\n  A pista está sempre no SaveServer pois as alavancas estão *QUASE* posicionadas correntamente, mas quando alguém utiliza do atalho, elas brincam com você.\n É necessário saber a posição correta das alavancas nesta sala para liberar o teleporte.")
		setPlayerStorageValue(cid, 45170, 1)
	else
        doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return FALSE
end
    return TRUE
end