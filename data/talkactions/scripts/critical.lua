function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

	if param == "" then
		doPlayerPopupFYI(cid,"                                                        [+] Critical Skill [+]\n                                      # Critical melhorado para o servidor #\n\n\n                                                        .:: INFORMAÇÕES ::. \n\nO critical, ao ser ativado (30% de chance), aumenta o dano do seu personagem.\nO dano pode chegar até +20% no nível de CRITICAL máximo.\nCada Skill de critical aumenta seu dano em +0.2%.\n\nVocê pode comprar o Critical no NPC Event Seller ou Boss Seller.\nAo utilizar o item, você aumenta seu Critical Skill.\nVocê pode melhorar seu SKILL até o nível 100.\n\n\n Critical Skill: [".. getPlayerStorageValue(cid, 45821) .."/100].\n\n\n                                                        .::OBSERVAÇÃO::.\n\nAté o momento, o Critical funciona apenas em Players e no Training Dummy.\nEm breve estará funcionando em todos os monstros.")
		return true
	end
	return true
end