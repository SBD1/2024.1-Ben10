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
