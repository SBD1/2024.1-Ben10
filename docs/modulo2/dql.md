## <a>Introdução</a>

De acordo com Elmasri e Navathe, a instrução básica para realizar consultas em um banco de dados é denominada **SELECT**. Essa instrução é fundamental para a recuperação de dados em sistemas de gerenciamento de banco de dados (SGBD). O **SELECT** oferece uma ampla variedade de opções, permitindo desde consultas simples até consultas de alta complexidade. Além disso, uma tabela SQL pode ser considerada um **multiconjunto** de tuplas, permitindo a existência de duplicatas, a menos que restrições de chaves ou a cláusula `DISTINCT` sejam aplicadas, forçando a tabela a se comportar como um conjunto, sem duplicatas.

## <a>Objetivo</a>

Este trabalho tem como objetivo explorar as funcionalidades da instrução **SELECT** em SQL, demonstrando como ela pode ser utilizada para realizar consultas eficientes e complexas em bancos de dados relacionais. Serão abordadas diferentes técnicas e práticas para otimizar consultas, assim como as implicações do uso de `DISTINCT` e de restrições de chave na estrutura e na recuperação dos dados. O objetivo é fornecer uma compreensão aprofundada das capacidades do **SELECT** e suas variações, capacitando o leitor a aplicar essas técnicas em cenários práticos de gerenciamento de banco de dados.

## <a>Todos os SELECT's</a>

Nesta seção, são apresentadas as diversas consultas **SELECT** utilizadas no projeto. Cada consulta é acompanhada por uma breve descrição, com o objetivo de documentar de forma clara e objetiva as operações realizadas. Este registro serve como referência para entender o propósito de cada consulta e a lógica aplicada, facilitando a manutenção e o desenvolvimento futuro do projeto. 

Ao todo são **36 queryes** inicialmente, podendo se adaptar de acordo com o desenvolvimento do projeto e necessidades.

