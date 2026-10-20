function onUse(cid, item, frompos, item2, topos)
 
if item.aid == 45219 then
  if getPlayerStorageValue(cid,45219) <= 0 then
        doPlayerSendTextMessage(cid,22,'You have found a book.')
        local book = doPlayerAddItem(cid,1955,1)
        doSetItemText(book,"We failed!!!\n\nWe thought us lucky, that we had not to fight the ruthless seven face to face, but their traps and minions killed nearly all knights of our squad. We made it not even to one of the thrones. I will send the survivors to one of our remaining castles to save the key. I ordered them to let me die here in dishonor, since i failed my order!\n\nTaciror, the last highlord of the nightmare knights.")
		setPlayerStorageValue(cid, 45219, 1)
	else
        doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return FALSE
end
    return TRUE
end