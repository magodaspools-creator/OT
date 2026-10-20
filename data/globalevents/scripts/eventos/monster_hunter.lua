-- Monster Hunter Event feito por Killua, tibiaking.com

local monsters = {"Demon", "Hydra", "Hellspawn", "Dragon", "Dragon Lord", "Frost Dragon", "Ancient Scarab", "Giant Spider", "Killer Caiman", "Bog Raider", "Medusa", "Warlock", "Black Knight", "Ghastly Dragon", "Wyrm", "Behemoth", "Sea Serpent", "Fury"} -- Monstros que podem ser sorteados
local premios = {{12686, 1}, {2160, 5}} -- {id do item, quantidade} que o jogador ganha e quantia de gold

function winMonsterEvent()
local max_sto, winner = 0, 0
local monster = getGlobalStorageValue(1919211)
	for _, pid in pairs(getPlayersOnline()) do
		local sto = getPlayerStorageValue(pid, 1814210)
		if sto > max_sto then
			max_sto = sto
			winner = pid
		end
	end
	
	if isPlayer(winner) then
		local artigo = getPlayerSex(winner) == 0 and "A jogadora" or "O jogador"
		doBroadcastMessage("[Monster Hunter Event] ".. artigo .." ".. getCreatureName(winner) .." matou "..getPlayerStorageValue(winner, 1814210).." ".. monster .."'s e venceu o evento. Parabéns!")
		for _, prize in pairs(premios) do
			doPlayerAddItem(winner, prize[1], prize[2])
		end
	else
		doBroadcastMessage("[Monster Hunter Event] O evento terminou e não houve nenhum vencedor.")
	end
	
	setGlobalStorageValue(1919211, 0)
end

function onThink(interval, lastExecution)
local monster_ran = monsters[math.random(1, #monsters)]
local tempo = math.random(5, 10)
	for _, pid in pairs(getPlayersOnline()) do
		doPlayerSetStorageValue(pid, 1814210, 0)
	end

	setGlobalStorageValue(1919211, monster_ran)
	doBroadcastMessage("[Monster Hunter Event] O evento começou e vai durar ".. tempo .." minutos. O monstro sorteado foi > ".. monster_ran .."! < Quem matar mais deles até o tempo acabar, será o vencedor!")
	addEvent(winMonsterEvent, tempo*1000*60) 
	return true
end