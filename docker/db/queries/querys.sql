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

