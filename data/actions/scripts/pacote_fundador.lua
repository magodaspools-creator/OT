function onUse(cid, item, itemEx, topos, frompos)

	local player = getThingPos(cid)
	if getPlayerStorageValue(cid, 45486) <= 0 then
		if getPlayerFreeCap(cid) > 96.00 then
			if getPlayerItemCount(cid, 12885) >= 1 then
				if doRemoveItem(item.uid, 1) then
					local bag = doPlayerAddItem(cid, 12883, 1)
					doAddContainerItem(bag, 12808, 1) -- Aura Exclusiva
					doAddContainerItem(bag, 12707, 1) -- Cave Exclusiva
					doAddContainerItem(bag, 12850, 1) -- Full Stamina Refiller
					doAddContainerItem(bag, 12880, 1) -- Silver VIP Days
					doAddContainerItem(bag, 12710, 1) -- Holy Icon (5 charges)
					doAddContainerItem(bag, 12887, 1) -- Founder Ring (60 minutes)
					doAddContainerItem(bag, 12887, 1) -- Founder Ring (60 minutes)
					doAddContainerItem(bag, 12698, 1) -- Exp Potion
					doAddContainerItem(bag, 12698, 1) -- Exp Potion
					doPlayerAddOutfit(cid, 194, 0) -- Founder Outfit
					doPlayerAddPremiumDays(cid, 30) -- 30 dias VIP
					setPlayerStorageValue(cid, 45486, 1)
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você abriu o pacote de fundador! Obrigado por ajudar o nosso servidor.")
					doSendDistanceShoot({x=(player.x)-1, y=player.y, z=player.z}, {x=player.x, y=(player.y)-1, z=player.z}, CONST_ANI_REDSTAR)
					doSendDistanceShoot({x=player.x, y=(player.y)-1, z=player.z}, {x=(player.x)+1, y=player.y, z=player.z}, CONST_ANI_REDSTAR)
					doSendDistanceShoot({x=(player.x)+1, y=player.y, z=player.z}, {x=player.x, y=(player.y)+1, z=player.z}, CONST_ANI_REDSTAR)
					doSendDistanceShoot({x=player.x, y=(player.y)+1, z=player.z}, {x=(player.x)-1, y=player.y, z=player.z}, CONST_ANI_REDSTAR)
					doSendMagicEffect(player, CONST_ME_FIREWORK_YELLOW)
				else
					return doPlayerSendCancel(cid, "ERROR! Contact the administrator.")
				end
			else
				return doPlayerSendCancel(cid, "Você precisa ter o item em sua 'BP'.")
			end
		else
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '96.00 oz' para usar esse item.")
		end
	else
		return doPlayerSendCancel(cid, "Você já usou o Pacote de Fundador nesse personagem.")
	end
   return true
end