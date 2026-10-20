local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
 
function onCastSpell(cid, var)
    local pos = variantToPosition(var)
	local block_area = {
	{{x=248,y=102,z=9}, {x=280,y=134,z=9}}, -- pos começo e final da área
	{{x=408,y=39,z=9}, {x=539,y=99,z=9}},
	{{x=930,y=2293,z=8}, {x=948,y=2308,z=8}}
	}
	
	for _, var in ipairs(block_area) do
		if isInRange(getCreaturePosition(cid), var[1], var[2]) then
			doPlayerSendCancel(cid, "Você não pode jogar magic wall nesta área.")
			return false
		end
	end
	
    if getTileInfo(getThingPos(cid)).protection then
        return not doPlayerSendDefaultCancel(cid, RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE)
    else
        local s = getTileInfo(pos)
        if s.protection then
            return doPlayerSendDefaultCancel(cid, RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE), false
        elseif s.nopvp then
            return doPlayerSendCancel(cid, 'Sorry, you cannot use this here.'), false
        end
    end
 
    local v = getTileItemByType(pos, ITEM_TYPE_MAGICFIELD).uid
	local f = {1505, 1506, 1507, 1508, 12720, 12721, 12722, 12725, 12851, 12852, 12853}
    for i = 1, 11 do
		if getTileItemById(pos, f[i]).uid > 0 then 
			return doPlayerSendCancel(cid, 'Sorry, you cannot use this here.'), false
		end
	end
	
	if v ~= 0 then
        doRemoveItem(v)
    end
 
    v = doCreateItemEx(1497)
    if doTileAddItemEx(pos, v) and getTileItemByType(pos, ITEM_TYPE_MAGICFIELD).uid ~= 0 then
        doItemSetAttribute(v, "description", "By: " .. getCreatureName(cid))
        doDecayItem(v)	
        return doCombat(cid, combat, var)
    else
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHROOM), false
    end
end