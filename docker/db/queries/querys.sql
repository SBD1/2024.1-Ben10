-- =========================================== MISSÃO ===================================================

-- Consultar os detalhes de todas as missões associadas a um determinado NPC
SELECT m.id_missao, m.nome_missao, m.experiencia, m.descricao, m.recompensa_em_moedas
FROM guia_de_missoes gdm
JOIN missao m ON gdm.id_missao_associada = m.id_missao
where gdm.id_npc = 3;

-- SELECIONANDO MISSÕES CONCLUÍDAS PELO PERSONAGEM
SELECT p.id_personagem, rdm.id_missao, rdm.status
FROM personagem p
JOIN registro_da_missao rdm ON p.id_personagem = rdm.id_personagem
WHERE rdm.status ='completa' and rdm.id_personagem = 2;

-- SELECIONANDO MISSÕES QUE O PERSONAGEM AINDA NÃO FEZ
SELECT m.id_missao
FROM missao m
except
SELECT rdm.id_missao
FROM registro_da_missao rdm
join personagem p on p.id_personagem = rdm.id_personagem and rdm.status = 'completa'
where p.id_personagem = 2;

-- Verificando os pré requisitos para uma missão específica
select m.id_missao, m.nome_missao, pr.id_pre_requisito 
from missao m
join pre_requisito pr ON m.id_missao = pr.id_missao
where m.id_missao = 5;

-- Verificando quais missões aquela missão desbloqueia
select 
	pr.id_missao as missao_posterior,
	pr.id_pre_requisito as id_missao,
	m.nome_missao
from missao m
join pre_requisito pr on pr.id_pre_requisito = m.id_missao
where m.id_missao = 3;


-- ============================================= PERSONAGEM =============================================

-- Verificando a capacidade do iventário
select count(i.id_personagem) 
from personagem p
join inventario i on i.id_personagem = p.id_personagem
where i.id_personagem = 3;

-- Verificando todos os itens do iventário
select i.nome_item 
from personagem p
join inventario i on i.id_personagem = p.id_personagem
where i.id_personagem = 3;

-- Verificando todos os aliens de um personagem
select sda.nome_alien
from personagem p
join status_do_alien sda on sda.id_personagem = p.id_personagem
where sda.id_personagem = 3;

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