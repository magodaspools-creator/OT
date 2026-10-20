local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

function onThink(interval, lastExecution)
_Lib_Battle_Days = {
	["Monday"] = {
	["18:00"] = {players = 20}},
	
	["Tuesday"] = {
	["18:00"] = {players = 20}},
	
	["Wednesday"] = {
	["18:00"] = {players = 20}},

	["Thursday"] = {
	["18:00"] = {players = 20}},
	
	["Friday"] = {
	["18:00"] = {players = 20}},
	
	["Saturday"] = {
	["18:00"] = {players = 20}},
	
	["Sunday"] = {
	["18:00"] = {players = 20}}
}

	if _Lib_Battle_Days[os.date("%A")] then
		hours = tostring(os.date("%X")):sub(1, 5)
		tb = _Lib_Battle_Days[os.date("%A")][hours]
		if tb and (tb.players % 2 == 0) then
			local players_tp = getPlayersInArea({x=295,y=101,z=8}, {x=295,y=101,z=8})
			if players_tp then
				for _, v in next, players_tp do
					doTeleportThing(v, getTownTemplePosition(1))
					doPlayerSendTextMessage(v, MESSAGE_STATUS_CONSOLE_BLUE, "Não pode ficar no local onde o TP abriu. Você foi teleportado para o templo.")
				end
			end
			
			local tp = doCreateItem(1387, 1, _Lib_Battle_Info.tpPos)		
			doItemSetAttribute(tp, "aid", 45442)
			CheckEvent(_Lib_Battle_Info.limit_Time)
			doBroadcastMessage("[CS Battle Event] O teleport para o evento foi aberto! Vão ser "..tb.players.." jogadores divididos entre: "..((tb.players)/2).." VS "..((tb.players)/2))
			return setGlobalStorageValue(_Lib_Battle_Info.storage_count, tb.players)
		end
	end
	return true
end