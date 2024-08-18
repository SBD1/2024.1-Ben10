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


-- ============================================ SALAS E REGIÕES ======================================

-- Listar um npc em uma sala
select inns.id_npc, inns.id_sala
from instancia_npc_na_sala inns
join sala s on s.id_sala = inns.id_sala
where s.id_sala = 3;

-- Listar todas as zonas de guerra de uma região e sua dificuldade
SELECT zg.id_sala, zg.dificuldade, s.nome_regiao
FROM zona_de_guerra zg
JOIN sala s ON s.id_sala = zg.id_sala
join regiao r on r.nome_regiao = s.nome_regiao
where s.tipo_sala = 'Zona de Guerra';

-- Listar todas as zonas de armadilha de uma região
SELECT zda.*, s.nome_regiao
FROM zona_de_armadilha zda 
JOIN sala s ON s.id_sala = zda.id_sala
join regiao r on r.nome_regiao = s.nome_regiao
where s.tipo_sala = 'Zona de Armadilha';

-- listar todas as regiões
select *
from regiao r;

-- listar todas as regiões e suas salas
SELECT r.*, s.id_sala, s.id_pre_req_missao, s.tipo_sala 
FROM regiao r
join sala s on r.nome_regiao = s.nome_regiao;


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

-- Buscando o log de uma determinada sala
select izg.*, zdg.descricao
from zona_de_guerra zdg
join instancia_zona_guerra izg on izg.id_zona_guerra = zdg.id_sala
where zdg.id_sala = 3;

-- Buscando o log de um personagem específico
select izg.*
from personagem p
join instancia_zona_guerra izg on izg.id_zona_guerra = p.id_sala
where izg.id_personagem = 1;

-- Buscando detalhes da recompensa na zona de armadilha
select r.*
from zona_de_armadilha zda
join recompensa r on r.id_sala = zda.id_sala
where r.id_sala = 3;

-- Verificar qual sala está desbloqueada para um personagem
SELECT s.*
FROM sala s
LEFT JOIN registro_da_missao rdm ON s.id_pre_req_missao = rdm.id_missao AND rdm.id_personagem = 2 AND rdm.status = 'completa'
WHERE rdm.id_missao IS NOT NULL OR s.id_pre_req_missao IS NULL;


-- =========================================== MONSTRO ==================================

-- Consultar todas as instâncias de monstros em uma determinada sala
SELECT izg.id_zona_guerra, im.id_monstro, im.nome_especie, im.saude_atual
FROM instancia_monstro im
JOIN instancia_zona_guerra izg ON im.id_monstro = izg.id_monstro
where izg.id_zona_guerra = 3;

-- Consultar dados especificos de uma espécie
SELECT e.*, a.*, m.*
FROM especie e
LEFT JOIN alien a ON a.nome = e.nome AND e.tipo_especie = 'Alien'
LEFT JOIN monstro m ON m.nome = e.nome AND e.tipo_especie = 'Monstro'
WHERE e.nome = 'Insectóide';

-- Consultar habilidades especificas de uma espécie
SELECT e.*, h.*
FROM especie e
LEFT JOIN habilidade h ON h.nome_especie = e.nome
WHERE e.nome = 'Insectóide';


-- Monstro e Drop do item
SELECT m.nome, i.*
from monstro m 
join item i ON m.id_recompensa = i.nome_item
where m.nome = 'Demônio';
