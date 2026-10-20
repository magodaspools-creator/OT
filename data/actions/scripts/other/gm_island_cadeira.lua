-- Config << --
local cadeira = {x=1986, y=2004, z=8, stackpos=255}
local lever = {x=1985, y=2004, z=8}
local dano = 5 -- por porcentagem

-- Main function.
function onUse(cid, item, fromPosition, itemEx, toPosition)

	local health = getCreatureMaxHealth(cid)
	local player = getThingfromPos(cadeira)
	local localdano = getTopCreature(cadeira)
    if (item.itemid == 1945) and getPlayerAccess(cid) > 3 then
		if isPlayer(player.uid) then
			doSendMagicEffect(cadeira, CONST_ME_ENERGYHIT)
			doCreatureAddHealth(localdano.uid, -((health / 100) * dano))
			doSendAnimatedText(cadeira, "-"..dano.."% HP", COLOR_RED)
			doTransformItem(item.uid, item.itemid + 1)
		else
			doSendMagicEffect(cadeira, CONST_ME_POFF)
			doTransformItem(item.uid, item.itemid + 1)
		end

    elseif (item.itemid == 1946) and getPlayerAccess(cid) > 3 then
		doSendAnimatedText(lever, "*KREEEEK*", COLOR_ORANGE)
        doTransformItem(item.uid, item.itemid - 1)
	else
		doPlayerSendCancel(cid, "You do not have access to this.")
    end
    return TRUE
end