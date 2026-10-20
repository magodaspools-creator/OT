function onAttack(cid, target)
 if not isPlayer(cid) or not isMonster(target) then
  return true
 end
 if not isInRange(getCreaturePosition(cid), DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2]) and isInRange(getCreaturePosition(target), DOAK_LOCAL_QUEST[1], DOAK_LOCAL_QUEST[2]) then
   return false
 end
 return true
end