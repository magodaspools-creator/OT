local c = {
  daily = "no", -- Permitir apenas 1 entrada por dia
  withEffects = "yes", -- Permitir Efeitos
  onlyOnce = "yes", -- Permitir apenas 1x a entrada de um player (se ele terminar a quest, não pode entrar)
  anniStor = 42229, -- Se onlyOnce for "yes" isto salvará o storage. Tem q ser o msm ID dos baús.
  level = 100, -- player level
  tempAid = 42226, -- Isto salvará o storage na porta e piso. Tem que ser diferente da anniStor e alavanca.
  mob = "Demon", -- monster name
  customMobs = "no", -- Sim para mobs aleatorios
  normalMap = "no", -- Não mecha aqui. Risco de BUG
  test = "no", -- Coloque Yes caso queira testar com apenas 1 player ^^
  fightTime = 5, -- Em minutos. Quanto tempo os players podem ficar na sala dos demons
  exhaustion = 10, -- Em segundos. Exaust da alavanca
  exhaustionStor = 42230, -- Salva storage do exaust da alavanca
  entry = {
    {x=2084, y=2115, z=9}, -- 1 player, The first position just behind switch!
    {x=2083, y=2115, z=9},
    {x=2082, y=2115, z=9},
    {x=2081, y=2115, z=9}
  },
  des = {
    {x=2080, y=2117, z=10}, -- 1 player
    {x=2081, y=2117, z=10},
    {x=2082, y=2117, z=10},
    {x=2083, y=2117, z=10}
  },
  mobPos = { -- you cann ignore this if you have 'normalMap = "yes"'
    {x=2080, y=2115, z=10},
    {x=2079, y=2117, z=10}, -- here position opposite 1
    {x=2078, y=2117, z=10}, -- here position opposite 2
    {x=2082, y=2115, z=10},
    {x=2081, y=2119, z=10},
    {x=2083, y=2119, z=10}
  },
  customMobName = { -- you cann ignore this if you have 'customMobs = "no"'
    "Rat",
    "Rat",
    "Cave Rat", -- where position opposite 1
    "Cave Rat", -- where position opposite 2
    "Rat",
    "Rat"
  }
}
 
c.daily = getBooleanFromString(c.daily)
c.withEffects = getBooleanFromString(c.withEffects)
c.onlyOnce = getBooleanFromString(c.onlyOnce)
c.customMobs = getBooleanFromString(c.customMobs)
c.normalMap = getBooleanFromString(c.normalMap)
c.test = getBooleanFromString(c.test)
local anniEvent = 0
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
  if(item.itemid == 1946) then
    if(not c.daily) or c.test then
      doTransformItem(item.uid, 1945)
    else
      doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end
    return true
  end
  if(item.itemid ~= 1945) then return true end
  if(exhaustion.check(cid, c.exhaustionStor)) then doPlayerSendCancel(cid, "This is exhausted.") return true end
  exhaustion.set(cid, c.exhaustionStor, c.exhaustion)
 
  local fighter = {}
  fighter = getSpectators(c.des[1], 3, 3)
  if fighter ~= nil then
    for _, pid in ipairs(fighter) do
      if isPlayer(pid) then
        if(c.withEffects) then
          doCreatureSay(cid, "Halo! Halo!\nWe are still fighting here!", TALKTYPE_MONSTER, nil, cid, c.des[1])
        end
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
      end
    end
    for _, pid in ipairs(fighter) do
      if isCreature(pid) then
        doRemoveCreature(pid)
      end
    end
  end
 
  if(anniEvent ~= 0) then stopEvent(anniEvent) end
  local players = {}
  for _, position in ipairs(c.entry) do
    local pid = getTopCreature(position).uid
 
    if(pid == 0 or not isPlayer(pid) or getPlayerLevel(pid) < c.level) then
      if(c.withEffects) then
        doCreatureSay(cid, "Need a player with lvl "..c.level, TALKTYPE_MONSTER, nil)
        doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
      end
      return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    elseif(c.onlyOnce and getCreatureStorage(pid, c.anniStor) > 0) then
      if(c.withEffects) then
        doCreatureSay(cid, "That fighter\ncan't do anni again.", TALKTYPE_MONSTER, nil)
        doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
      end
      return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end
    table.insert(players, pid)
    if c.test then break end
  end
 
  if normalMap then
    local zmienne = {{'-3','-2'}, {'-1','-2'}, {'-2','2'}, {'0','2'}, {'1','0'}, {'2','0'}} -- horizontally
    for i, pos in ipairs(zmienne) do
      c.mobPos = c.des[1]
      c.mobPos.x = c.mobPos.x + tonumber(pos[1])
      c.mobPos.y = c.mobPos.y + tonumber(pos[2])
      doCreateMonster(c.customMobs and c.customMobName or c.mob, c.mobPos)
    end
  else
    for i, pos in ipairs(c.mobPos) do
      doCreateMonster(c.customMobs and c.customMobName or c.mob, pos)
    end
  end

  for i, pid in ipairs(players) do
    doSendMagicEffect(c.entry[i], CONST_ME_POFF)
    doTeleportThing(pid, c.des[i], false)
    doSendMagicEffect(c.des[i], CONST_ME_ENERGYAREA)
    doCreatureSetStorage(pid, c.tempAid, 1)
    if c.test then break end
  end
  doTransformItem(item.uid, 1946)
 
  anniEvent = addEvent(function(players)
    for i, pid in ipairs(players) do
	if (not isPlayer(cid)) then return false end
      if getCreatureStorage(pid, c.tempAid) == 1 then
        doCreatureSetStorage(pid, c.tempAid, -1)
        doRemoveCondition(pid, CONDITION_INFIGHT)
        local pos = getClosestFreeTile(cid, c.entry[i], false, false)
        pos.y = pos.y +1
        doTeleportThing(pid, pos, false)
        doSendMagicEffect(getThingPosition(pid), CONST_ME_TELEPORT)
        doCreatureSay(pid, "Time is up!", TALKTYPE_MONSTER)
      end
    end
    doTransformItem(item.uid, 1945)
  end, c.fightTime*60*1000, players)
 
  return true
end