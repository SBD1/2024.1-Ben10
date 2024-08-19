-- =============================== INSTÂNCIA ====================================
-- Excluir Alien de Status do Alien
DELETE FROM status_do_alien a
WHERE a.id_personagem = 1 AND a.nome_alien = 'Massa Cinzenta';

-- Excluir Monstro de Instância Monstro
DELETE FROM instancia_monstro m
WHERE m.id_monstro = 5;

-- Excluir Instância de Zona de Guerra
DELETE FROM zona_de_guerra zg
WHERE zg.id_zona_guerra = 1 AND zg.id_personagem = 2 AND zg.id_monstro = 3;

-- Excluir Instância de NPC em uma sala
DELETE FROM instancia_npc_na_sala ns
WHERE ns.id_sala = 1 AND ns.id_npc = 3;

-- ========================================= ESPÉCIE ===============================

-- Excluir um Alien
BEGIN TRANSACTION;

-- Primeiro remove o alien da tabela alien
DELETE FROM alien a
WHERE a.nome = 'Massa Cinzenta';

-- Depois, remove o alien da tabela especie
DELETE FROM especie e
WHERE e.nome = 'Massa Cinzenta';

COMMIT;

-- Excluir um Monstro
BEGIN TRANSACTION;

-- Primeiro remove o monstro da tabela monstro
DELETE FROM monstro m
WHERE m.nome = 'VILGAX';

-- Depois, remove o alien da tabela especie
DELETE FROM especie e
WHERE e.nome = 'VILGAX';

COMMIT;

-- Excluir Especie da tabela especie
DELETE FROM especie e
WHERE e.nome = 'VILGAX';

-- Excluir uma Habilidade
DELETE FROM habilidade h
WHERE h.nome_habilidade = 'Super Velocidade';


-- ========================================= SALA ===============================

-- Excluir uma Zona de Guerra
BEGIN TRANSACTION;

-- Primeiro remove a sala de zona de Guerra
DELETE FROM zona_de_guerra
WHERE s.id_sala = 4;

-- Depois, exclui a sala
DELETE FROM sala s
WHERE s.id_sala = 4;

COMMIT;

-- Excluir uma Zona de Armadilha
BEGIN TRANSACTION;

-- Primeiro remove a sala de zona armadilha
DELETE FROM zona_de_armadilha 
WHERE s.id_sala = 3;

-- Depois, exclui a sala
DELETE FROM sala s
WHERE s.id_sala = 3;

COMMIT;

-- Excluir sala da tabela Sala
DELETE FROM sala s
WHERE s.id_sala = 5;

-- =========================================== MISSÃO ===================================================

-- Excluir pré-requisitos da missão
DELETE FROM pre_requisito pr
WHERE pr.id_missao = 1 AND pr.id_pre_requisito = 2;

-- Excluir registro da missão de um personagem
DELETE FROM registro_da_missao r
JOIN personagem p ON r.id_personagem = p.id_personagem
WHERE r.id_missao = 1 AND p.id_personagem = 2;

-- Excluir a missão
DELETE FROM missao m
WHERE m.id_missao = 2;

-- ============================================= PERSONAGEM =============================================

-- Excluir item do inventário do personagem
DELETE FROM inventario i
WHERE i.id_personagem = 1 AND i.id_item = 1;

-- Excluir o personagem
DELETE FROM personagem p
WHERE p.id_personagem = 5;

-- =========================================== NPC ==================================

-- Excluir um npc associado a missao
DELETE FROM npc n
WHERE n.id_missao_associada = 2 AND n.id_npc = 1;

-- Excluir o item do Estoque do Item
DELETE FROM estoque_do_item ei
WHERE ei.id_npc = 1 AND ei.nome_item = 'Kit Médico';

-- Excluir o NPC
DELETE FROM npc n
WHERE n.id_npc = 1;

-- ========================================= ITEM ===============================

-- Excluir um consumível
BEGIN TRANSACTION;

-- Primeiro remove o item da tabela consumível
DELETE FROM consumivel c
WHERE c.nome_item = 'Kit Médico';

-- Depois, remove o item da tabela item
DELETE FROM item i
WHERE i.nome_item = 'Kit Médico';

COMMIT;

-- Excluir uma arma
BEGIN TRANSACTION;

-- Primeiro remove o item da tabela arma
DELETE FROM arma a
WHERE c.nome_item = 'Arma Tennyson';

-- Depois, remove o item da tabela item
DELETE FROM item i
WHERE i.nome_item = 'Arma Tennyson';

COMMIT;