function onLogin(cid)
    if getPlayerGroupId(cid) < 3 then
        local hasReceivedFirstItems = getPlayerStorageValue(cid, 10001)
 
        if hasReceivedFirstItems == -1 then
			
			if getPlayerVocation(cid) == 1 then -- sorc
				doPlayerAddItem(cid, 8820, 1, true, 1, CONST_SLOT_HEAD) -- mage hat
				doPlayerAddItem(cid, 8819, 1, true, 1, CONST_SLOT_ARMOR) -- magician robe
				doPlayerAddItem(cid, 2647, 1, true, 1, CONST_SLOT_LEGS) -- plate legs
				doPlayerAddItem(cid, 2643, 1, true, 1, CONST_SLOT_FEET) -- leather boots
				doPlayerAddItem(cid, 2175, 1, true, 1, CONST_SLOT_RIGHT) -- spellbook
				doPlayerAddItem(cid, 2190, 1, true, 1, CONST_SLOT_LEFT) -- wand
			
			elseif getPlayerVocation(cid) == 2 then -- druid
				doPlayerAddItem(cid, 8820, 1, true, 1, CONST_SLOT_HEAD) -- mage hat
				doPlayerAddItem(cid, 8819, 1, true, 1, CONST_SLOT_ARMOR) -- magician robe
				doPlayerAddItem(cid, 2647, 1, true, 1, CONST_SLOT_LEGS) -- plate legs
				doPlayerAddItem(cid, 2643, 1, true, 1, CONST_SLOT_FEET) -- leather boots
				doPlayerAddItem(cid, 2175, 1, true, 1, CONST_SLOT_RIGHT) -- spellbook
				doPlayerAddItem(cid, 2182, 1, true, 1, CONST_SLOT_LEFT) -- rod
			
			elseif getPlayerVocation(cid) == 3 then -- paladin
				doPlayerAddItem(cid, 2457, 1, true, 1, CONST_SLOT_HEAD) -- steel helmet
				doPlayerAddItem(cid, 2660, 1, true, 1, CONST_SLOT_ARMOR) -- ranger cloak
				doPlayerAddItem(cid, 2507, 1, true, 1, CONST_SLOT_LEGS) -- ranger legs
				doPlayerAddItem(cid, 2643, 1, true, 1, CONST_SLOT_FEET) -- leather boots
				doPlayerAddItem(cid, 2525, 1, true, 1, CONST_SLOT_RIGHT) -- dwarven shield
				doPlayerAddItem(cid, 2389, 1, true, 1, CONST_SLOT_LEFT) -- spear
				
			elseif getPlayerVocation(cid) == 4 then -- knight
				doPlayerAddItem(cid, 2457, 1, true, 1, CONST_SLOT_HEAD) -- steel helmet
				doPlayerAddItem(cid, 2463, 1, true, 1, CONST_SLOT_ARMOR) -- plate armor
				doPlayerAddItem(cid, 2647, 1, true, 1, CONST_SLOT_LEGS) -- plate legs
				doPlayerAddItem(cid, 2643, 1, true, 1, CONST_SLOT_FEET) -- leather boots
				doPlayerAddItem(cid, 2525, 1, true, 1, CONST_SLOT_RIGHT) -- dwarven shield
			end
			
			 -- letter
            local c = {
                text = "- Bem Vindo ".. getPlayerName(cid) .."!\n\n> Todo dinheiro dropado dos monstros vai automaticamente para o banco.\n\n-> Sorcerers, Druids, Knights e Paladins, recebem armas ao upar, até o level 30. Queremos melhorar ao máximo sua aventura.\n\n-> Para comprar bless ou aol, digite o comando: [!bless] ou [!aol].\n\n->Temos CTRL + ARROWS no cast.\n\n->Nosso servidor é totalmente FREE. Basta se dedicar e jogar para conquistar tudo dentro do jogo.\n\nBoa sorte e um otimo jogo!",
                writer = "Admin",
                date = os.time()
            }
			--/letter
            local item = doCreateItemEx(2598, 1)
            doSetItemText(item, c.text, c.writer, c.date)
            doPlayerAddItemEx(cid, item, true)
            --/fim letter
			
            if doPlayerAddItem(cid, 2000, 1) then
				if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 then -- sorc e druid
					doPlayerAddItem(cid, 2120, 1) -- rope
					doPlayerAddItem(cid, 2789, 5) -- brown mushrooms
					doPlayerAddItem(cid, 7620, 5) -- mana potion
					doPlayerAddItem(cid, 7618, 5) -- health potion
			
				elseif getPlayerVocation(cid) == 3 then -- paladin
					doPlayerAddItem(cid, 2120, 1) -- rope
					doPlayerAddItem(cid, 2789, 5) -- brown mushrooms
					doPlayerAddItem(cid, 7620, 5) -- mana potion
					doPlayerAddItem(cid, 7618, 5) -- health potion
					doPlayerAddItem(cid, 2456, 1) -- bow
					doPlayerAddItem(cid, 2544, 40) -- arrows
				
				elseif getPlayerVocation(cid) == 4 then -- knight
					doPlayerAddItem(cid, 2120, 1) -- rope
					doPlayerAddItem(cid, 2789, 5) -- brown mushrooms
					doPlayerAddItem(cid, 7620, 5) -- mana potion
					doPlayerAddItem(cid, 7618, 5) -- health potion
					doPlayerAddItem(cid, 2439, 1) -- daramian mace
					doPlayerAddItem(cid, 8602, 1) -- jagged sword
					doPlayerAddItem(cid, 8601, 1) -- steel axe
				end
			end
 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have recieved your first equipment.")
            setPlayerStorageValue(cid, 10001, 1)  
        end
    end
    return true
end