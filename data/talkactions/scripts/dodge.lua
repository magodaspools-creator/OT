function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

	if param == "" then
		doPlayerPopupFYI(cid,"                                                                     [+] Dodge Skill [+]\n                                                  # Dodge modificado para o servidor #\n\n\n                                                                     .:: INFORMAÇÕES ::. \n\nO dodge faz você se esquivar de algum hit ou spell, recebendo menos dano.\nAo ser ativado (30% de chance), o jogador recebe dano reduzido de acordo com seu status:\n\nCom Utamo Vita = 20% dano reduzido. (No nível de DODGE máximo)\nSem Utamo Vita = 40% dano reduzido. (No nível de DODGE máximo)\n\nVocê pode comprar o Dodge no NPC Event Seller ou Boss Seller.\nAo utilizar o item, você aumenta seu Dodge Skill.\nVocê pode melhorar seu SKILL até o nível 100.\n\n\n Dodge Skill: [".. getPlayerStorageValue(cid, 45820) .."/100].")
		return true
	end
	return true
end