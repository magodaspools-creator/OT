-- POSIÇÕES IMPORTANTES
SBW_AREA = {{x = 478, y = 178, z = 7}, {x = 524, y = 223, z = 7}}-- AREA DO EVENTO | Canto superior esquerdo / inferior direito
SBW_WAITROOM = {{x = 498, y = 197, z = 6}, {x = 504, y = 203, z = 6}} -- AREA DE ESPERA | Canto superior esquerdo / inferior direito
SBW_TP = {x = 297, y = 114, z = 8} -- local onde teleport sera criado (entrada de jogadores)
SBW_TPGO = {x = 501, y = 200, z = 6} -- local onde teleport vai levar (saida de jogadores)
SBW_TPEND = {x = 2052, y = 2051, z = 7} -- local onde serao teleport ao final do evento
SBW_GERADOR = {x = 501, y = 200, z = 7} -- local onde gerador vai ficar

-- CONFIGURAÇÕES DO EVENTO
SBW_DAYS = {1,2,3,4,5,6,7} -- dias de semana que vai abrir
SBW_DURATION = 10 -- duração do evento em minutos
SBW_POINTSKILL = 1 -- pontos de jogo por morte
SBW_AMMOBUY = 10 -- quantia de munições compradas por cada ponto
SBW_MINAMMO = 30 -- munição inicial dos jogadores
SBW_TIMEWAIT = 3 -- tempo na sala de espera em minutos
SBW_AMMOINFI = false
SBW_LOSTSCORE = true
SBW_RANDOMIZE = true
SBW_RESETAMMO = true
SBW_STARTAUTO = true
SBW_USEWAIT = true

--PREMIO DO EVENTO
SBW_ADDREWARD = true
SBW_REWARDS = {
				{2160,10},
				{12686,1}
			}


-- // Não mexa daqui para baixo
SBW_TFS = "0.4" 

-- STORAGES
SBW_EXAUSTHED = 45387 
SBW_INEVENT = 45388 
SBW_SCORE = 45389
SBW_AMMO = 45390


SBW_WALLSID = {5324,7003,7021,6712,7023,7002,6713,6714,6869,6822,6823,6824,6825,6826,6827,6828,6829,6830,6831,6832,6833,6707,6708,6709,6710,6711,2698,2697,7020,6719,6720,6721,6722,6723,6724,6725,6726,6727,6761,6762,6768,6769,4608,4609,4610,4611,4612,4613,4614,4615,4616,4617,4618,4619,4620,4621,4622,4623,4624,4625,4664,4665,4666,7008,7009,7010,7011,8239,7004,7005,7006,7007,6627,6628,6629,6630,6631,6632,6633,6634,6635,6636,6637,6638,7022}
SBW_BALLSPEED = 160
SBW_SHOOTEXAUSTHED = 1000
SBW_SHOOTDIR = 0                             
SBW_STATUS = 'on' 

-- MENSAGENS
SBW_MSGWARNING = "[SNOWBALL WAR] Abriu o teleport de ingresso para o evento. Para participar, se dirija até a sala de Eventos."
SBW_MSGSTART = "[SNOWBALL WAR] O teleport foi removido e o evento foi iniciado. Boa sorte a todos os participantes!"

