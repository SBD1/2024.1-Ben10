-- ========================================= INSTÂNCIA ===============================
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

-- ========================================= SALA ===============================





-- =========================================== MISSÃO ===================================================

-- Excluir pré-requisitos da missão
DELETE FROM pre_requisito 
WHERE id_missao = 1 AND id_pre_requisito = 2;

-- Excluir registro da missão de um personagem
DELETE FROM registro_da_missao r
JOIN personagem p ON r.id_personagem = p.id_personagem
WHERE id_missao = 1 AND id_personagem = 2;

-- Excluir a missão
DELETE FROM missao 
WHERE id_missao = 2;

-- ============================================= PERSONAGEM =============================================

-- Excluir item do inventário do personagem
DELETE FROM inventario
WHERE id_personagem = 1 AND id_item = 1;

-- Excluir o personagem
DELETE FROM personagem 
WHERE id_personagem = 5;

-- =========================================== NPC ==================================

-- Excluir a associação do NPC com uma missão
DELETE FROM npc 
WHERE id_missao_associada = 2 AND id_npc = 1;

-- Excluir o item do Estoque do Item
DELETE FROM estoque_do_item
WHERE id_npc = 1 AND nome_item = 'Kit Médico';

-- Excluir o NPC
DELETE FROM npc 
WHERE id_npc = 1;

-- ========================================= ITEM ===============================

-- Excluir um consumível
BEGIN TRANSACTION;

-- Primeiro remove o item da tabela consumível
DELETE FROM consumivel 
WHERE nome_item = 'Kit Médico';

-- Depois, remove o item da tabela item
DELETE FROM item 
WHERE nome_item = 'Kit Médico';

COMMIT;

-- Excluir uma arma
BEGIN TRANSACTION;

-- Primeiro remove o item da tabela arma
DELETE FROM consumivel 
WHERE nome_item = 'Arma Tennyson';

-- Depois, remove o item da tabela item
DELETE FROM item 
WHERE nome_item = 'Arma Tennyson';

COMMIT;


