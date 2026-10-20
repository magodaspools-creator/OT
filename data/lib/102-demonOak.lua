DOAK_HALLOWEDAXE_PRICE = 20000
DOAK_IDHALLOWEDAXE = 8293
DOAK_IDAXE = 2386
DOAK_IDDEADTREE = 2709
DOAK_IDTELEPORTE = 1387
DOAK_BLOCKINGTREE = {[DOAK_IDDEADTREE] = {45288, 3612}}
DOAK_IDMONSTRO = {8288, 8289, 8290, 8291}
DOAK_PREMIOS = {
 [45291] = {IDPREMIO = 2495, QTD = 1},
 [45292] = {IDPREMIO = 8905, QTD = 1},
 [45293] = {IDPREMIO = 8851, QTD = 1},
 [45294] = {IDPREMIO = 8918, QTD = 1}
}

DOAK_LEVEL = 120
DOAK_TIME_REVIVE = 1

DOAK_PISO = 1
DOAK_DANO = 2
DOAK_WAVES = 11

ERROR_NOERROR = 0
ERROR_TREEPOSITION = 1
ERROR_NOTENOUGHLEVEL = 2
ERROR_ALREADYDONE = 3
ERROR_ALREADYCUT = 4
ERROR_PLAYERINAREA = 5
ERROR_MISSINGINFO = 6

TYPE_PLAYER = 1
TYPE_MONSTER = 2
TYPE_NPC = 3
TYPE_ALL = 4

GET_COUNT = 1
GET_UID = 2

DISTRO_VERSION = 040

DOAK_ONE_IN_ARENA = true

DOAK_FALANTE = true
DOAK_FALANTE_TIME = 60*1000
DOAK_FALANTE_CHANCE = 25

DOAK_STORAGE = {
 FINALIZACAO = 45295,
 ARVORE = 45296,
 PREMIO = 45297,
 MORTE = 45298
}

DOAK_DANO_ARENA = {
 MINIMO = 200,
 MAXIMO = 300,
 TIPO = COMBAT_EARTHDAMAGE,
 EFEITO = CONST_ME_BIGPLANTS
}

DOAK_ROSTO = {x = 844, y = 2135, z = 7}
DOAK_DIREITA = {x = 846, y = 2134, z = 7}
DOAK_ESQUERDA = {x = 842, y = 2134, z = 7}
DOAK_PASSARO = {x = 844, y = 2132, z = 7}
DOAK_LOCAL_TELEPORTE = {x = 842, y = 2128, z = 7}
DOAK_LOCAL_SAIDA = {x = 825, y = 2128, z = 7}
DOAK_SALA_PREMIO = {x = 843, y = 2136, z = 8}

DOAK_MONSTROS = {
 [1] = {"demon oak", "grim Reaper", "elder beholder oak", "demon skeleton"},
 [2] = {"dark torturer", "banshee", "betrayed wraith", "blightwalker"},
 [3] = {"bonebeast", "braindeath oak", "diabolic imp", "giant spider oak"},
 [4] = {"hand of cursed fate", "lich oak", "undead dragon", "vampire"},
 [5] = {"braindeath oak", "demon oak", "bonebeast", "diabolic imp"},
 [6] = {"demon skeleton", "banshee", "elder beholder oak", "bonebeast"},
 [7] = {"dark torturer", "undead dragon", "demon oak", "demon oak"},
 [8] = {"elder beholder oak", "betrayed wraith", "demon skeleton", "giant spider oak"},
 [9] = {"demon oak", "banshee", "blightwalker", "demon skeleton"},
 [10] = {"grim reaper", "demon oak", "diabolic imp", "braindeath oak"},
 [11] = {"banshee", "grim reaper", "hand of cursed fate", "demon oak"}
}

DOAK_LOCAL_QUEST = {
 {x = 835, y = 2128, z = 7, stackpos = 255},
 {x = 853, y = 2140, z = 7, stackpos = 255}
}

DOAK_LOCAL_QUESTS = {
 {x = 838, y = 2130, z = 7},
 {x = 844, y = 2130, z = 7},
 {x = 850, y = 2131, z = 7},
 {x = 850, y = 2134, z = 7},
 {x = 849, y = 2138, z = 7},
 {x = 844, y = 2138, z = 7},
 {x = 840, y = 2138, z = 7},
 {x = 837, y = 2135, z = 7}
}

