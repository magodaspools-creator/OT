dofile("./_woe.lua")

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
	if (item.actionid == 45449) then
		Woe.getInfo()
		if getPlayerGuildId(cid) ~= 0 then
			if Woe.isRegistered(cid) then
				if infoLua[2] == getPlayerGuildId(cid) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[War Castle] Boa Hunt ".. getCreatureName(cid) ..".")
					return true
				else
					doTeleportThing(cid, fromPosition, true)
					doPlayerSendCancel(cid, "Você não é membro da guild: ".. Woe.guildName() ..".")
					return true
				end
			else
				doTeleportThing(cid, fromPosition, true)
				doPlayerSendCancel(cid, "[War Castle] Você precisa estar registrado e fazer parte da guild dominante. Digite: !registrar")
				return true
			end
		else
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, "[War Castle] Você não é membro da guild: ".. Woe.guildName() ..".")
			return true
		end
	end
   return true
end