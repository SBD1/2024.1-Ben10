-- =========================================== MISSÃO ===================================================

-- Consultar os detalhes de todas as missões associadas a um determinado NPC
SELECT m.id_missao, m.nome_missao, m.experiencia, m.descricao, m.recompensa_em_moedas
FROM guia_de_missoes gdm
JOIN missao m ON gdm.id_missao_associada = m.id_missao;

-- SELECIONANDO MISSÕES CONCLUÍDAS PELO PERSONAGEM
SELECT p.id_personagem, rdm.id_missao, rdm.status
FROM personagem p
JOIN registro_da_missao rdm ON p.id_personagem = rdm.id_personagem
WHERE rdm.status ='completa';

-- SELECIONANDO MISSÕES QUE O PERSONAGEM AINDA NÃO FEZ
SELECT m.id_missao
FROM missao m
except
SELECT rdm.id_missao
FROM registro_da_missao rdm
join personagem p on p.id_personagem = rdm.id_personagem and rdm.status = 'completa';


-- Verificando os pré-requisitos para realizar uma missão que o personagem fez
select pr.id_pre_requisito 
from personagem p, registro_da_missao rdm, missao m, pre_requisito pr
where p.id_personagem = rdm.id_personagem and rdm.id_missao <> m.id_missao;


-- ============================================= PERSONAGEM =============================================

-- Verificando a capacidade do iventário
select count(i.id_personagem) 
from personagem p
join inventario i on i.id_personagem = p.id_personagem
where i.id_personagem = 3;

-- Nome do personagem
select nome
from personagem p
where p.id_personagem = 3;

-- Nivel do personagem
select nivel
from personagem p
where p.id_personagem = 3;

-- Saude do personagem
select saude
from personagem p
where p.id_personagem = 3;

-- Quantidade de moedas do personagem
select quantidade_moedas
from personagem p
where p.id_personagem = 3;


-- Recompensa relacionada a um personagem específico
select r.*
from personagem p
join recompensa r on r.id_personagem = p.id_personagem
where p.id_personagem = 3;



-- ============================================ SALA ======================================

-- Listar um npc em uma sala
select inns.id_npc, inns.id_sala
from instancia_npc_na_sala inns
join sala s on s.id_sala = inns.id_sala
where s.id_sala = 3;

-- Listar todas as zonas de guerra e sua dificuldade
SELECT z.id_sala, z.dificuldade, s.nome_regiao
FROM zona_de_guerra z
JOIN sala s ON s.id_sala = z.id_sala;

-- Listar todas as regiões
select r.*
from regiao r;

-- Listar todas as salas de uma determinada região, com seus pré requisitos
select r.nome_regiao, s.id_sala, s.id_pre_req_missao
from sala s
join regiao r on s.nome_regiao = r.nome_regiao
where r.nome_regiao = 'Nave do Vilgax';

-- Lista as salas que não tem pre-requisito
SELECT s.id_sala
FROM sala s
join registro_da_missao rdm ON s.id_pre_req_missao = rdm.id_missao
join personagem p on rdm.id_personagem = p.id_personagem
where p.id_personagem = 3 and rdm.status = 'completa'
union 
select s.id_sala 
from sala s
WHERE s.id_pre_req_missao ISNULL;


-- =========================================== MONSTRO ==================================

-- Consultar todas as instâncias de monstros em uma determinada sala
SELECT izg.id_zona_guerra, im.id_monstro, im.nome_especie, im.saude_atual
FROM instancia_monstro im
JOIN instancia_zona_guerra izg ON im.id_monstro = izg.id_monstro
where izg.id_zona_guerra = 3;

-- Consultar dados especificos de uma espécie
select m.*, im.saude_atual 
from monstro m
join instancia_monstro im on im.nome_especie = m.nome;

-- Monstro e Drop do item
SELECT im.id_monstro, 
       COALESCE(c.nome_item, a.nome_item) AS nome_item_recompensa
FROM instancia_monstro im
JOIN monstro m ON m.nome = im.nome_especie
left JOIN consumivel c ON m.id_recompensa = c.nome_item
left JOIN arma a ON m.id_recompensa = a.nome_item
where im.id_monstro = 3;


-- ========================================= ITEM ===============================

-- Verificando os itens do inventário do personagem
select i.nome_item 
from personagem p
join inventario i on i.id_personagem = p.id_personagem
where i.id_personagem = 3;

-- Verificando o valor de venda do item do personagem
select i.nome_item,  COALESCE(c.valor_consumivel, a.preco) AS atributo
from personagem p
join inventario i on i.id_personagem = p.id_personagem
join consumivel c on c.nome_item = i.nome_item
join arma a on a.nome_item = i.nome_item;

-- Listar todos os itens disponíveis para venda por um NPC
SELECT edi.nome_item, edi.preco
FROM estoque_do_item edi
join vendedor v on edi.id_npc = v.id_npc
where edi.id_npc = 6;

-- Consultar as recompensas de uma sala específica
SELECT s.id_sala, r.nome_item, r.recompensa_recebida
FROM recompensa r
join sala s on s.id_sala = r.id_sala
where s.id_sala = 3;

-- Consultar qual a recompensa em forma de item
SELECT r.nome_item, 
       COALESCE(c.valor_consumivel, a.dano) AS atributo
FROM recompensa r
JOIN estoque_do_item edi ON r.nome_item = edi.nome_item
left JOIN consumivel c ON c.nome_item = edi.nome_item 
left JOIN arma a ON a.nome_item = edi.nome_item
WHERE edi.nome_item ='Kit Médico';


-- ========================================== ALIEN ==============================

-- Verificar o status de vida de um alien de um personagem
SELECT p.id_personagem, sda.nome_alien, sda.saude
FROM status_do_alien sda
join personagem p on p.id_personagem = sda.id_personagem
where p.id_personagem = 3 and sda.nome_alien = 'XLR8';

-- Verificar os detalhes do alien dos aliens dos personagens
select a.*
from status_do_alien sda
join personagem p on p.id_personagem = sda.id_personagem
left join alien a on a.nome = sda.nome_alien
where p.id_personagem = 3;