DOAK_SOUNDS = {
 [DOAK_PISO] = {
	"Release me and you will be rewarded greatefully!",
	"What is this? Demon Legs lying here? Someone might have lost them!",
	"I'm trapped, come here and free me fast!!",
	"I can bring your beloved back from the dead, just release me!",
	"What a nice shiny golden armor. Come to me and you can have it!",
	"Find a way in here and release me! Pleeeease hurry!",
	"You can have my demon set, if you help me get out of here!"
 },
 [DOAK_DANO] = {
	"MY ROOTS ARE SHARP AS A SCYTHE! FEEL IT?!?",
	"CURSE YOU!",
	"RISE, MINIONS, RISE FROM THE DEAD!!!!",
	"AHHHH! YOUR BLOOD MAKES ME STRONG!",
	"GET THE BONES, HELLHOUND! GET THEM!!",
	"GET THERE WHERE I CAN REACH YOU!!!",
	"ETERNAL PAIN AWAITS YOU! NICE REWARD, HUH?!?!",
	"YOU ARE GOING TO PAY FOR EACH HIT WITH DECADES OF TORTURE!!",
	"ARGG! TORTURE IT!! KILL IT SLOWLY MY MINION!!"
 }
}

function cortarArvoreDemonOak(jogador, item, posicao)
 local verificacao = podeEntrarDemonOak(jogador)

 doSendMagicEffect(posicao, CONST_ME_POFF)
 if verificacao ~= ERROR_NOERROR then
  return doPlayerSendCancel(jogador, pegaErro(verificacao))
 end
 
 if (getGlobalStorageValue(cid, DOAK_STORAGE.MORTE) > os.time()) then
  return doPlayerSendCancel(jogador, "O Demon Oak está morto. Espere ".. DOAK_TIME_REVIVE .." minuto(s) até ele renascer.")
 else
 doTransformItem(item.uid, DOAK_BLOCKINGTREE[item.itemid][2])
 doMoveCreature(jogador, getDirectionTo(getCreaturePosition(jogador), posicao))
 end
end

function criarArvoreDemonOak(jogador, item)
 doTransformItem(item.uid, DOAK_IDDEADTREE)
	
 local direcao = getCreatureLookDirection(jogador)
 if (direcao == SOUTH) then
  doPlayerSetStorageValue(jogador, DOAK_STORAGE.ARVORE, 1)
  doCreatureSay(jogador, "ESTAVA ESPERANDO POR VOCÊ!", TALKTYPE_MONSTER_YELL, false, jogador, DOAK_ROSTO)
 end
end

