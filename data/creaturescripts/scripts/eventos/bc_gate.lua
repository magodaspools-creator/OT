function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	if getCreatureName(target) == "Bc Gate" and bit.band(flags, 1) == 1 then
		doCreateMonster("Dark Skull Soldier", {x=853,y=2203,z=8}, false, true);
		doCreateMonster("Magic Skeleton", {x=856,y=2203,z=8}, false, true);
		doCreateMonster("Dark Skull Soldier", {x=860,y=2202,z=8}, false, true);
		doCreateMonster("Red Skeleton Knight", {x=850,y=2199,z=8}, false, true);
		doCreateMonster("Dark Skull Soldier", {x=845,y=2197,z=8}, false, true);
		doCreateMonster("Giant Ogre", {x=855,y=2195,z=8}, false, true);
		doCreateMonster("Giant Ogre", {x=860,y=2193,z=8}, false, true);
		doCreateMonster("Magic Skeleton", {x=866,y=2197,z=8}, false, true);
		doCreateMonster("Giant Ogre", {x=867,y=2193,z=8}, false, true);
		doCreateMonster("Giant Ogre", {x=845,y=2191,z=8}, false, true);
		doCreateMonster("Red Skeleton Knight", {x=848,y=2187,z=8}, false, true);
		doCreateMonster("Red Skeleton Knight", {x=861,y=2187,z=8}, false, true);
	
		doCreateMonster("Archangel", {x=856,y=2185,z=8}, false, true);
	
		local portao1 = getTileItemById({x=854,y=2206,z=8}, 3523).uid
		local portao2 = getTileItemById({x=855,y=2206,z=8}, 3523).uid
		local portao3 = getTileItemById({x=857,y=2206,z=8}, 3523).uid
		local portao4 = getTileItemById({x=858,y=2206,z=8}, 3523).uid
	
		local portao5 = getTileItemById({x=854,y=2206,z=8}, 3525).uid
		local portao6 = getTileItemById({x=855,y=2206,z=8}, 3525).uid
		local portao7 = getTileItemById({x=857,y=2206,z=8}, 3525).uid
		local portao8 = getTileItemById({x=858,y=2206,z=8}, 3525).uid
		local portao9 = getTileItemById({x=859,y=2206,z=8}, 3526).uid
	
		local portao10 = getTileItemById({x=854,y=2206,z=8}, 3514).uid
		local portao11 = getTileItemById({x=855,y=2206,z=8}, 3514).uid
		local portao12 = getTileItemById({x=856,y=2206,z=8}, 3515).uid
		local portao13 = getTileItemById({x=857,y=2206,z=8}, 3514).uid
		local portao14 = getTileItemById({x=858,y=2206,z=8}, 3514).uid
		local portao15 = getTileItemById({x=859,y=2206,z=8}, 3514).uid
		if portao1 > 0 and portao2 > 0 and portao3 > 0 and portao4 > 0 then
			doRemoveItem(portao1, 1)
			doRemoveItem(portao2, 1)
			doRemoveItem(portao3, 1)
			doRemoveItem(portao4, 1)
		end
		if portao5 > 0 and portao6 > 0 and portao7 > 0 and portao8 > 0 and portao9 > 0 then
			doRemoveItem(portao5, 1)
			doRemoveItem(portao6, 1)
			doRemoveItem(portao7, 1)
			doRemoveItem(portao8, 1)
			doRemoveItem(portao9, 1)
		end
		if portao10 > 0 and portao11 > 0 and portao12 > 0 and portao13 > 0 and portao14 > 0 and portao15 > 0 then 
			doRemoveItem(portao10, 1)
			doRemoveItem(portao11, 1)
			doRemoveItem(portao12, 1)
			doRemoveItem(portao13, 1)
			doRemoveItem(portao14, 1)
			doRemoveItem(portao15, 1)
		end
	
		doSendMagicEffect({x=854,y=2206,z=8}, 67)
		doSendMagicEffect({x=855,y=2206,z=8}, 67)
		doSendMagicEffect({x=856,y=2206,z=8}, 67)
		doSendMagicEffect({x=857,y=2206,z=8}, 67)
		doSendMagicEffect({x=858,y=2206,z=8}, 67)
		doSendMagicEffect({x=859,y=2206,z=8}, 67)
		doBroadcastMessage("[Blood Castle] O jogador ".. getPlayerName(cid) .." deu o último dano no portão. O portão foi destruido e o Archangel surgiu!")
	end
	return true
end