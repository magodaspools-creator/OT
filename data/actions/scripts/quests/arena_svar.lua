function onUse(cid, item, fromPosition, itemEx, toPosition)

    local myMove = arenaSvar.getDirectionMove(cid, fromPosition)
    if myMove == nil then
        return false
    end
 
    local Reward = arenaSvar.Rewards[item.actionid]
    if Reward then
        if getPlayerStorageValue(cid, Reward.Stor) ~= 1 then
            local reward = nil
            if Reward.Cont ~= nil then 
                reward = doCreateItemEx(Reward.Cont, 1) 
                for i = 1, #Reward.items do 
                    doAddContainerItem(reward, Reward.items[i], Reward.count[i]) 
                end 
            else
                reward = doCreateItemEx(Reward.item, 1)
            end
            if reward ~= nil then
                if doPlayerAddItemEx(cid, reward, false) == RETURNVALUE_NOERROR then
                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,'You have found a '..getItemNameById(getThing(reward).itemid)..'.')
                    setPlayerStorageValue(cid, Reward.Stor, 1) 
                else
                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, arenaSvar.Cancel[3])
                end
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, arenaSvar.Cancel[4])
        end
	end
	return true
end