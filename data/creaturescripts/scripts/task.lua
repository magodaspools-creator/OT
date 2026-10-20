function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	if damage == false or (flags and flags ~= 3) then
		return true
	else
		local f = getCreatureMaster(target)
		if f and f ~= target then
			return true
		end
	end
	
	local name = getCreatureName(target):lower()
	local a = tasks[name]
	if a then
		if getPlayerStorageValue(cid, 14500) ~= a.storage then
			return true
		end

		if getPlayerStorageValue(cid, a.storage) < a.amount then
			local b = getPlayerStorageValue(cid, a.storage) + 1
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Task (".. name:lower() .."): " .. (b == a.amount and "Completed!" or b .." / ".. a.amount))
			setPlayerStorageValue(cid, a.storage, b)
		end
		return true
	end
	return true
end