function batendoDemonOak(jogador, item, posicao)
 local estagio = getPlayerStorageValue(jogador, item.itemid)
 if estagio == -1 then 
  doPlayerSetStorageValue(jogador, item.itemid, 1)
 end
	
 local totalParteDemonOakDanificado = 0
 for i = DOAK_IDMONSTRO[1], DOAK_IDMONSTRO[#DOAK_IDMONSTRO] do
  if(getPlayerStorageValue(jogador, i) == (DOAK_WAVES and DOAK_WAVES > 0 and DOAK_WAVES or #DOAK_MONSTROS) + 1) then
   totalParteDemonOakDanificado = totalParteDemonOakDanificado + 1
  end
 end
	
 if DOAK_ONE_IN_ARENA or totalParteDemonOakDanificado == #DOAK_IDMONSTRO then
  if getCreaturesInQuestArea(TYPE_MONSTER, DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2], GET_COUNT) > 0 then
   doPlayerSendTextMessage(jogador, MESSAGE_INFO_DESCR, "Você precisa derrotar todos os monstros primeiro.")
   doSendMagicEffect(posicao, CONST_ME_POFF)
   return true
  end
 end
	
 if(totalParteDemonOakDanificado == #DOAK_IDMONSTRO) then
  deathDemonOak(jogador)
  
  return true
 end

 if getPlayerStorageValue(jogador, item.itemid) >= (DOAK_WAVES and DOAK_WAVES > 0 and DOAK_WAVES or #DOAK_MONSTROS) + 1 then
  return doSendMagicEffect(posicao, CONST_ME_POFF)
 end
	
 if math.random(10) > 3 then
  doTargetCombatHealth(0, jogador, DOAK_DANO_ARENA.TIPO, -DOAK_DANO_ARENA.MINIMO, -DOAK_DANO_ARENA.MAXIMO, DOAK_DANO_ARENA.EFEITO)
  doCreatureSay(jogador, "-krrrrak-", TALKTYPE_MONSTER_YELL, false, jogador, getThingPos(item.uid))
  doSendMagicEffect(posicao, CONST_ME_DRAWBLOOD)
  return true
 end

 local deny = false
 if DOAK_MONSTROS[estagio] then
  local b = 500
  for i = 1, #DOAK_MONSTROS[estagio] do
   local sPos = DOAK_LOCAL_QUESTS[math.random(#DOAK_LOCAL_QUESTS)]
   local thing = getTopCreature(sPos)
   local area
   if isMonster(thing.uid) then
    area = getArea(sPos, 1, 1)
    for _, pos in ipairs(area) do
     if isCreature(getTopCreature(pos).uid) or not isInRange(pos, DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2]) then
      deny = true
      break
     else
      addEvent(doCreateMonster, b,DOAK_MONSTROS[estagio][i], pos, false, true)
      break
     end
    end
   else
    addEvent(doCreateMonster, b,DOAK_MONSTROS[estagio][i], sPos, false, true)
   end
   b=b+500
  end
  if not deny then
   doPlayerSetStorageValue(jogador, item.itemid, estagio+1)
  end

  if isLastCut(jogador) then
   doCreatureSay(jogador, "HOW IS THAT POSSIBLE?!? MY MASTER WILL CRUSH YOU!! AHRRGGG!", TALKTYPE_MONSTER_YELL, false, jogador, DOAK_ROSTO)
  else
   doCreatureSay(jogador, DOAK_SOUNDS[DOAK_DANO][math.random(#DOAK_SOUNDS[DOAK_DANO])], TALKTYPE_MONSTER_YELL, false, jogador, DOAK_ROSTO)
  end
	
  if math.random(100) >= 30 then
   doTargetCombatHealth(0, jogador, DOAK_DANO_ARENA.TIPO, -DOAK_DANO_ARENA.MINIMO, -DOAK_DANO_ARENA.MAXIMO, DOAK_DANO_ARENA.EFEITO)
  end

  doSendMagicEffect(posicao, CONST_ME_DRAWBLOOD)
 end
end

function hallowedAxeDemonOak(jogador, item, posicao)
 if DOAK_BLOCKINGTREE[item.itemid] and item.actionid == DOAK_BLOCKINGTREE[item.itemid][1] then
  cortarArvoreDemonOak(jogador, item, posicao)
 elseif isInArray(DOAK_IDMONSTRO, item.itemid) then
  batendoDemonOak(jogador, item, posicao)
 end
end

function covaDemonOak(cid)
 if getPlayerStorageValue(cid, DOAK_STORAGE.FINALIZACAO) > 1 and getPlayerStorageValue(cid, DOAK_STORAGE.PREMIO) < 1 then
  doTeleportThing(cid, DOAK_SALA_PREMIO)
  doSendMagicEffect(DOAK_SALA_PREMIO, 10)
 end
end

function premioDemonOak(cid, item)
 if DOAK_PREMIOS[item.uid] then
  local premio = DOAK_PREMIOS[item.uid]
  if(getPlayerStorageValue(cid, DOAK_STORAGE.PREMIO) < 1) then
   doCreatureSetStorage(cid, DOAK_STORAGE.PREMIO, 1)

   doPlayerAddItem(cid, premio.IDPREMIO, premio.QTD)
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu "..premio.QTD.." " .. getItemNameById(premio.IDPREMIO) .. ".")			
   return true
  else
   return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já pegou sua recompensa.")
  end
 end
end

function podeEntrarDemonOak(cid)
 if type(DOAK_LOCAL_QUEST) == "table" and type(DOAK_LOCAL_QUEST[1]) == "table" and type(DOAK_LOCAL_QUEST[2]) == "table" and DOAK_LEVEL and type(DOAK_STORAGE) == "table" then
  if getPlayerLevel(cid) < DOAK_LEVEL then
   return ERROR_NOTENOUGHLEVEL
  elseif getPlayerStorageValue(cid, DOAK_STORAGE.FINALIZACAO) > 0 then
   return ERROR_ALREADYDONE
  elseif getPlayerStorageValue(cid, DOAK_STORAGE.ARVORE) > 0 then
   return ERROR_ALREADYCUT
  elseif DOAK_ONE_IN_ARENA then
   if getCreaturesInQuestArea(TYPE_PLAYER, DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2], GET_COUNT) > 0 then
    return ERROR_PLAYERINAREA
   end
  end
 else
  return ERROR_MISSINGINFO
 end
 return ERROR_NOERROR
end

function getCreaturesInQuestArea(type, fromPos, toPos, get, countSummon)
 local types = {
	[TYPE_PLAYER] = isPlayer,
	[TYPE_MONSTER] = isMonster,
	[TYPE_NPC] = isNpc,
	[TYPE_ALL] = isCreature
}
 local tmp = {}
 local t = types[type]
 if not t then
  return print("[!] --> [Warning - Function::getCreaturesInQuestArea] Unknow type " .. (type or "(nil value)"))
 end
 local thing
 local pos
 for x = fromPos.x, toPos.x do
  for y = fromPos.y, toPos.y do
   for z = fromPos.z, toPos.z do
    pos = {x = x, y = y, z = z}
    thing = getTopCreature(pos)
    if t(thing.uid) then
     table.insert(tmp, thing.uid)
     if not countSummon and isSummon(thing.uid) then
      for i = 1, #tmp do
       if tmp == thing.uid then
        table.remove(tmp, i)
        break
       end
      end
     end
    end
   end
  end
 end
 return (get == GET_COUNT and #tmp or get == GET_UID and tmp or print("[Warning - Function::getCreaturesInQuestArea] Unknow type to get " .. (get or "(nil value)")))
end

function isLastCut(cid)
 local k, s = 0, 0
 if not DOAK_IDMONSTRO or type(DOAK_IDMONSTRO) ~= "table" then
  return false
 end
 for i = DOAK_IDMONSTRO[1], DOAK_IDMONSTRO[#DOAK_IDMONSTRO] do
  if getPlayerStorageValue(cid, i) == #DOAK_MONSTROS + 1 then
   k = k + 1
  end
  if getPlayerStorageValue(cid, i) == #DOAK_MONSTROS then
   s = s + 1
  end
 end
 return (k == 3 and s == 1 and true or false)
end

function removeMonsterDemonOak(oak_fromPos, oak_toPos,oak_checkFunction)
-- local width = (math.max(DOAK_LOCAL_QUEST[1].x, DOAK_LOCAL_QUEST[2].x) - math.min(DOAK_LOCAL_QUEST[1].x, DOAK_LOCAL_QUEST[2].x)) / 2 + 1
-- local height = (math.max(DOAK_LOCAL_QUEST[1].y, DOAK_LOCAL_QUEST[2].y) - math.min(DOAK_LOCAL_QUEST[1].y, DOAK_LOCAL_QUEST[2].y)) / 2 + 1
-- local centerPos = {x=math.min(DOAK_LOCAL_QUEST[1].x, DOAK_LOCAL_QUEST[2].x)+width,y=math.min(DOAK_LOCAL_QUEST[1].y, DOAK_LOCAL_QUEST[2].y)+height,z=DOAK_LOCAL_QUEST[1].z}
-- for z = math.min(DOAK_LOCAL_QUEST[1].z, DOAK_LOCAL_QUEST[2].z), math.max(DOAK_LOCAL_QUEST[1].z, DOAK_LOCAL_QUEST[2].z) do
--  centerPos.z = z
--  for i, uid in pairs(getSpectators(centerPos, width, height, false)) do
--   if(isMonster(uid)) then
--    doRemoveCreature(uid)
--   else
--	return false
--   end
--  end
-- end
--end
    local m_oak_count = {};
    oak_checkFunction = oak_checkFunction or function(arg) return true; end;
    for oakx = oak_fromPos.x, oak_toPos.x do
        for oaky = oak_fromPos.y, oak_toPos.y do
            for oakz = oak_fromPos.z, oak_toPos.z do
                local oak_tmp = getTopCreature({x=oakx,y=oaky,z=oakz}).uid;
                if(oak_checkFunction(oak_tmp))then
                    table.insert(m_oak_count, oak_tmp);
                end
            end
        end
    end
    local oak_tmp = getTopCreature({x = 849, y = 2140, z = 7}).uid;
    if(oak_checkFunction(oak_tmp))then
        table.insert(m_oak_count, oak_tmp);
    end
    return m_oak_count;
end

function removeDemonOak()
 local demonOakR = getTileItemById(DOAK_DIREITA, DOAK_IDMONSTRO[3])
 local demonOakL = getTileItemById(DOAK_ESQUERDA, DOAK_IDMONSTRO[2])
 if demonOakR.uid > 0 and demonOakL.uid > 0 then
  doRemoveItem(demonOakR.uid, 1)
  doRemoveItem(demonOakL.uid, 1)
		
  doSendMagicEffect(DOAK_DIREITA, CONST_ME_POFF)
  doSendMagicEffect(DOAK_ESQUERDA, CONST_ME_POFF)
  doSendMagicEffect(DOAK_PASSARO, CONST_ME_POFF)
		
  addEvent(doCreateItem, DOAK_TIME_REVIVE*60*1000,DOAK_IDMONSTRO[3], 1, DOAK_DIREITA)
  addEvent(doCreateItem, DOAK_TIME_REVIVE*60*1000,DOAK_IDMONSTRO[2], 1, DOAK_ESQUERDA)
 end
 return true
end

function deathDemonOak(cid)
 if (getGlobalStorageValue(cid, DOAK_STORAGE.MORTE) > os.time()) then
  return doPlayerSendCancel(cid, "O Demon Oak está morto. Espere ".. DOAK_TIME_REVIVE .." minuto(s) até ele renascer.")
 end
 setPlayerStorageValue(cid, DOAK_STORAGE.FINALIZACAO, 1)
 setGlobalStorageValue(cid, DOAK_STORAGE.MORTE, os.time()+DOAK_TIME_REVIVE*60)
 addEvent(removeDemonOak, 500)

 doCreatureSay(cid, "I'M DEAD!!!", TALKTYPE_MONSTER_YELL, false, cid, DOAK_ROSTO)

 doTeleportThing(cid, DOAK_LOCAL_SAIDA)
 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Fale com Oldrak sobre sua vitória contra o Demon Oak.")

 return true
end

function isSummon(cid)
 if DISTRO_VERSION < 040 then
  return getCreatureMaster(cid) ~= cid or false
 else
  return getCreatureMaster(cid) ~= nil or false
 end
end

function pegaErro(data)
 if data == ERROR_NOTENOUGHLEVEL then
  return "Você precisa ter level " .. DOAK_LEVEL .. " ou maior para entrar na Demon Oak."
 elseif data == ERROR_ALREADYDONE then
  return "Você já fez a Demon Oak."
 elseif data == ERROR_ALREADYCUT then
  return "Você não pode usar o hallowed axe nesta árvore."
 elseif data == ERROR_PLAYERINAREA then
  return "Espere o outro jogador sair da Demon Oak para que você possa entrar."
 elseif data == ERROR_MISSINGINFO then
  return "Sorry, not possible."
 end
 return ""
end

function demonoakSay()
 if getGameState() == GAMESTATE_NORMAL then
  if math.random(100) <= DOAK_FALANTE_CHANCE then
   local rangeX, rangeY = getDistanceBetween(DOAK_ROSTO, DOAK_LOCAL_QUEST[1])+5, getDistanceBetween(DOAK_ROSTO, DOAK_LOCAL_QUEST[2])+5
   local list = getSpectators(DOAK_ROSTO, rangeX, rangeY)
   if list and #list > 0 then
    for _, uid in ipairs(list) do
     if isPlayer(uid) and not isInArea(getCreaturePosition(uid), DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2]) and getCreaturesInQuestArea(TYPE_PLAYER, DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2], GET_COUNT) == 0 then
      doCreatureSay(uid, DOAK_SOUNDS[DOAK_PISO][math.random(#DOAK_SOUNDS[DOAK_PISO])], TALKTYPE_MONSTER_YELL, false, uid, DOAK_ROSTO)
     end
    end
   end
  end
 end
 addEvent(demonoakSay, DOAK_FALANTE_TIME)
end

if DOAK_FALANTE then
 demonoakSay()
end