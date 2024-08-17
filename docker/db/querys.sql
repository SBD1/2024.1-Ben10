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