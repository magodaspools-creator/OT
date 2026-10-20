dofile("./_woe.lua")

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if item.actionid == Castle.tiles then
		Woe.getInfo()
		if isPlayer(cid) then
			if Woe.isTime() then
				if getPlayerGuildId(cid) ~= 0 then
					if Woe.isRegistered(cid) then
						if Woe.isStarted() then
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[War Castle] Boa Sorte ".. getCreatureName(cid) ..".")
						else
							Woe.moveBack(cid, fromPosition, "[War Castle] O evento ainda não começou.")
						end
					else
						Woe.moveBack(cid, fromPosition, "[War Castle] Você não está registrado. Digite: !registrar")
					end			
				else
					Woe.moveBack(cid, fromPosition, "[War Castle] Apenas jogadores com guildas podem entrar.")
				end
			elseif getPlayerGuildId(cid) == infoLua[2] then
				if Woe.isRegistered(cid) then
					if Woe.isStarted() then
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[War Castle] Bem Vindo ".. getCreatureName(cid) ..".")
					else
						Woe.moveBack(cid, fromPosition, "[War Castle] O evento ainda não começou.")
					end
				else
					Woe.moveBack(cid, fromPosition, "[War Castle] Você não está registrado. Digite: !registrar")
				end			
			else
				Woe.moveBack(cid, fromPosition, "[War Castle] O Evento não começou.")
			end
		end
--	elseif item.actionid == Castle.portals then
--		doTeleportThing(cid, Castle.PreToPos[math.random(1, 2)], false)
	elseif item.actionid == Castle.bases then
		if isPlayer(cid) then
			Woe.moveBack(cid, fromPosition, "you cant step there.")
		end
	end
	return true
end

function onAddItem(moveitem, tileitem, position)
	doRemoveItem(moveitem.uid, moveitem.type > 0 and moveitem.type or 1)
	return true
end