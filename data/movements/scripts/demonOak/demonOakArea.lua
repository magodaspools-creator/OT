function onStepIn(cid, item, position, fromPosition)
 if isPlayer(cid) and math.random(1, 30) == 1 then
  doTargetCombatHealth(0, cid, DOAK_DANO_ARENA.TIPO, -DOAK_DANO_ARENA.MINIMO, -DOAK_DANO_ARENA.MAXIMO, DOAK_DANO_ARENA.EFEITO)
 end
 return true
end