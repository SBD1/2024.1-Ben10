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