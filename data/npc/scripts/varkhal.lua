local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "enchanted") or msgcontains(msg, "chicken wing") or msgcontains(msg, "enchanted chicken wing") then
		npcHandler:say("Você gostaria de trocar {1 boots of haste} por 1 Enchanted Chicken Wing?", cid)
		npcHandler.topic[cid] = 7
	elseif msgcontains(msg, "magic sulphur") or msgcontains(msg, "sulphur") then
		npcHandler:say("Você gostaria de trocar {3 fire swords} por 1 Magic Sulphur?", cid)
		npcHandler.topic[cid] = 14
	elseif msgcontains(msg, "spool of yarn") or msgcontains(msg, "spool") or msgcontains(msg, "spider silk yarn") then
		npcHandler:say("Você gostaria de trocar {10 Spider Silks} por 1 Spool of Yarn?", cid)
		npcHandler.topic[cid] = 15
	elseif msgcontains(msg, "spirit container") or msgcontains(msg, "fighting spirit") then
		npcHandler:say("Você gostaria de trocar {2 Royal Helmets} por 1 Spirit Container?", cid)
		npcHandler.topic[cid] = 16
	elseif msgcontains(msg, "flask of warrior's sweat") or msgcontains(msg, "flask of warrior") or msgcontains(msg, "flask of warrior sweat") or msgcontains(msg, "flask of warriors sweat") or msgcontains(msg, "warrior sweat") or msgcontains(msg, "warrior's sweat") then
		npcHandler:say("Você gostaria de trocar {4 Warrior Helmets} por 1 Flask of Warrior's Sweat?", cid)
		npcHandler.topic[cid] = 17
	elseif msgcontains(msg, "yoda's fanfare") or msgcontains(msg, "yoda fanfare") or msgcontains(msg, "yoda") or msgcontains(msg, "fanfare") then
		npcHandler:say("Você gostaria de trocar comprar Yoda's Fanfare por {250000gold (250k)}?", cid)
		npcHandler.topic[cid] = 58
	elseif msgcontains(msg, "nightmare") and msgcontains(msg, "shield") then
		if getPlayerStorageValue(cid, 20045) <= 0 and getPlayerStorageValue(cid, 20046) <= 0 then
			npcHandler:say("Primeiro você precisa completar todos os addons da {Nightmare}.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Por {100 Demonic Essence} o Nightmare Shield pode ser seu. Aceita?", cid)
			npcHandler.topic[cid] = 78
		end
	elseif msgcontains(msg, "necromancer") and msgcontains(msg, "shield") then
		if getPlayerStorageValue(cid, 20048) <= 0 and getPlayerStorageValue(cid, 20049) <= 0 then
			npcHandler:say("Primeiro você precisa completar todos os addons da {Nightmare}.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Por {100 Demonic Essence} o Necromancer Shield pode ser seu. Aceita?", cid)
			npcHandler.topic[cid] = 79
		end
	end
	
	if msgcontains(msg, "citizen") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 1	
	elseif npcHandler.topic[cid] == 1 then -- CITIZEN
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {100 Minotaur Leathers}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {100 Chicken Feathers}, {50 Honeycombs} e {1 Legion Helmet}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 3
		end
	end
	
	
	if msgcontains(msg, "hunter") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 4	
	elseif npcHandler.topic[cid] == 4 then -- HUNTER
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {1 Elane's Crossbow}, {100 Lizard Leather}, {100 Red Dragon Leather}, {5 Enchanted Chicken Wings}, {1 Piece of Royal Steel}, {1 Piece of Draconian Steel} e {1 Piece of Hell Steel}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 5
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {1 Sniper Gloves}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 6
		end
	end
	
	if msgcontains(msg, "knight") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 8	
	elseif npcHandler.topic[cid] == 8 then -- KNIGHT
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {100 Iron Ore} e {1 Huge Chunk of Crude Iron}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 9
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {100 Perfect Behemoth Fangs}, {1 Flask of Warrior's Sweat} e {1 Piece of Royal Steel}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 10
		end
	end
	
	if msgcontains(msg, "mage") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 11
	elseif npcHandler.topic[cid] == 11 then -- MAGE
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			if getPlayerSex(cid) == 0 then -- MULHER
				npcHandler:say("É necessário: {1 Winning Lottery Ticket}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 12
			else -- HOMEM
				npcHandler:say("É necessário: {1 Snakebite Rod}, {1 Moonlight Rod}, {1 Necrotic Rod}, {1 Terra Rod}, {1 Hailstorm Rod}, {1 Wand of Vortex}, {1 Wand of Dragonbreath}, {1 Wand of Decay}, {1 Wand of Cosmic Energy}, {1 Wand of Inferno}, {10 Magic Sulphur}, {20 Ankhs} e {1 Soul Stone}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 12
			end
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			if getPlayerSex(cid) == 0 then -- MULHER
				npcHandler:say("É necessário: {70 Bat Wings}, {20 Red Piece of Cloth}, {40 Ape Fur}, {35 Holy Orchids}, {10 Spool of Yarn}, {60 Lizard Scales}, {40 Red Dragon Scales}, {15 Magic Sulphur} e {30 Vampire Dust}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 13
			else -- HOMEM
				npcHandler:say("É necessário: {1 Ferumbras' Hat}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 13
			end
		end
	end
	
	if msgcontains(msg, "barbarian") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 18	
	elseif npcHandler.topic[cid] == 18 then -- BARBARIAN
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {1 Spirit Container}, {1 Flask of Warrior's Sweat}, {50 Red Pieces of Cloth}, {50 Green Pieces of Cloth} e {10 Spool of Yarns}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 19
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {100 Iron Ores}, {1 Huge Chunk of Crude Iron}, {50 Perfect Behemoth Fangs} e {50 Lizard Leathers}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 20
		end
	end
	
	if msgcontains(msg, "druid") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then -- DRUID
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {50 Bear Paws} e {50 Wolf Paws}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 22
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {100 Demon Dusts} e {1 Ceiron's Wolf Tooth Chain}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 23
		end
	end
	
	if msgcontains(msg, "nobleman") or msgcontains(msg, "noblewoman") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 24
	elseif npcHandler.topic[cid] == 24 then -- NOBLEMAN
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {150000golds (150k)}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 25
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {150000golds (150k)}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 26
		end
	end
	
	if msgcontains(msg, "oriental") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 27
	elseif npcHandler.topic[cid] == 27 then -- NOBLEMAN
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {1 Mermaid Comb}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 28
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {100 Ape Fur}, {100 Fish Fins}, {2 Enchanted Chicken Wings} e {100 Blue Piece of Cloth}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 29
		end
	end
		
	if msgcontains(msg, "summoner") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 30
	elseif npcHandler.topic[cid] == 30 then -- SUMMONER
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			if getPlayerSex(cid) == 0 then -- MULHER
				npcHandler:say("É necessário: {1 Snakebite Rod}, {1 Moonlight Rod}, {1 Necrotic Rod}, {1 Terra Rod}, {1 Hailstorm Rod}, {1 Wand of Vortex}, {1 Wand of Dragonbreath}, {1 Wand of Decay}, {1 Wand of Cosmic Energy}, {1 Wand of Inferno}, {10 Magic Sulphur}, {20 Ankhs} e {1 Soul Stone}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 31
			else -- HOMEM
				npcHandler:say("É necessário: {1 Winning Lottery Ticket}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 31
			end
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			if getPlayerSex(cid) == 0 then -- MULHER
				npcHandler:say("É necessário: {1 Ferumbras' Hat}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 32
			else -- HOMEM
				npcHandler:say("É necessário: {70 Bat Wings}, {20 Red Piece of Cloth}, {40 Ape Fur}, {35 Holy Orchids}, {10 Spool of Yarn}, {60 Lizard Scales}, {40 Red Dragon Scales}, {15 Magic Sulphur} e {30 Vampire Dust}. Você quer mesmo fazer esse addon?", cid)
				npcHandler.topic[cid] = 32
			end
		end
	end
	
	if msgcontains(msg, "warrior") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 33
	elseif npcHandler.topic[cid] == 33 then -- WARRIOR
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {100 Hardened Bones}, {100 Turtle Shells}, {1 Spirit Container} e {1 Dragon Claw}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 34
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {100 Iron Ores} e {1 Piece of Royal Steel}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 35
		end
	end
	
	if msgcontains(msg, "wizard") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 36
	elseif npcHandler.topic[cid] == 36 then -- WIZARD
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {1 Medusa Shield}, {1 Dragon Scale Mail}, {1 Crown Legs} e {1 Ring of the Sky}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 37
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {50 Holy Orchids} e {ter completado o first addon (máscara de caveira/tiara de cobra)}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 38
		end
	end
	
	if msgcontains(msg, "demon") or msgcontains(msg, "demonhunter") or msgcontains(msg, "demon hunter") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 39
	elseif npcHandler.topic[cid] == 39 then -- DEMONHUNTER
		if msgcontains(msg, "outfit") then
			npcHandler:say("Você receberá este outfit após finalizar a {'Inquisition Quest'}.", cid)
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {30 Vampire Dust}, {40 Demon Dust}, {50 Demon Horn}, {50 Demonic Essence} e {100 Talon}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 40
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {50 Demon Dust}, {200 Demonic Essence} e {100 Talon}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 41
		end
	end
	
	if msgcontains(msg, "yalahar") or msgcontains(msg, "yalahari") or msgcontains(msg, "yalaharian") then
		npcHandler:say("Você receberá este outfit junto com seus addons após finalizar a {'Yalaharian Quest'}.", cid)
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "wayfarer") or msgcontains(msg, "wayfare") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 42
	elseif npcHandler.topic[cid] == 42 then -- WAYFARER
		if msgcontains(msg, "outfit") then
			npcHandler:say("Você receberá este outfit após finalizar a {'WOTE Quest'}.", cid)
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {100 White Piece of Cloth}, {100 Green Piece of Cloth}, {100 Red Piece of Cloth}, {100 Blue Piece of Cloth}, {100 Brown Piece of Cloth} e {100 Yellow Piece of Cloth}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 43
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {5 Spool of Yarn} e {500 Demonic Essence}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 44
		end
	end
	
	if msgcontains(msg, "warmaster") or msgcontains(msg, "war master") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 45
	elseif npcHandler.topic[cid] == 45 then -- WARMASTER
		if msgcontains(msg, "outfit") then
			npcHandler:say("É necessário: {250000golds (250k)}. Você quer mesmo fazer esse outfit?", cid)
			npcHandler.topic[cid] = 46
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {50 White Piece of Cloth}, {50 Green Piece of Cloth}, {50 Red Piece of Cloth}, {50 Blue Piece of Cloth}, {50 Brown Piece of Cloth}, {50 Yellow Piece of Cloth} e {10 Spool of Yarns}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 47
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {15 Spool of Yarn}, {15 Magic Sulphur} e {1 Spirit Container}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 48
		end
	end
	
	if msgcontains(msg, "assassin") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 49
	elseif npcHandler.topic[cid] == 49 then -- ASSASSIN
		if msgcontains(msg, "outfit") then
			npcHandler:say("É necessário: {30 Bonelord Eyes}, {10 Red Dragon Scales}, {30 Lizard Scales}, {20 Fish Fins}, {20 Vampire Dust}, {10 Demon Dust} e {1 Flask of Warrior's Sweat}. Você quer mesmo fazer esse outfit?", cid)
			npcHandler.topic[cid] = 50
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 51
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {1 Behemoth Claw} e {1 Nose Ring}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 52
		end
	end
	
	if msgcontains(msg, "beggar") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 53
	elseif npcHandler.topic[cid] == 53 then -- BEGGAR
		if msgcontains(msg, "outfit") then
			npcHandler:say("É necessário: {50 Minotaur Leathers}, {30 Heaven Blossoms}, {20 Brown Pieces of Cloth} e {10 Bat Wings}. Você quer mesmo fazer esse outfit?", cid)
			npcHandler.topic[cid] = 54
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {100 Ape Fur} e {20000gold (20k)}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 55
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {1 Simon The Beggar's Favorite Staff}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 56
		end
	end
	
	if msgcontains(msg, "jester") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 57
	elseif npcHandler.topic[cid] == 57 then -- JESTER
		if msgcontains(msg, "outfit") then
			npcHandler:say("Você precisa usar {Yoda's Fanfare} umas 100x para adquirir Jester Outfit. Eu posso te vender o {Yoda's Fanfare} por {250000golds (250k)}. Você quer?", cid)
			npcHandler.topic[cid] = 58
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {10 Blue Pieces of Cloth}, {10 Brown Pieces of Cloth}, {10 Yellow Pieces of Cloth} e {10 White Pieces of Cloth}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 59
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {10 Green Pieces of Cloth}, {10 Red Pieces of Cloth} e {10 Blue Pieces of Cloth}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 60
		end
	end
	
	if msgcontains(msg, "shaman") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 61
	elseif npcHandler.topic[cid] == 61 then -- SHAMAN
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {5 Banana Staffs} e {5 Tribal Masks}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 62
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {5 Pirate Voodoo Doll}, {5 Voodoo Doll} e {1 Mandrake}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 63
		end
	end
	
	if msgcontains(msg, "norseman") or msgcontains(msg, "norsewoman") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 64
	elseif npcHandler.topic[cid] == 64 then -- NORSEMAN
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {5 Shards}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 65
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {10 Shards}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 66
		end
	end
	
	if msgcontains(msg, "pirate") then
		npcHandler:say("Você gostaria de fazer {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 67
	elseif npcHandler.topic[cid] == 67 then -- PIRATE
		if msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {100 Eye Patches}, {100 Peg Legs} e {100 Hooks}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 68
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {1 Ron the Ripper's Sabre}, {1 Deadeye Devious' Eye Patch}, {1 Lethal Lissy's Shirt} e {1 Brutus Bloodbeard's Hat}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 69
		end
	end
	
	if msgcontains(msg, "nightmare") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 70
	elseif npcHandler.topic[cid] == 70 then -- NIGHTMARE
		if msgcontains(msg, "outfit") then
			npcHandler:say("É necessário: {500 Demonic Essence}. Você quer mesmo fazer esse outfit?", cid)
			npcHandler.topic[cid] = 71
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {500 Demonic Essence}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 72
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {1000 Demonic Essence}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 73
		end
	end
	
	if msgcontains(msg, "brotherhood") or msgcontains(msg, "brother hood") then
		npcHandler:say("Você gostaria de fazer {outfit}, {first addon} ou {second addon}?", cid)
		npcHandler.topic[cid] = 74
	elseif npcHandler.topic[cid] == 74 then -- NIGHTMARE
		if msgcontains(msg, "outfit") then
			npcHandler:say("É necessário: {500 Demonic Essence}. Você quer mesmo fazer esse outfit?", cid)
			npcHandler.topic[cid] = 75
		elseif msgcontains(msg, "first") or msgcontains(msg, "first addon") then
			npcHandler:say("É necessário: {500 Demonic Essence}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 76
		elseif msgcontains(msg, "second") or msgcontains(msg, "second addon") then
			npcHandler:say("É necessário: {1000 Demonic Essence}. Você quer mesmo fazer esse addon?", cid)
			npcHandler.topic[cid] = 77
		end
	end
-----------------------------------------------------------------------------------

	if msgcontains(msg, "yes") or msgcontains(msg, "sim") then	
		if npcHandler.topic[cid] == 2 then -- CITIZEN - FIRST ADDON
			if getPlayerStorageValue(cid, 20000) <= 0 then
				if getPlayerItemCount(cid, 5878) >= 100 then
					if doPlayerRemoveItem(cid, 5878, 100) then
						npcHandler:say("Na hora certa! Sua mochila está terminada. Aqui vai, espero que goste.", cid)
						doPlayerAddOutfit(cid, 136, 1)
						doPlayerAddOutfit(cid, 128, 1)
						setPlayerStorageValue(cid, 20000, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 3 then -- CITIZEN - SECOND ADDON
			if getPlayerStorageValue(cid, 20001) <= 0 then
				if getPlayerItemCount(cid, 5890) >= 100 and getPlayerItemCount(cid, 5902) >= 50 and getPlayerItemCount(cid, 2480) >= 1 then
					if doPlayerRemoveItem(cid, 5890, 100) and doPlayerRemoveItem(cid, 5902, 50) and doPlayerRemoveItem(cid, 2480, 1) then
						npcHandler:say("Bom trabalho! Isso deve ter dado muito trabalho. Ok, você coloca assim ... então cola assim ... aqui!", cid)
						doPlayerAddOutfit(cid, 136, 2)
						doPlayerAddOutfit(cid, 128, 2)
						setPlayerStorageValue(cid, 20001, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 5 then -- HUNTER - FIRST ADDON
			if getPlayerStorageValue(cid, 20002) <= 0 then
				if getPlayerItemCount(cid, 5947) >= 1 and getPlayerItemCount(cid, 5876) >= 100 and getPlayerItemCount(cid, 5948) >= 100 and getPlayerItemCount(cid, 5891) >= 5 and getPlayerItemCount(cid, 5887) >= 1 and getPlayerItemCount(cid, 5889) >= 1 and getPlayerItemCount(cid, 5888) >= 1 then
					if doPlayerRemoveItem(cid, 5947, 1) and doPlayerRemoveItem(cid, 5876, 100) and doPlayerRemoveItem(cid, 5948, 100) and doPlayerRemoveItem(cid, 5891, 5) and doPlayerRemoveItem(cid, 5887, 1) and doPlayerRemoveItem(cid, 5889, 1) and doPlayerRemoveItem(cid, 5888, 1) then
						npcHandler:say("Nossa, estou impressionado, ".. getCreatureName(cid) ..". Você é realmente um membro valioso da nossa guilda de paladinos. Eu lhe concederei sua recompensa agora. Use-o com orgulho!", cid)
						doPlayerAddOutfit(cid, 137, 1)
						doPlayerAddOutfit(cid, 129, 1)
						setPlayerStorageValue(cid, 20002, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 6 then -- HUNTER - SECOND ADDON
			if getPlayerStorageValue(cid, 20003) <= 0 then
				if getPlayerItemCount(cid, 5875) >= 1 then
					if doPlayerRemoveItem(cid, 5875, 1) then
						npcHandler:say("Ótimo! Eu concedo-lhe o direito de usar as luvas de atirador como acessório. Parabéns!", cid)
						doPlayerAddOutfit(cid, 137, 2)
						doPlayerAddOutfit(cid, 129, 2)
						setPlayerStorageValue(cid, 20003, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 7 then -- ENCHANTED CHICKEN WING
			if getPlayerItemCount(cid, 2195) >= 1 then
				if doPlayerRemoveItem(cid, 2195, 1) then
					npcHandler:say("Muito Bom! Um prazer negociar com você!", cid)
					doPlayerAddItem(cid, 5891, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem todos os itens.", cid)
				npcHandler.topic[cid] = 0
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 9 then -- KNIGHT - FIRST ADDON
			if getPlayerStorageValue(cid, 20004) <= 0 then
				if getPlayerItemCount(cid, 5880) >= 100 and getPlayerItemCount(cid, 5892) >= 1 then
					if doPlayerRemoveItem(cid, 5880, 100) and doPlayerRemoveItem(cid, 5892, 1) then
						npcHandler:say("Bem! De fato, tenho um na loja. Aqui está!", cid)
						doPlayerAddOutfit(cid, 139, 1)
						doPlayerAddOutfit(cid, 131, 1)
						setPlayerStorageValue(cid, 20004, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 10 then -- KNIGHT - SECOND ADDON
			if getPlayerStorageValue(cid, 20005) <= 0 then
				if getPlayerItemCount(cid, 5893) >= 100 and getPlayerItemCount(cid, 5885) >= 1 and getPlayerItemCount(cid, 5887) >= 1 then
					if doPlayerRemoveItem(cid, 5893, 100) and doPlayerRemoveItem(cid, 5885, 1) and doPlayerRemoveItem(cid, 5887, 1) then
						npcHandler:say("Seu capacete está acabado, espero que você goste.", cid)
						doPlayerAddOutfit(cid, 139, 2)
						doPlayerAddOutfit(cid, 131, 2)
						setPlayerStorageValue(cid, 20005, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 12 then -- MAGE - FIRST ADDON
			if getPlayerSex(cid) == 0 then -- MULHER
				if getPlayerStorageValue(cid, 20006) <= 0 then
					if getPlayerItemCount(cid, 5958) >= 1 then
						if doPlayerRemoveItem(cid, 5958, 1) then
							npcHandler:say("Parabéns! Aqui, de agora em diante, você pode usar nosso adorável cinturão de poções como acessório.", cid)
							doPlayerAddOutfit(cid, 138, 1)
							doPlayerAddOutfit(cid, 130, 1)
							setPlayerStorageValue(cid, 20006, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else -- HOMEM
				if getPlayerStorageValue(cid, 20006) <= 0 then
					if getPlayerItemCount(cid, 2187) >= 1 and getPlayerItemCount(cid, 2189) >= 1 and getPlayerItemCount(cid, 2188) >= 1 and getPlayerItemCount(cid, 2191) >= 1 and getPlayerItemCount(cid, 2190) >= 1 and getPlayerItemCount(cid, 2183) >= 1 and getPlayerItemCount(cid, 2181) >= 1 and getPlayerItemCount(cid, 2185) >= 1 and getPlayerItemCount(cid, 2186) >= 1 and getPlayerItemCount(cid, 2182) >= 1 and getPlayerItemCount(cid, 5904) >= 10 and getPlayerItemCount(cid, 2193) >= 20 and getPlayerItemCount(cid, 5809) >= 1 then
						if doPlayerRemoveItem(cid, 2187, 1) and doPlayerRemoveItem(cid, 2189, 1) and doPlayerRemoveItem(cid, 2188, 1) and doPlayerRemoveItem(cid, 2191, 1) and doPlayerRemoveItem(cid, 2190, 1) and doPlayerRemoveItem(cid, 2183, 1) and doPlayerRemoveItem(cid, 2181, 1) and doPlayerRemoveItem(cid, 2185, 1) and doPlayerRemoveItem(cid, 2186, 1) and doPlayerRemoveItem(cid, 2182, 1) and doPlayerRemoveItem(cid, 5904, 10) and doPlayerRemoveItem(cid, 2193, 20) and doPlayerRemoveItem(cid, 5809, 1) then
							npcHandler:say("Fico feliz em dizer que terminei o ritual, ".. getCreatureName(cid) ..". Aqui está sua nova varinha. Espero que você o carregue orgulhosamente para todo mundo ver.", cid)
							doPlayerAddOutfit(cid, 138, 1)
							doPlayerAddOutfit(cid, 130, 1)
							setPlayerStorageValue(cid, 20006, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			end		
		elseif npcHandler.topic[cid] == 13 then -- MAGE - SECOND ADDON
			if getPlayerSex(cid) == 0 then -- MULHER
				if getPlayerStorageValue(cid, 20007) <= 0 then
					if getPlayerItemCount(cid, 5905) >= 30 and getPlayerItemCount(cid, 5904) >= 15 and getPlayerItemCount(cid, 5882) >= 40 and getPlayerItemCount(cid, 5881) >= 60 and getPlayerItemCount(cid, 5886) >= 10 and getPlayerItemCount(cid, 5922) >= 35 and getPlayerItemCount(cid, 5883) >= 40 and getPlayerItemCount(cid, 5911) >= 20 and getPlayerItemCount(cid, 5894) >= 70 then
						if doPlayerRemoveItem(cid, 5905, 30) and doPlayerRemoveItem(cid, 5904, 15) and doPlayerRemoveItem(cid, 5882, 40) and doPlayerRemoveItem(cid, 5881, 60) and doPlayerRemoveItem(cid, 5886, 10) and doPlayerRemoveItem(cid, 5922, 35) and doPlayerRemoveItem(cid, 5883, 40) and doPlayerRemoveItem(cid, 5911, 20) and doPlayerRemoveItem(cid, 5894, 70) then
							npcHandler:say("Eu concedo a você o direito de usar um sinal especial de honra. Desde que você é uma mulher, eu acho que você gosta de coisas bem brilhantes. Ai está.", cid)
							doPlayerAddOutfit(cid, 138, 2)
							doPlayerAddOutfit(cid, 130, 2)
							setPlayerStorageValue(cid, 20007, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else -- HOMEM
				if getPlayerStorageValue(cid, 20007) <= 0 then
					if getPlayerItemCount(cid, 5903) >= 1 then
						if doPlayerRemoveItem(cid, 5903, 1) then
							npcHandler:say("Curvo-me a você, ".. getCreatureName(cid) ..",e concedo-lhe o direito de usar o chapéu de Ferumbras como acessório. Parabéns!", cid)
							doPlayerAddOutfit(cid, 138, 2)
							doPlayerAddOutfit(cid, 130, 2)
							setPlayerStorageValue(cid, 20007, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 14 then -- MAGIC SULPHUR
			if getPlayerItemCount(cid, 2392) >= 3 then
				if doPlayerRemoveItem(cid, 2392, 3) then
					npcHandler:say("Muito Bom! Um prazer negociar com você!", cid)
					doPlayerAddItem(cid, 5904, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem todos os itens.", cid)
				npcHandler.topic[cid] = 0
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 15 then -- SPOOL OF YARN
			if getPlayerItemCount(cid, 5879) >= 10 then
				if doPlayerRemoveItem(cid, 5879, 10) then
					npcHandler:say("Muito Bom! Um prazer negociar com você!", cid)
					doPlayerAddItem(cid, 5886, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem todos os itens.", cid)
				npcHandler.topic[cid] = 0
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 16 then -- SPIRIT CONTAINER
			if getPlayerItemCount(cid, 2498) >= 2 then
				if doPlayerRemoveItem(cid, 2498, 2) then
					npcHandler:say("Muito Bom! Um prazer negociar com você!", cid)
					doPlayerAddItem(cid, 5884, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem todos os itens.", cid)
				npcHandler.topic[cid] = 0
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 17 then -- FLASK OF WARRIOR SWEAT
			if getPlayerItemCount(cid, 2475) >= 4 then
				if doPlayerRemoveItem(cid, 2475, 4) then
					npcHandler:say("Muito Bom! Um prazer negociar com você!", cid)
					doPlayerAddItem(cid, 5885, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem todos os itens.", cid)
				npcHandler.topic[cid] = 0
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 19 then -- BARBARIAN - FIRST ADDON
			if getPlayerStorageValue(cid, 20008) <= 0 then
				if getPlayerItemCount(cid, 5884) >= 1 and getPlayerItemCount(cid, 5885) >= 1 and getPlayerItemCount(cid, 5911) >= 50 and getPlayerItemCount(cid, 5910) >= 50 and getPlayerItemCount(cid, 5886) >= 10 then
					if doPlayerRemoveItem(cid, 5884, 1) and doPlayerRemoveItem(cid, 5885, 1) and doPlayerRemoveItem(cid, 5911, 50) and doPlayerRemoveItem(cid, 5910, 50) and doPlayerRemoveItem(cid, 5886, 10) then
						npcHandler:say("Eu mantive esta tradicional peruca bárbara segura por muitos anos agora. Agora é seu! Espero que você a use com orgulho.", cid)
						doPlayerAddOutfit(cid, 147, 1)
						doPlayerAddOutfit(cid, 143, 1)
						setPlayerStorageValue(cid, 20008, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 20 then -- BARBARIAN - SECOND ADDON
			if getPlayerStorageValue(cid, 20009) <= 0 then
				if getPlayerItemCount(cid, 5880) >= 100 and getPlayerItemCount(cid, 5892) >= 1 and getPlayerItemCount(cid, 5893) >= 50 and getPlayerItemCount(cid, 5876) >= 50 then
					if doPlayerRemoveItem(cid, 5880, 100) and doPlayerRemoveItem(cid, 5892, 1) and doPlayerRemoveItem(cid, 5893, 50) and doPlayerRemoveItem(cid, 5876, 50) then
						npcHandler:say("Seu machado está feito! Para você levar e vestir.", cid)
						doPlayerAddOutfit(cid, 147, 2)
						doPlayerAddOutfit(cid, 143, 2)
						setPlayerStorageValue(cid, 20009, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------
		elseif npcHandler.topic[cid] == 22 then -- DRUID - FIRST ADDON
			if getPlayerStorageValue(cid, 20010) <= 0 then
				if getPlayerItemCount(cid, 5896) >= 50 and getPlayerItemCount(cid, 5897) >= 50 then
					if doPlayerRemoveItem(cid, 5896, 50) and doPlayerRemoveItem(cid, 5897, 50) then
						npcHandler:say("Excelente! Como prometido, aqui estão suas patas de urso.", cid)
						doPlayerAddOutfit(cid, 148, 1)
						doPlayerAddOutfit(cid, 144, 1)
						setPlayerStorageValue(cid, 20010, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 23 then -- DRUID - SECOND ADDON
			if getPlayerStorageValue(cid, 20011) <= 0 then
				if getPlayerItemCount(cid, 5906) >= 100 and getPlayerItemCount(cid, 5940) >= 1 then
					if doPlayerRemoveItem(cid, 5906, 100) and doPlayerRemoveItem(cid, 5940, 1) then
						npcHandler:say("De agora em diante, você será conhecido como ".. getCreatureName(cid) ..", o guerreiro urso. Você será forte e orgulhoso como Angros, o grande urso escuro. Ele guiará seu caminho.", cid)
						doPlayerAddOutfit(cid, 148, 2)
						doPlayerAddOutfit(cid, 144, 2)
						setPlayerStorageValue(cid, 20011, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 25 then -- NOBLEMAN - FIRST ADDON
			if getPlayerStorageValue(cid, 20012) <= 0 then
				if getPlayerMoney(cid) >= 150000 then -- gold coin
					if doPlayerRemoveMoney(cid, 150000) then -- gold coin
						npcHandler:say("Parabéns! Aqui está o seu novo acessório, espero que goste. Por favor, visite-me novamente!", cid)
						doPlayerAddOutfit(cid, 140, 1)
						doPlayerAddOutfit(cid, 132, 1)
						setPlayerStorageValue(cid, 20012, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem dinheiro suficiente.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 26 then -- NOBLEMAN - SECOND ADDON
			if getPlayerStorageValue(cid, 20013) <= 0 then
				if getPlayerMoney(cid) >= 150000 then -- gold coin
					if doPlayerRemoveMoney(cid, 150000) then -- gold coin
						npcHandler:say("Parabéns! Aqui está o seu novo acessório, espero que goste. Por favor, visite-me novamente!", cid)
						doPlayerAddOutfit(cid, 140, 2)
						doPlayerAddOutfit(cid, 132, 2)
						setPlayerStorageValue(cid, 20013, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem dinheiro suficiente.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------	
		elseif npcHandler.topic[cid] == 28 then -- ORIENTAL - FIRST ADDON
			if getPlayerStorageValue(cid, 20014) <= 0 then
				if getPlayerItemCount(cid, 5945) >= 1  then
					if doPlayerRemoveItem(cid, 5945, 1) then
						npcHandler:say("Sim! É isso aí! Cumprirei minha promessa: Aqui está sua cimitarra! Obrigado novamente!", cid)
						doPlayerAddOutfit(cid, 150, 1)
						doPlayerAddOutfit(cid, 146, 1)
						setPlayerStorageValue(cid, 20014, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 29 then -- ORIENTAL - SECOND ADDON
			if getPlayerStorageValue(cid, 20015) <= 0 then
				if getPlayerItemCount(cid, 5883) >= 100 and getPlayerItemCount(cid, 5895) >= 100 and getPlayerItemCount(cid, 5891) >= 2 and getPlayerItemCount(cid, 5912) >= 100 then
					if doPlayerRemoveItem(cid, 5883, 100) and doPlayerRemoveItem(cid, 5895, 100) and doPlayerRemoveItem(cid, 5891, 2) and doPlayerRemoveItem(cid, 5912, 100) then
						npcHandler:say("Ótimo! Eu concedo-lhe o direito de usar as luvas de atirador como acessório. Parabéns!", cid)
						doPlayerAddOutfit(cid, 150, 2)
						doPlayerAddOutfit(cid, 146, 2)
						setPlayerStorageValue(cid, 20015, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 31 then -- SUMMONER - FIRST ADDON
			if getPlayerSex(cid) == 0 then -- MULHER
				if getPlayerStorageValue(cid, 20016) <= 0 then
					if getPlayerItemCount(cid, 2187) >= 1 and getPlayerItemCount(cid, 2189) >= 1 and getPlayerItemCount(cid, 2188) >= 1 and getPlayerItemCount(cid, 2191) >= 1 and getPlayerItemCount(cid, 2190) >= 1 and getPlayerItemCount(cid, 2183) >= 1 and getPlayerItemCount(cid, 2181) >= 1 and getPlayerItemCount(cid, 2185) >= 1 and getPlayerItemCount(cid, 2186) >= 1 and getPlayerItemCount(cid, 2182) >= 1 and getPlayerItemCount(cid, 5904) >= 10 and getPlayerItemCount(cid, 2193) >= 20 and getPlayerItemCount(cid, 5809) >= 1 then
						if doPlayerRemoveItem(cid, 2187, 1) and doPlayerRemoveItem(cid, 2189, 1) and doPlayerRemoveItem(cid, 2188, 1) and doPlayerRemoveItem(cid, 2191, 1) and doPlayerRemoveItem(cid, 2190, 1) and doPlayerRemoveItem(cid, 2183, 1) and doPlayerRemoveItem(cid, 2181, 1) and doPlayerRemoveItem(cid, 2185, 1) and doPlayerRemoveItem(cid, 2186, 1) and doPlayerRemoveItem(cid, 2182, 1) and doPlayerRemoveItem(cid, 5904, 10) and doPlayerRemoveItem(cid, 2193, 20) and doPlayerRemoveItem(cid, 5809, 1) then
							npcHandler:say("Fico feliz em dizer que terminei o ritual, ".. getCreatureName(cid) ..". Aqui está sua nova varinha. Espero que você o carregue orgulhosamente para todo mundo ver.", cid)
							doPlayerAddOutfit(cid, 141, 1)
							doPlayerAddOutfit(cid, 133, 1)
							setPlayerStorageValue(cid, 20016, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else -- HOMEM
				if getPlayerStorageValue(cid, 20016) <= 0 then
					if getPlayerItemCount(cid, 5958) >= 1 then
						if doPlayerRemoveItem(cid, 5958, 1) then
							npcHandler:say("Parabéns! Aqui, de agora em diante, você pode usar nosso adorável cinturão de poções como acessório.", cid)
							doPlayerAddOutfit(cid, 141, 1)
							doPlayerAddOutfit(cid, 133, 1)
							setPlayerStorageValue(cid, 20016, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			end		
		elseif npcHandler.topic[cid] == 32 then -- SUMMONER - SECOND ADDON
			if getPlayerSex(cid) == 0 then -- MULHER
				if getPlayerStorageValue(cid, 20017) <= 0 then
					if getPlayerItemCount(cid, 5903) >= 1 then
						if doPlayerRemoveItem(cid, 5903, 1) then
							npcHandler:say("Curvo-me a você, ".. getCreatureName(cid) ..",e concedo-lhe o direito de usar o chapéu de Ferumbras como acessório. Parabéns!", cid)
							doPlayerAddOutfit(cid, 141, 2)
							doPlayerAddOutfit(cid, 133, 2)
							setPlayerStorageValue(cid, 20017, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else -- HOMEM
				if getPlayerStorageValue(cid, 20017) <= 0 then
					if getPlayerItemCount(cid, 5905) >= 30 and getPlayerItemCount(cid, 5904) >= 15 and getPlayerItemCount(cid, 5882) >= 40 and getPlayerItemCount(cid, 5881) >= 60 and getPlayerItemCount(cid, 5886) >= 10 and getPlayerItemCount(cid, 5922) >= 35 and getPlayerItemCount(cid, 5883) >= 40 and getPlayerItemCount(cid, 5911) >= 20 and getPlayerItemCount(cid, 5894) >= 70 then
						if doPlayerRemoveItem(cid, 5905, 30) and doPlayerRemoveItem(cid, 5904, 15) and doPlayerRemoveItem(cid, 5882, 40) and doPlayerRemoveItem(cid, 5881, 60) and doPlayerRemoveItem(cid, 5886, 10) and doPlayerRemoveItem(cid, 5922, 35) and doPlayerRemoveItem(cid, 5883, 40) and doPlayerRemoveItem(cid, 5911, 20) and doPlayerRemoveItem(cid, 5894, 70) then
							npcHandler:say("Eu concedo a você o direito de usar um sinal especial de honra. Desde que você é um homem, eu acho que você não quer coisas de menina. Ai está.", cid)
							doPlayerAddOutfit(cid, 141, 2)
							doPlayerAddOutfit(cid, 133, 2)
							setPlayerStorageValue(cid, 20017, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 34 then -- WARRIOR - FIRST ADDON
			if getPlayerStorageValue(cid, 20018) <= 0 then
				if getPlayerItemCount(cid, 5925) >= 100 and getPlayerItemCount(cid, 5899) >= 100 and getPlayerItemCount(cid, 5884) >= 1 and getPlayerItemCount(cid, 10020) >= 1 then
					if doPlayerRemoveItem(cid, 5925, 100) and doPlayerRemoveItem(cid, 5899, 100) and doPlayerRemoveItem(cid, 5884, 1) and doPlayerRemoveItem(cid, 10020, 1) then
						if getPlayerSex(cid) == 0 then -- MULHER
							npcHandler:say("Acabado! Você ficou muito linda. Esta armadura com este pequeno símbolo nos ombros realmente realçam a cor de seus olhos.", cid)
						else -- HOMEM
							npcHandler:say("Acabado! Desde que você é um homem, eu pensei que você provavelmente queria dois. Os homens sempre querem aquele pequeno símbolo de status extra. <risos>", cid)
						end
						doPlayerAddOutfit(cid, 142, 1)
						doPlayerAddOutfit(cid, 134, 1)
						setPlayerStorageValue(cid, 20018, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 35 then -- WARRIOR - SECOND ADDON
			if getPlayerStorageValue(cid, 20019) <= 0 then
				if getPlayerItemCount(cid, 5880) >= 100 and getPlayerItemCount(cid, 5887) >= 1 then
					if doPlayerRemoveItem(cid, 5880, 100) and doPlayerRemoveItem(cid, 5887, 1) then
						npcHandler:say("Bem! De fato, tenho um na loja. Aqui está!", cid)
						doPlayerAddOutfit(cid, 142, 2)
						doPlayerAddOutfit(cid, 134, 2)
						setPlayerStorageValue(cid, 20019, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 37 then -- WIZARD - FIRST ADDON
			if getPlayerStorageValue(cid, 20020) <= 0 then
				if getPlayerItemCount(cid, 2536) >= 1 and getPlayerItemCount(cid, 2492) >= 1 and getPlayerItemCount(cid, 2488) >= 1 and getPlayerItemCount(cid, 2123) >= 1 then
					if doPlayerRemoveItem(cid, 2536, 1) and doPlayerRemoveItem(cid, 2492, 1) and doPlayerRemoveItem(cid, 2488, 1) and doPlayerRemoveItem(cid, 2123, 1) then
						if getPlayerSex(cid) == 0 then -- MULHER
							npcHandler:say("Boa. Eu aceito seu sacrifício. Você provou que é um verdadeiro seguidor de Zathroth e não hesita em sacrificar os bens mundanos. Assim, eu recompensarei você com esta tiara.", cid)
						else -- HOMEM
							npcHandler:say("Boa. Eu aceito seu sacrifício. Você provou que é um verdadeiro seguidor de Zathroth e não hesita em sacrificar os bens mundanos. Assim, eu recompensarei você com este capacete.", cid)
						end
						doPlayerAddOutfit(cid, 149, 1)
						doPlayerAddOutfit(cid, 145, 1)
						setPlayerStorageValue(cid, 20020, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 38 then -- WIZARD - SECOND ADDON
			if getPlayerStorageValue(cid, 20021) <= 0 then
				if getPlayerStorageValue(cid, 20020) == 1 then -- CHECAR FIRST ADDON
					if getPlayerItemCount(cid, 5922) >= 50 then
						if doPlayerRemoveItem(cid, 5922, 50) then
							npcHandler:say("Ótimo! Eu concedo-lhe o direito de usar as luvas de atirador como acessório. Parabéns!", cid)
							doPlayerAddOutfit(cid, 149, 2)
							doPlayerAddOutfit(cid, 145, 2)
							setPlayerStorageValue(cid, 20021, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você deve completar o {first addon} de Wizard antes de fazer o second addon.", cid)
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 40 then -- DEMONHUNTER - FIRST ADDON
			if getPlayerStorageValue(cid, 45252) == 1 then -- CHECAR INQ FINAL
				if getPlayerStorageValue(cid, 20022) <= 0 then
					if getPlayerItemCount(cid, 5905) >= 30 and getPlayerItemCount(cid, 5906) >= 40 and getPlayerItemCount(cid, 5954) >= 50 and getPlayerItemCount(cid, 6500) >= 50 and getPlayerItemCount(cid, 2151) >= 100 then
						if doPlayerRemoveItem(cid, 5905, 30) and doPlayerRemoveItem(cid, 5906, 40) and doPlayerRemoveItem(cid, 5954, 50) and doPlayerRemoveItem(cid, 6500, 50) and doPlayerRemoveItem(cid, 2151, 100) then
							npcHandler:say("Acabado!", cid)
							doPlayerAddOutfit(cid, 288, 1)
							doPlayerAddOutfit(cid, 289, 1)
							setPlayerStorageValue(cid, 20022, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa finalizar a {'Inquisition Quest'}.", cid)
			end
		elseif npcHandler.topic[cid] == 41 then -- DEMONHUNTER - SECOND ADDON
			if getPlayerStorageValue(cid, 45252) == 1 then -- CHECAR INQ FINAL
				if getPlayerStorageValue(cid, 20023) <= 0 then
					if getPlayerItemCount(cid, 5906) >= 50 and getPlayerItemCount(cid, 6500) >= 200 and getPlayerItemCount(cid, 2151) >= 100 then
						if doPlayerRemoveItem(cid, 5906, 50) and doPlayerRemoveItem(cid, 6500, 200) and doPlayerRemoveItem(cid, 2151, 100) then
							npcHandler:say("Parabéns!", cid)
							doPlayerAddOutfit(cid, 288, 2)
							doPlayerAddOutfit(cid, 289, 2)
							setPlayerStorageValue(cid, 20023, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa finalizar a {'Inquisition Quest'}.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 43 then -- WAYFARER - FIRST ADDON
			if getPlayerStorageValue(cid, 45262) == 1 then -- CHECAR WOTE FINAL
				if getPlayerStorageValue(cid, 20024) <= 0 then
					if getPlayerItemCount(cid, 5909) >= 100 and getPlayerItemCount(cid, 5910) >= 100 and getPlayerItemCount(cid, 5911) >= 100 and getPlayerItemCount(cid, 5912) >= 100 and getPlayerItemCount(cid, 5913) >= 100 and getPlayerItemCount(cid, 5914) >= 100 then
						if doPlayerRemoveItem(cid, 5909, 100) and doPlayerRemoveItem(cid, 5910, 100) and doPlayerRemoveItem(cid, 5911, 100) and doPlayerRemoveItem(cid, 5912, 100) and doPlayerRemoveItem(cid, 5913, 100) and doPlayerRemoveItem(cid, 5914, 100) then
							npcHandler:say("Parabéns!", cid)
							doPlayerAddOutfit(cid, 366, 1)
							doPlayerAddOutfit(cid, 367, 1)
							setPlayerStorageValue(cid, 20024, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa finalizar a {'WOTE Quest'}.", cid)
			end
		elseif npcHandler.topic[cid] == 44 then -- WAYFARER - SECOND ADDON
			if getPlayerStorageValue(cid, 45262) == 1 then -- CHECAR WOTE FINAL
				if getPlayerStorageValue(cid, 20025) <= 0 then
					if getPlayerItemCount(cid, 5886) >= 5 and getPlayerItemCount(cid, 6500) >= 500 then
						if doPlayerRemoveItem(cid, 5886, 5) and doPlayerRemoveItem(cid, 6500, 500) then
							npcHandler:say("Muito bom. finalizado!", cid)
							doPlayerAddOutfit(cid, 366, 2)
							doPlayerAddOutfit(cid, 367, 2)
							setPlayerStorageValue(cid, 20025, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa finalizar a {'WOTE Quest'}.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 46 then -- WARMASTER - OUTFIT
			if getPlayerStorageValue(cid, 20026) <= 0 then
				if getPlayerMoney(cid) >= 250000 then -- gold coin
					if doPlayerRemoveMoney(cid, 250000) then -- gold coin
						npcHandler:say("Parabéns!", cid)
						doPlayerAddOutfit(cid, 336, 0)
						doPlayerAddOutfit(cid, 335, 0)
						setPlayerStorageValue(cid, 20026, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 47 then -- WARMASTER - FIRST ADDON
			if getPlayerStorageValue(cid, 20026) == 1 then -- CHECAR WARMASTER OUTFIT
				if getPlayerStorageValue(cid, 20027) <= 0 then
					if getPlayerItemCount(cid, 5886) >= 15 and getPlayerItemCount(cid, 5904) >= 15 and getPlayerItemCount(cid, 5884) >= 1 then
						if doPlayerRemoveItem(cid, 5886, 15) and doPlayerRemoveItem(cid, 5904, 15) and doPlayerRemoveItem(cid, 5884, 1) then
							npcHandler:say("Parabéns!", cid)
							doPlayerAddOutfit(cid, 336, 1)
							doPlayerAddOutfit(cid, 335, 1)
							setPlayerStorageValue(cid, 20027, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 48 then -- WARMASTER - SECOND ADDON
			if getPlayerStorageValue(cid, 20026) == 1 then -- CHECAR WARMASTER OUTFIT
				if getPlayerStorageValue(cid, 20028) <= 0 then
					if getPlayerItemCount(cid, 5886) >= 15 and getPlayerItemCount(cid, 5904) >= 15 and getPlayerItemCount(cid, 5884) >= 1 then
						if doPlayerRemoveItem(cid, 5886, 15) and doPlayerRemoveItem(cid, 5904, 15) and doPlayerRemoveItem(cid, 5884, 1) then
							npcHandler:say("Muito bom. finalizado!", cid)
							doPlayerAddOutfit(cid, 336, 2)
							doPlayerAddOutfit(cid, 335, 2)
							setPlayerStorageValue(cid, 20028, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 50 then -- ASSASIN - OUTFIT
			if getPlayerStorageValue(cid, 20029) <= 0 then
				if getPlayerItemCount(cid, 5898) >= 30 and getPlayerItemCount(cid, 5882) >= 10 and getPlayerItemCount(cid, 5881) >= 30 and getPlayerItemCount(cid, 5895) >= 20 and getPlayerItemCount(cid, 5905) >= 20 and getPlayerItemCount(cid, 5906) >= 10 and getPlayerItemCount(cid, 5885) >= 1 then
					if doPlayerRemoveItem(cid, 5898, 30) and doPlayerRemoveItem(cid, 5882, 10) and doPlayerRemoveItem(cid, 5881, 30) and doPlayerRemoveItem(cid, 5895, 20) and doPlayerRemoveItem(cid, 5905, 20) and doPlayerRemoveItem(cid, 5906, 10) and doPlayerRemoveItem(cid, 5885, 1) then
						npcHandler:say("Desde que você me ajudou a preparar essa roupa e assim garantiu a alta qualidade do meu trabalho. Eu lhe darei essa fantasia de assassino. Falta a parte da cabeça, mas é quase como novo. Não finja ser eu, ok?", cid)
						doPlayerAddOutfit(cid, 156, 0)
						doPlayerAddOutfit(cid, 152, 0)
						setPlayerStorageValue(cid, 20029, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 51 then -- ASSASIN - FIRST ADDON
			if getPlayerStorageValue(cid, 20029) == 1 then -- CHECAR ASSASIN OUTFIT
				if getPlayerStorageValue(cid, 20030) <= 0 then
					if getPlayerItemCount(cid, 5909) >= 50 and getPlayerItemCount(cid, 5910) >= 50 and getPlayerItemCount(cid, 5911) >= 50 and getPlayerItemCount(cid, 5912) >= 50 and getPlayerItemCount(cid, 5913) >= 50 and getPlayerItemCount(cid, 5914) >= 50 and getPlayerItemCount(cid, 5886) >= 10 then
						if doPlayerRemoveItem(cid, 5909, 50) and doPlayerRemoveItem(cid, 5910, 50) and doPlayerRemoveItem(cid, 5911, 50) and doPlayerRemoveItem(cid, 5912, 50) and doPlayerRemoveItem(cid, 5913, 50) and doPlayerRemoveItem(cid, 5914, 50) and doPlayerRemoveItem(cid, 5886, 10) then
							npcHandler:say("Obrigado! É isso aí, está feito. Bom trabalho, ".. getCreatureName(cid) ..". Eu mantenho minha promessa. Aqui está o pedaço de pano da cabeça de assassino.", cid)
							doPlayerAddOutfit(cid, 156, 1)
							doPlayerAddOutfit(cid, 152, 1)
							setPlayerStorageValue(cid, 20030, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 52 then -- ASSASIN - SECOND ADDON
			if getPlayerStorageValue(cid, 20029) == 1 then -- CHECAR ASSASIN OUTFIT
				if getPlayerStorageValue(cid, 20031) <= 0 then
					if getPlayerItemCount(cid, 5930) >= 1 and getPlayerItemCount(cid, 5804) >= 1 then
						if doPlayerRemoveItem(cid, 5930, 1) and doPlayerRemoveItem(cid, 5804, 1) then
							npcHandler:say("Eu vejo que você trouxe minhas coisas. Boa. Eu vou manter minha promessa: Aqui está a Katana em troca.", cid)
							doPlayerAddOutfit(cid, 156, 2)
							doPlayerAddOutfit(cid, 152, 2)
							setPlayerStorageValue(cid, 20031, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 54 then -- BEGGAR - OUTFIT
			if getPlayerStorageValue(cid, 20032) <= 0 then
				if getPlayerItemCount(cid, 5878) >= 50 and getPlayerItemCount(cid, 5921) >= 30 and getPlayerItemCount(cid, 5913) >= 20 and getPlayerItemCount(cid, 5894) >= 70 then
					if doPlayerRemoveItem(cid, 5878, 50) and doPlayerRemoveItem(cid, 5921, 30) and doPlayerRemoveItem(cid, 5913, 20) and doPlayerRemoveItem(cid, 5894, 70) then
						npcHandler:say("Aqui está. Talvez você goste depois de tudo.", cid)
						doPlayerAddOutfit(cid, 157, 0)
						doPlayerAddOutfit(cid, 153, 0)
						setPlayerStorageValue(cid, 20032, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 55 then -- BEGGAR - FIRST ADDON
			if getPlayerStorageValue(cid, 20032) == 1 then -- CHECAR BEGGAR OUTFIT
				if getPlayerStorageValue(cid, 20033) <= 0 then
					if getPlayerItemCount(cid, 5883) >= 100 and getPlayerMoney(cid) >= 20000 then
						if doPlayerRemoveItem(cid, 5883, 100) and doPlayerRemoveMoney(cid, 20000) then
							if getPlayerSex(cid) == 0 then -- MULHER
								npcHandler:say("Ok, ok ... aqui está o seu vestido prometido. Tenho certeza que vai parecer muito melhor em você do que em mim - quero dizer, meu, err, irmã.", cid)
							else -- HOMEM
								npcHandler:say("Ah! Eu posso ver isso! Sua barba é perfeita! Tudo graças ao meu, err, potion. Sim. Adeus!", cid)
							end
							doPlayerAddOutfit(cid, 157, 1)
							doPlayerAddOutfit(cid, 153, 1)
							setPlayerStorageValue(cid, 20033, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 56 then -- BEGGAR - SECOND ADDON
			if getPlayerStorageValue(cid, 20032) == 1 then -- CHECAR BEGGAR OUTFIT
				if getPlayerStorageValue(cid, 20034) <= 0 then
					if getPlayerItemCount(cid, 6107) >= 1 then
						if doPlayerRemoveItem(cid, 6107, 1) then
							npcHandler:say("Sim!! É isso aí! Estou tão feliz! Agora você pode ter uma staff na mão. Obrigado!", cid)
							doPlayerAddOutfit(cid, 157, 2)
							doPlayerAddOutfit(cid, 153, 2)
							setPlayerStorageValue(cid, 20034, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 58 then -- YODA FANFARE
			if getPlayerMoney(cid) >= 250000 then
				if doPlayerRemoveMoney(cid, 250000) then
					doPlayerAddItem(cid, 12683, 1)
					npcHandler:say("Aqui está. Para receber Jester Outfit você precisa utilizar esse item umas 100x. Caso perca o item, eu posso lhe vender por {250k}.", cid)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não tem dinheiro.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 59 then -- JESTER - FIRST ADDON
			if getPlayerStorageValue(cid, 20035) == 101 then -- CHECAR JESTER OUTFIT
				if getPlayerStorageValue(cid, 20036) <= 0 then
					if getPlayerItemCount(cid, 5912) >= 10 and getPlayerItemCount(cid, 5913) >= 10 and getPlayerItemCount(cid, 5914) >= 10 and getPlayerItemCount(cid, 5909) >= 10 then
						if doPlayerRemoveItem(cid, 5912, 10) and doPlayerRemoveItem(cid, 5913, 10) and doPlayerRemoveItem(cid, 5914, 10) and doPlayerRemoveItem(cid, 5909, 10) then
							npcHandler:say("FON... EOQ MALUCOO, conseguiu finalmente a first addon do Jester. Parabéns!", cid)
							doPlayerAddOutfit(cid, 270, 1)
							doPlayerAddOutfit(cid, 273, 1)
							setPlayerStorageValue(cid, 20036, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 60 then -- JESTER - SECOND ADDON
			if getPlayerStorageValue(cid, 20035) == 101 then -- CHECAR JESTER OUTFIT
				if getPlayerStorageValue(cid, 20037) <= 0 then
					if getPlayerItemCount(cid, 5910) >= 10 and getPlayerItemCount(cid, 5911) >= 10 and getPlayerItemCount(cid, 5912) >= 10 then
						if doPlayerRemoveItem(cid, 5910, 10) and doPlayerRemoveItem(cid, 5911, 10) and doPlayerRemoveItem(cid, 5912, 10) then
							npcHandler:say("KAPPA! Dale dale DOLE.", cid)
							doPlayerAddOutfit(cid, 270, 2)
							doPlayerAddOutfit(cid, 273, 2)
							setPlayerStorageValue(cid, 20037, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 62 then -- SHAMAN - FIRST ADDON
			if getPlayerStorageValue(cid, 20038) <= 0 then
				if getPlayerItemCount(cid, 3966) >= 5 and getPlayerItemCount(cid, 3967) >= 5 then
					if doPlayerRemoveItem(cid, 3966, 5) and doPlayerRemoveItem(cid, 3967, 5) then
						npcHandler:say("Estou orgulhoso de você, meu filho, excelente trabalho. Esta staff será sua a partir de agora!", cid)
						doPlayerAddOutfit(cid, 158, 1)
						doPlayerAddOutfit(cid, 154, 1)
						setPlayerStorageValue(cid, 20038, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 63 then -- SHAMAN - SECOND ADDON
			if getPlayerStorageValue(cid, 20039) <= 0 then
				if getPlayerItemCount(cid, 5810) >= 5 and getPlayerItemCount(cid, 3955) >= 5 and getPlayerItemCount(cid, 5015) >= 1 then
					if doPlayerRemoveItem(cid, 5810, 5) and doPlayerRemoveItem(cid, 3955, 5) and doPlayerRemoveItem(cid, 5015, 5) then
						npcHandler:say("Muito bem, meu filho! Eu concedo a você o direito de usar uma máscara xamânica. Faça isso com orgulho.", cid)
						doPlayerAddOutfit(cid, 158, 2)
						doPlayerAddOutfit(cid, 154, 2)
						setPlayerStorageValue(cid, 20039, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------
		elseif npcHandler.topic[cid] == 65 then -- NORSEMAN - FIRST ADDON
			if getPlayerStorageValue(cid, 20040) <= 0 then
				if getPlayerItemCount(cid, 7290) >= 5 then
					if doPlayerRemoveItem(cid, 7290, 5) then
						npcHandler:say("Excelente, você coletou 5 fragmentos de frostheart. Pegue isso. Pode se adequar à sua roupa nórdica.", cid)
						doPlayerAddOutfit(cid, 252, 1)
						doPlayerAddOutfit(cid, 251, 1)
						setPlayerStorageValue(cid, 20040, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 66 then -- NORSEMAN - SECOND ADDON
			if getPlayerStorageValue(cid, 20041) <= 0 then
				if getPlayerItemCount(cid, 7290) >= 10 then
					if doPlayerRemoveItem(cid, 7290, 10) then
						npcHandler:say("Excelente, você coletou 10 fragmentos de frostheart. Pegue isso.", cid)
						doPlayerAddOutfit(cid, 252, 2)
						doPlayerAddOutfit(cid, 251, 2)
						setPlayerStorageValue(cid, 20041, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------
		elseif npcHandler.topic[cid] == 68 then -- PIRATE - FIRST ADDON
			if getPlayerStorageValue(cid, 20042) <= 0 then
				if getPlayerItemCount(cid, 6098) >= 100 and getPlayerItemCount(cid, 6126) >= 100 and getPlayerItemCount(cid, 6097) >= 100 then
					if doPlayerRemoveItem(cid, 6098, 100) and doPlayerRemoveItem(cid, 6126, 100) and doPlayerRemoveItem(cid, 6097, 100) then
						npcHandler:say("Ok! Pegue este sabre de mim, companheiro.", cid)
						doPlayerAddOutfit(cid, 155, 1)
						doPlayerAddOutfit(cid, 151, 1)
						setPlayerStorageValue(cid, 20042, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end		
		elseif npcHandler.topic[cid] == 69 then -- PIRATE - SECOND ADDON
			if getPlayerStorageValue(cid, 20043) <= 0 then
				if getPlayerItemCount(cid, 6101) >= 1 and getPlayerItemCount(cid, 6102) >= 1 and getPlayerItemCount(cid, 6100) >= 1 and getPlayerItemCount(cid, 6099) >= 1 then
					if doPlayerRemoveItem(cid, 6101, 1) and doPlayerRemoveItem(cid, 6102, 1) and doPlayerRemoveItem(cid, 6100, 1) and doPlayerRemoveItem(cid, 6099, 1) then
						npcHandler:say("INCRÍVEL! Você encontrou todos os quatro! você tem o meu respeito. Você mais do que merece esse chapéu. Ai está.", cid)
						doPlayerAddOutfit(cid, 155, 2)
						doPlayerAddOutfit(cid, 151, 2)
						setPlayerStorageValue(cid, 20043, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse addon.", cid)
			end
		--------------------------------------		
		--------------------------------------
		elseif npcHandler.topic[cid] == 71 then -- NIGHTMARE - OUTFIT
			if getPlayerStorageValue(cid, 20044) <= 0 then
				if getPlayerItemCount(cid, 6500) >= 500 then
					if doPlayerRemoveItem(cid, 6500, 500) then
						npcHandler:say("Parabéns! Quando finalizar todos os addons da Nightmare, fale comigo sobre {Nightmare Shield}.", cid)
						doPlayerAddOutfit(cid, 269, 0)
						doPlayerAddOutfit(cid, 268, 0)
						setPlayerStorageValue(cid, 20044, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 72 then -- NIGHTMARE - FIRST ADDON
			if getPlayerStorageValue(cid, 20044) == 1 then -- CHECAR NIGHTMARE OUTFIT
				if getPlayerStorageValue(cid, 20045) <= 0 then
					if getPlayerItemCount(cid, 6500) >= 500 then
						if doPlayerRemoveItem(cid, 6500, 500) then
							npcHandler:say("Parabéns! Quando finalizar todos os addons da Nightmare, fale comigo sobre {Nightmare Shield}.", cid)
							doPlayerAddOutfit(cid, 269, 1)
							doPlayerAddOutfit(cid, 268, 1)
							setPlayerStorageValue(cid, 20045, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 73 then -- NIGHTMARE - SECOND ADDON
			if getPlayerStorageValue(cid, 20044) == 1 then -- CHECAR NIGHTMARE OUTFIT
				if getPlayerStorageValue(cid, 20046) <= 0 then
					if getPlayerItemCount(cid, 6500) >= 1000 then
						if doPlayerRemoveItem(cid, 6500, 1000) then
							npcHandler:say("Parabéns! Quando finalizar todos os addons da Nightmare, fale comigo sobre {Nightmare Shield}.", cid)
							doPlayerAddOutfit(cid, 269, 2)
							doPlayerAddOutfit(cid, 268, 2)
							setPlayerStorageValue(cid, 20046, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 75 then -- BROTHERHOOD - OUTFIT
			if getPlayerStorageValue(cid, 20047) <= 0 then
				if getPlayerItemCount(cid, 6500) >= 500 then
					if doPlayerRemoveItem(cid, 6500, 500) then
						npcHandler:say("Parabéns! Quando finalizar todos os addons da Brotherhood, fale comigo sobre {Necromancer Shield}.", cid)
						doPlayerAddOutfit(cid, 279, 0)
						doPlayerAddOutfit(cid, 278, 0)
						setPlayerStorageValue(cid, 20047, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já possui esse outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 76 then -- BROTHERHOOD - FIRST ADDON
			if getPlayerStorageValue(cid, 20047) == 1 then -- CHECAR BROTHERHOOD OUTFIT
				if getPlayerStorageValue(cid, 20048) <= 0 then
					if getPlayerItemCount(cid, 6500) >= 500 then
						if doPlayerRemoveItem(cid, 6500, 500) then
							npcHandler:say("Parabéns! Quando finalizar todos os addons da Brotherhood, fale comigo sobre {Necromancer Shield}.", cid)
							doPlayerAddOutfit(cid, 279, 1)
							doPlayerAddOutfit(cid, 278, 1)
							setPlayerStorageValue(cid, 20048, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end	
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		elseif npcHandler.topic[cid] == 77 then -- BROTHERHOOD  - SECOND ADDON
			if getPlayerStorageValue(cid, 20047) == 1 then -- CHECAR BROTHERHOOD OUTFIT
				if getPlayerStorageValue(cid, 20049) <= 0 then
					if getPlayerItemCount(cid, 6500) >= 1000 then
						if doPlayerRemoveItem(cid, 6500, 1000) then
							npcHandler:say("Parabéns! Quando finalizar todos os addons da Brotherhood, fale comigo sobre {Necromancer Shield}.", cid)
							doPlayerAddOutfit(cid, 279, 2)
							doPlayerAddOutfit(cid, 278, 2)
							setPlayerStorageValue(cid, 20049, 1)
							npcHandler.topic[cid] = 0
						else
							doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
							npcHandler.topic[cid] = 0
						end
					else
						npcHandler:say("Você não tem todos os itens.", cid)
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você já possui esse addon.", cid)
				end
			else
				npcHandler:say("Primeiro você precisa possuir a outfit.", cid)
			end
		--------------------------------------	
		--------------------------------------
		elseif npcHandler.topic[cid] == 78 then -- NIGHTMARE SHIELD
			if getPlayerStorageValue(cid, 20050) <= 0 then
				if getPlayerItemCount(cid, 6500) >= 100 then
					if doPlayerRemoveItem(cid, 6500, 100) then
						npcHandler:say("Muito Bom! Nightmare Shield. Item excelente.", cid)
						doPlayerAddItem(cid, 6391, 1)
						setPlayerStorageValue(cid, 20050, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já pegou o item.", cid)
				npcHandler.topic[cid] = 0
			end
		
		elseif npcHandler.topic[cid] == 79 then -- NECROMANCER SHIELD
			if getPlayerStorageValue(cid, 20051) <= 0 then
				if getPlayerItemCount(cid, 6500) >= 100 then
					if doPlayerRemoveItem(cid, 6500, 100) then
						npcHandler:say("Muito Bom! Necromancer Shield. Item excelente.", cid)
						doPlayerAddItem(cid, 6433, 1)
						setPlayerStorageValue(cid, 20051, 1)
						npcHandler.topic[cid] = 0
					else
						doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
						npcHandler.topic[cid] = 0
					end
				else
					npcHandler:say("Você não tem todos os itens.", cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você já pegou o item.", cid)
				npcHandler.topic[cid] = 0
			end
		end

	elseif(msgcontains(msg, "no") and isInArray({1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79}, npcHandler.topic[cid])) then
		npcHandler:say("Ok then.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|. Eu posso te oferecer addons ou outfits, basta ter os itens necessários para isto. Para começar, {digite o nome da outfit}!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte logo!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Volte logo!")

keywordHandler:addKeyword({"legion helmet"}, StdModule.say, {npcHandler = npcHandler, text = "Você precisa esperar uma invasão de 'Rotworm Queen' para tentar a sorte e dropar esse item. Também é possível obtê-lo do 'Rotworm' mas a chance é muito pequena."})
keywordHandler:addKeyword({"elane's crossbow"}, StdModule.say, {npcHandler = npcHandler, text = "Você pode fazer a quest desse item na HUNT dos {'cults'}."})
keywordHandler:addAliasKeyword({"elane crossbow"})
keywordHandler:addAliasKeyword({"elanes crossbow"})
keywordHandler:addAliasKeyword({"elane"})
keywordHandler:addAliasKeyword({"elanes"})
keywordHandler:addAliasKeyword({"crossbow"})
keywordHandler:addKeyword({"mermaid comb"}, StdModule.say, {npcHandler = npcHandler, text = "Você pode fazer a quest desse item na HUNT das {'Sea Serpents'}."})
keywordHandler:addAliasKeyword({"mermaid"})
keywordHandler:addAliasKeyword({"comb"})
keywordHandler:addKeyword({"piece of royal steel"}, StdModule.say, {npcHandler = npcHandler, text = "Você precisa falar com o NPC {'A Sweaty Cyclops'} que fica localizado na sala de mineração."})
keywordHandler:addAliasKeyword({"piece of draconian steel"})
keywordHandler:addAliasKeyword({"piece of hell steel"})
keywordHandler:addAliasKeyword({"hell steel"})
keywordHandler:addAliasKeyword({"draconian steel"})
keywordHandler:addAliasKeyword({"royal steel"})
keywordHandler:addAliasKeyword({"huge chunk of crude iron"})
keywordHandler:addAliasKeyword({"huge chunk"})
keywordHandler:addAliasKeyword({"crude iron"})
keywordHandler:addKeyword({"empty vials"}, StdModule.say, {npcHandler = npcHandler, text = "Você pode obter {Lottery Ticket} com o NPC {'Dark Rodo'} em troca de vials ou flasks."})
keywordHandler:addAliasKeyword({"empty vial"})
keywordHandler:addAliasKeyword({"empty potion flask"})
keywordHandler:addAliasKeyword({"empty potion flasks"})
keywordHandler:addAliasKeyword({"lottery ticket"})
keywordHandler:addAliasKeyword({"winning lottery ticket"})
keywordHandler:addKeyword({"soul stone"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Necropharus'}"})
keywordHandler:addKeyword({"ferumbras' hat"}, StdModule.say, {npcHandler = npcHandler, text = "Você precisa esperar uma invasão de 'Ferumbras' para tentar a sorte e dropar esse item."})
keywordHandler:addAliasKeyword({"ferumbras hat"})
keywordHandler:addAliasKeyword({"ferumbras"})
keywordHandler:addAliasKeyword({"hat"})
keywordHandler:addKeyword({"ceiron's wolf tooth chain"}, StdModule.say, {npcHandler = npcHandler, text = "Você pode obter {ceiron's wolf tooth chain} em uma quest no acampamento dos ORC'S ao SUL da cidade."})
keywordHandler:addAliasKeyword({"ceirons wolf tooth chain"})
keywordHandler:addAliasKeyword({"wolf tooth chain"})
keywordHandler:addAliasKeyword({"wolf tooth"})
keywordHandler:addAliasKeyword({"ceirons wolf tooth"})
keywordHandler:addKeyword({"dragon claw"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Demodras'}"})
keywordHandler:addKeyword({"simon"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma quest: Ao sul da cidade, na hunt de hero."})
keywordHandler:addAliasKeyword({"simon the beggar's staff"})
keywordHandler:addAliasKeyword({"simon the beggar"})
keywordHandler:addAliasKeyword({"beggar staff"})
keywordHandler:addAliasKeyword({"beggar's staff"})
keywordHandler:addKeyword({"nose ring"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'The Horned Fox'}"})
keywordHandler:addKeyword({"heaven blossom"}, StdModule.say, {npcHandler = npcHandler, text = "É possível dropar esse item de {'elf's'}."})
keywordHandler:addKeyword({"mandrake"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Tiquandas Revenge'}"})
keywordHandler:addKeyword({"Ron the Ripper's Sabre"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Pirates'}. Essa task pode vir um dos quatro bosses (aleatório)."})
keywordHandler:addKeyword({"Deadeye Deviou's Eye Patch"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Pirates'}. Essa task pode vir um dos quatro bosses (aleatório)."})
keywordHandler:addKeyword({"Lethal Lissy's Shirt"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Pirates'}. Essa task pode vir um dos quatro bosses (aleatório)."})
keywordHandler:addKeyword({"Brutus Bloodbeard's Hat"}, StdModule.say, {npcHandler = npcHandler, text = "É possível obter esse item por meio de uma task especial: {'Pirates'}. Essa task pode vir um dos quatro bosses (aleatório)."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())