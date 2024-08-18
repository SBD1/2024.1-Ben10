-- =========================================== MISSÃO ===================================================

-- Consultar os detalhes de todas as missões associadas a um determinado NPC
SELECT m.id_missao, m.nome_missao, m.experiencia, m.descricao, m.recompensa_em_moedas
FROM npc gdm
JOIN missao m ON gdm.id_missao_associada = m.id_missao;

-- SELECIONANDO MISSÕES CONCLUÍDAS PELO PERSONAGEM
SELECT p.id_personagem, rdm.id_missao, rdm.status
FROM personagem p
JOIN registro_da_missao rdm ON p.id_personagem = rdm.id_personagem
WHERE rdm.status ='completa';

-- SELECIONANDO MISSÕES QUE O PERSONAGEM AINDA NÃO FEZ
SELECT m.id_missao
FROM missao m
EXCEPT
SELECT rdm.id_missao
FROM registro_da_missao rdm
JOIN personagem p ON p.id_personagem = rdm.id_personagem AND rdm.status = 'completa';


-- Verificando os pré-requisitos para realizar uma missão que o personagem fez
SELECT pr.id_pre_requisito 
FROM personagem p, registro_da_missao rdm, missao m, pre_requisito pr
WHERE p.id_personagem = rdm.id_personagem AND rdm.id_missao <> m.id_missao;


-- ============================================= PERSONAGEM =============================================

-- Verificando a capacidade do iventário
SELECT count(i.id_personagem) 
FROM personagem p
JOIN inventario i ON i.id_personagem = p.id_personagem
WHERE i.id_personagem = 3;

-- Nome do personagem
SELECT nome
FROM personagem p
WHERE p.id_personagem = 3;

-- Nivel do personagem
SELECT nivel
FROM personagem p
WHERE p.id_personagem = 3;

-- Saude do personagem
SELECT saude
FROM personagem p
WHERE p.id_personagem = 3;

-- Quantidade de moedas do personagem
SELECT quantidade_moedas
FROM personagem p
WHERE p.id_personagem = 3;


-- Recompensa relacionada a um personagem específico
SELECT r.*
FROM personagem p
JOIN recompensa r ON r.id_personagem = p.id_personagem
WHERE p.id_personagem = 3;



-- ============================================ SALA ======================================

-- Listar um npc em uma sala
SELECT inns.id_npc, inns.id_sala
FROM instancia_npc_na_sala inns
JOIN sala s ON s.id_sala = inns.id_sala
WHERE s.id_sala = 3;

-- Listar todas as zonas de guerra e sua dificuldade
SELECT z.id_sala, z.dificuldade, s.nome_regiao
FROM zona_de_guerra z
JOIN sala s ON s.id_sala = z.id_sala;

-- Listar todas as regiões
SELECT r.*
FROM regiao r;

-- Listar todas as salas de uma determinada região, com seus pré requisitos
SELECT r.nome_regiao, s.id_sala, s.id_pre_req_missao
FROM sala s
JOIN regiao r ON s.nome_regiao = r.nome_regiao
WHERE r.nome_regiao = 'Nave do Vilgax';

-- Lista as salas que não tem pre-requisito
SELECT s.id_sala
FROM sala s
JOIN registro_da_missao rdm ON s.id_pre_req_missao = rdm.id_missao
JOIN personagem p ON rdm.id_personagem = p.id_personagem
WHERE p.id_personagem = 3 and rdm.status = 'completa'
UNION
SELECT s.id_sala 
FROM sala s
WHERE s.id_pre_req_missao IS NULL;


-- =========================================== MONSTRO ==================================

-- Consultar todas as instâncias de monstros em uma determinada sala
SELECT izg.id_zona_guerra, im.id_monstro, im.nome_especie, im.saude_atual
FROM instancia_monstro im
JOIN instancia_zona_guerra izg ON im.id_monstro = izg.id_monstro
WHERE izg.id_zona_guerra = 3;

-- Consultar dados especificos de uma espécie
SELECT m.*, im.saude_atual 
FROM monstro m
JOIN instancia_monstro im ON im.nome_especie = m.nome;

-- Monstro e Drop do item
SELECT im.id_monstro, 
       COALESCE(c.nome_item, a.nome_item) AS nome_item_recompensa
FROM instancia_monstro im
JOIN monstro m ON m.nome = im.nome_especie
LEFT JOIN consumivel c ON m.id_recompensa = c.nome_item
LEFT JOIN arma a ON m.id_recompensa = a.nome_item
WHERE im.id_monstro = 3;


-- ========================================= ITEM ===============================

-- Verificando os itens do inventário do personagem
SELECT i.nome_item 
FROM personagem p
JOIN inventario i ON i.id_personagem = p.id_personagem
WHERE i.id_personagem = 3;

-- Verificando o valor de venda do item do personagem
SELECT i.nome_item, COALESCE(c.valor_consumivel, a.preco) AS atributo
FROM personagem p
JOIN inventario i ON i.id_personagem = p.id_personagem
LEFT JOIN consumivel c ON c.nome_item = i.nome_item
LEFT JOIN arma a ON a.nome_item = i.nome_item;

-- Listar todos os itens disponíveis para venda por um NPC
SELECT edi.nome_item, edi.preco
FROM estoque_do_item edi
JOIN npc vendedor ON edi.id_npc = vendedor.id_npc
WHERE edi.id_npc = 6;

-- Consultar as recompensas de uma sala específica
SELECT s.id_sala, r.nome_item, r.recompensa_recebida
FROM recompensa r
JOIN sala s ON s.id_sala = r.id_sala
WHERE s.id_sala = 3;

-- Consultar qual a recompensa em forma de item
SELECT r.nome_item, 
       COALESCE(c.valor_consumivel, a.dano) AS atributo
FROM recompensa r
JOIN estoque_do_item edi ON r.nome_item = edi.nome_item
LEFT JOIN consumivel c ON c.nome_item = edi.nome_item 
LEFT JOIN arma a ON a.nome_item = edi.nome_item
WHERE edi.nome_item ='Kit Médico';


-- ========================================== ALIEN ==============================

-- Verificar o status de vida de um alien de um personagem
SELECT p.id_personagem, sda.nome_alien, sda.saude
FROM status_do_alien sda
JOIN personagem p ON p.id_personagem = sda.id_personagem
WHERE p.id_personagem = 3 and sda.nome_alien = 'XLR8';

-- Verificar os detalhes do alien dos aliens dos personagens
SELECT a.*
FROM status_do_alien sda
JOIN personagem p ON p.id_personagem = sda.id_personagem
LEFT JOIN alien a ON a.nome = sda.nome_alien
WHERE p.id_personagem = 3;