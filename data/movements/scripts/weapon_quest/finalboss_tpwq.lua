local config = {
	pos = {x = 545, y = 2526, z = 10} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12726 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns! Você terminou a Classic Weapon Quest. Escolha o item de acordo com sua vocation. PALADINS podem utilizar a spell 'exevo gran con hur' para conjurar 100 Diamond Arrows, negociar Infernal Bolts e Crystalline Arrows no NPC 'A Sweaty Cyclops' dentro da mineração.")
	end
   return true
end