??? "Todas as consultas"

    ```SQL
    -- ================ MISSÃO ================

    -- Consultar os detalhes de todas as missões associadas a um determinado NPC
    SELECT n.id_npc, m.*
    FROM instancia_npc_na_sala inns 
    join npc n
    ON inns.id_npc = n.id_npc
    join missao m
    on m.id_missao = n.id_missao_associada
    where inns.id_sala = 2;


    -- Consultando todos os itens e valores e diálogo associado ao estoque de um NPC
    SELECT edi.id_npc, n.dialogo_associado_venda, edi.nome_item, edi.preco
    FROM instancia_npc_na_sala inns 
    join npc n
    ON inns.id_npc = n.id_npc
    join estoque_do_item edi
    on edi.id_npc = inns.id_npc
    where inns.id_sala = 12;


    -- SELECIONANDO MISSÕES CONCLUÍDAS PELO PERSONAGEM
    SELECT p.id_personagem, rdm.id_missao, rdm.status
    FROM personagem p
    JOIN registro_da_missao rdm
    ON p.id_personagem = rdm.id_personagem
    WHERE rdm.status ='completa' and rdm.id_personagem = 2;

    -- SELECIONANDO MISSÕES QUE O PERSONAGEM AINDA NÃO FEZ
    SELECT m.id_missao
    FROM missao m
    except
    SELECT rdm.id_missao
    FROM registro_da_missao rdm
    join personagem p
    on p.id_personagem = rdm.id_personagem and rdm.status = 'completa'
    where p.id_personagem = 2;

    -- Verificando os pré requisitos para uma missão específica
    SELECT m.id_missao, m.nome_missao, pr.id_pre_requisito 
    FROM missao m
    join pre_requisito pr
    ON m.id_missao = pr.id_missao
    where m.id_missao = 5;

    -- Verificando quais missões aquela missão desbloqueia
    SELECT 
        pr.id_missao as missao_posterior,
        pr.id_pre_requisito as id_missao,
        m.nome_missao
    FROM missao m
    join pre_requisito pr
    on pr.id_pre_requisito = m.id_missao
    where m.id_missao = 3;


    -- ================ PERSONAGEM ================

    -- Verificando a capacidade do iventário
    SELECT count(i.id_personagem) 
    FROM personagem p
    join inventario i on i.id_personagem = p.id_personagem
    where i.id_personagem = 3;

    -- Verificando todos os itens do iventário
    SELECT i.nome_item 
    FROM personagem p
    join inventario i
    on i.id_personagem = p.id_personagem
    where i.id_personagem = 3;

    -- Verificando todos os aliens de um personagem
    SELECT sda.nome_alien
    FROM personagem p
    join status_do_alien sda
    on sda.id_personagem = p.id_personagem
    where sda.id_personagem = 3;

    -- Nome do personagem
    SELECT nome
    FROM personagem p
    where p.id_personagem = 3;

    -- Nivel do personagem
    SELECT nivel
    FROM personagem p
    where p.id_personagem = 3;

    -- Saude do personagem
    SELECT saude
    FROM personagem p
    where p.id_personagem = 3;

    -- Quantidade de moedas do personagem
    SELECT quantidade_moedas
    FROM personagem p
    where p.id_personagem = 3;


    -- Recompensa relacionada a um personagem específico
    SELECT r.*
    FROM personagem p
    join recompensa r
    on r.id_personagem = p.id_personagem
    where p.id_personagem = 3;


    -- ================ SALAS E REGIÕES ================

    -- Listar um npc em uma sala
    SELECT inns.id_npc, inns.id_sala
    FROM instancia_npc_na_sala inns
    join sala s
    on s.id_sala = inns.id_sala
    where s.id_sala = 3;

    -- Listar todas as zonas de guerra de uma região e sua dificuldade
    SELECT zg.id_sala, zg.dificuldade, s.nome_regiao
    FROM zona_de_guerra zg
    JOIN sala s
    ON s.id_sala = zg.id_sala
    join regiao r
    on r.nome_regiao = s.nome_regiao
    where s.tipo_sala = 'Zona de Guerra';

    -- Listar todas as zonas de armadilha de uma região
    SELECT zda.*, s.nome_regiao
    FROM zona_de_armadilha zda 
    JOIN sala s
    ON s.id_sala = zda.id_sala
    join regiao r
    on r.nome_regiao = s.nome_regiao
    where s.tipo_sala = 'Zona de Armadilha';

    -- listar todas as regiões
    SELECT *
    FROM regiao r;

    -- listar todas as regiões e suas salas
    SELECT r.*, s.id_sala, s.id_pre_req_missao, s.tipo_sala 
    FROM regiao r
    join sala s
    on r.nome_regiao = s.nome_regiao;


    -- Listar todas as regiões
    SELECT r.*
    FROM regiao r;

    -- Listar todas as salas de uma determinada região, com seus pré requisitos
    SELECT r.nome_regiao, s.id_sala, s.id_pre_req_missao
    FROM sala s
    join regiao r
    on s.nome_regiao = r.nome_regiao
    where r.nome_regiao = 'Nave do Vilgax';

    -- Lista as salas que não tem pre-requisito
    SELECT s.id_sala
    FROM sala s
    join registro_da_missao rdm
    ON s.id_pre_req_missao = rdm.id_missao
    join personagem p
    on rdm.id_personagem = p.id_personagem
    where p.id_personagem = 3 and rdm.status = 'completa'
    union 
    SELECT s.id_sala 
    FROM sala s
    WHERE s.id_pre_req_missao ISNULL;

    -- Buscando o log de uma determinada sala
    SELECT izg.*, zdg.descricao
    FROM zona_de_guerra zdg
    join instancia_zona_guerra izg
    on izg.id_zona_guerra = zdg.id_sala
    where zdg.id_sala = 3;

    -- Buscando o log de um personagem específico
    SELECT izg.*
    FROM personagem p
    join instancia_zona_guerra izg
    on izg.id_zona_guerra = p.id_sala
    where izg.id_personagem = 1;

    -- Buscando detalhes da recompensa na zona de armadilha
    SELECT r.*
    FROM zona_de_armadilha zda
    join recompensa r
    on r.id_sala = zda.id_sala
    where r.id_sala = 3;

    -- Verificar qual sala está desbloqueada para um personagem
    SELECT s.*
    FROM sala s
    LEFT JOIN registro_da_missao rdm
    ON s.id_pre_req_missao = rdm.id_missao AND rdm.id_personagem = 2 AND rdm.status = 'completa'
    WHERE rdm.id_missao IS NOT NULL OR s.id_pre_req_missao IS NULL;


    -- ================ MONSTRO ================

    -- Consultar todas as instâncias de monstros em uma determinada sala
    SELECT izg.id_zona_guerra, im.id_monstro, im.nome_especie, im.saude_atual
    FROM instancia_monstro im
    JOIN instancia_zona_guerra izg
    ON im.id_monstro = izg.id_monstro
    where izg.id_zona_guerra = 3;

    -- Consultar dados especificos de uma espécie
    SELECT e.*, a.*, m.*
    FROM especie e
    LEFT JOIN alien a
    ON a.nome = e.nome AND e.tipo_especie = 'Alien'
    LEFT JOIN monstro m
    ON m.nome = e.nome AND e.tipo_especie = 'Monstro'
    WHERE e.nome = 'Insectóide';

    -- Consultar habilidades especificas de uma espécie
    SELECT e.*, h.*
    FROM especie e
    LEFT JOIN habilidade h
    ON h.nome_especie = e.nome
    WHERE e.nome = 'Insectóide';


    -- Monstro e Drop do item
    SELECT m.nome, i.*
    FROM monstro m 
    join item i
    ON m.id_recompensa = i.nome_item
    where m.nome = 'Demônio';


    -- ================ ITEM ================

    -- Verificando os itens do inventário do personagem
    SELECT i.nome_item 
    FROM personagem p
    join inventario i
    on i.id_personagem = p.id_personagem
    where i.id_personagem = 3;

    -- Verificando o valor de venda do item do personagem
    SELECT i.nome_item,  c.preco, a.preco 
    FROM personagem p
    left join inventario i
    on i.id_personagem = p.id_personagem
    left join item it
    on it.nome_item = i.nome_item
    left join consumivel c
    on c.nome_item = i.nome_item and it.tipo_item = 'Consumível'
    left join arma a
    on a.nome_item = i.nome_item and it.tipo_item = 'Arma'
    where p.id_personagem = 3;

    -- Consultar as recompensas de uma sala específica
    SELECT s.id_sala, r.nome_item, r.recompensa_recebida
    FROM recompensa r
    join sala s
    on s.id_sala = r.id_sala
    where s.id_sala = 3;

    -- Consultar qual a recompensa em forma de item
    SELECT r.*, c.*, a.*
    FROM recompensa r
    join item i on r.nome_item = i.nome_item
    LEFT JOIN CONSUMIVEL c
    ON i.nome_item = c.nome_item AND i.tipo_item = 'Consumível'
    LEFT JOIN ARMA a
    ON i.nome_item = c.nome_item AND i.tipo_item = 'Arma'
    WHERE r.nome_item = 'Kit Médico';


    -- ================ ALIEN ================

    -- Verificar o status de vida de um alien de um personagem
    SELECT p.id_personagem, sda.nome_alien, sda.saude
    FROM status_do_alien sda
    join personagem p
    on p.id_personagem = sda.id_personagem
    where p.id_personagem = 3 and sda.nome_alien = 'XLR8';

    -- Verificar os detalhes do alien dos aliens dos personagens
    SELECT a.*
    FROM status_do_alien sda
    join personagem p
    on p.id_personagem = sda.id_personagem
    left join alien a
    on a.nome = sda.nome_alien
    where p.id_personagem = 3;
    ```
<font size="3"><p style="text-align: center">Fonte: [Eric Silveira](https://github.com/ericbky).</p></font>

## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 4.3 Consultas de recuperação básicas em SQL, página 63.

## <a>Bibliografia</a>

> Queryes de consulta, Entrega 02, Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/queries-de-consulta/docs/Entrega-02/DQL.sql>. Acesso em 15 de agosto de 2024.


## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 15/08| Inserindo a introdução |[Eric Silveira](https://github.com/ericbky)| [Arthur Alves](https://github.com/Arthrok) e [João Artur](https://github.com/joao-artl) |
| `1.1` | 19/08| Atualizando o documento e inserindo as consultas |[Eric Silveira](https://github.com/ericbky)| [Arthur Alves](https://github.com/Arthrok) e [João Artur](https://github.com/joao-artl) |