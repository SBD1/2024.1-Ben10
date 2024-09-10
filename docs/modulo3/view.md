# DML (Data Manipulation Language)

## <a>Introdução</a>

Segundo Elmasri e Navathe<a id="anchor_1" href="#REF1">^1^</a>, as views permitem que consultas sejam estruturadas de maneira eficiente e acessível. As views são construções que permitem abstrair e organizar dados complexos, tornando as consultas mais simples e claras. Elas facilitam a extração de informações sem a necessidade de replicar consultas complexas em diferentes partes do sistema, garantindo consistência, integridade e otimização do desempenho nas operações de leitura dos dados armazenados.

A importância das views reside na sua capacidade de oferecer uma interface simplificada para interagir com os dados do banco de dados. Ao utilizar views, é possível criar consultas predefinidas que trazem resultados já organizados, conforme as necessidades do sistema. Isso não apenas facilita a reutilização de consultas complexas, mas também mantém a flexibilidade e o dinamismo das operações, permitindo que desenvolvedores e usuários extraíam informações detalhadas de forma eficiente e segura.<a id="anchor_2" href="#REF2">^2^</a>


## <a>Objetivo</a>

Este documento tem como objetivo detalhar o uso de Views no contexto do projeto. Serão abordadas as principais views criadas para facilitar consultas de dados, focando em como elas são utilizadas para otimizar o acesso às informações e garantir a integridade e eficiência do sistema. Essas views organizam os dados de forma clara e estruturada, permitindo uma consulta simplificada, além de melhorar a manutenção e a legibilidade do código, sem a necessidade de repetir as consultas SQL complexas em diferentes partes do projeto.

## <a> Views </>

**Abaixo estão as views desenvolvidas durante o projeto:**

??? "Views"
    #### Views

    ```sql
        -- Consultar os detalhes de todas as missões associadas a um determinado NPC
        CREATE VIEW detalhes_missoes_npc AS
        SELECT n.id_npc, m.*
        FROM instancia_npc_na_sala inns 
        JOIN npc n ON inns.id_npc = n.id_npc
        JOIN missao m ON m.id_missao = n.id_missao_associada;

        -- Selecionando missões concluídas pelo personagem
        CREATE VIEW missoes_concluidas_personagem AS
        SELECT p.id_personagem, rdm.id_missao, rdm.status
        FROM personagem p
        JOIN registro_da_missao rdm ON p.id_personagem = rdm.id_personagem
        WHERE rdm.status = 'completa';

        -- Verificando os pré-requisitos para uma missão específica
        CREATE VIEW pre_requisitos_missao AS
        SELECT m.id_missao, m.nome_missao, pr.id_pre_requisito 
        FROM missao m
        JOIN pre_requisito pr ON m.id_missao = pr.id_missao;

        -- Verificando a capacidade do inventário
        CREATE VIEW capacidade_inventario_personagem AS
        SELECT p.id_personagem, COUNT(i.id_personagem) AS quantidade_itens
        FROM personagem p
        JOIN inventario i ON i.id_personagem = p.id_personagem
        GROUP BY p.id_personagem;

        -- Verificando todos os itens do inventário
        CREATE VIEW itens_inventario_personagem AS
        SELECT p.id_personagem, i.nome_item 
        FROM personagem p
        JOIN inventario i ON i.id_personagem = p.id_personagem;

        -- Verificando todos os aliens de um personagem
        CREATE VIEW aliens_personagem AS
        SELECT p.id_personagem, sda.nome_alien
        FROM personagem p
        JOIN status_do_alien sda ON sda.id_personagem = p.id_personagem;

        -- Quantidade de moedas do personagem
        CREATE VIEW moedas_personagem AS
        SELECT p.id_personagem, p.quantidade_moedas
        FROM personagem p;

        -- Recompensa relacionada a um personagem específico
        CREATE VIEW recompensa_personagem AS
        SELECT p.id_personagem, r.*
        FROM personagem p
        JOIN recompensa r ON r.id_personagem = p.id_personagem;

        -- Listar um npc em uma sala
        CREATE VIEW npc_na_sala AS
        SELECT inns.id_npc, inns.id_sala
        FROM instancia_npc_na_sala inns
        JOIN sala s ON s.id_sala = inns.id_sala;

        -- Listar todas as salas de uma determinada região, com seus pré-requisitos
        CREATE VIEW salas_com_pre_requisitos_regiao AS
        SELECT r.nome_regiao, s.id_sala, s.id_pre_req_missao
        FROM sala s
        JOIN regiao r ON s.nome_regiao = r.nome_regiao;

        -- Buscando detalhes da recompensa na zona de armadilha
        CREATE VIEW detalhes_recompensa_zona_armadilha AS
        SELECT zda.id_sala, r.*
        FROM zona_de_armadilha zda
        JOIN recompensa r ON r.id_sala = zda.id_sala;

        -- Monstro e Drop do item
        CREATE VIEW drop_item_monstro AS
        SELECT m.nome AS monstro, i.*
        FROM monstro m 
        JOIN item i ON m.id_recompensa = i.nome_item;

        -- Verificar o status de vida de um alien de um personagem
        CREATE VIEW status_vida_alien AS
        SELECT p.id_personagem, sda.nome_alien, sda.saude
        FROM status_do_alien sda
        JOIN personagem p ON p.id_personagem = sda.id_personagem;

        -- Consultar as recompensas de uma sala específica
        CREATE VIEW recompensas_sala AS
        SELECT s.id_sala, r.nome_item, r.recompensa_recebida
        FROM recompensa r
        JOIN sala s ON s.id_sala = r.id_sala;
    ```

**Ao consultar essas VIEWs, basta passar as condições necessárias nas cláusulas WHERE nas consultas como por exemplo:**

```sql
-- Para consultar detalhes de missões de um NPC específico
SELECT * FROM detalhes_missoes_npc WHERE id_npc = 2;

-- Para verificar as missões concluídas por um personagem específico
SELECT * FROM missoes_concluidas_personagem WHERE id_personagem = 3
```

## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 5 Mais SQL: Consultas complexas, triggers, views e modificação de esquema, tópico 5.3 Visões (views)- Tabelas virtuais em SQL página 88 a 90.

> <a id="REF2" href="#anchor_2">2.</a> SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. Database system concepts. 6. ed. New York: McGraw-Hill, 2011. Chapter 4 Intermediate SQL, tópico 4.2 Views, páginas 120 a 126.

## <a>Bibliografia</a>

> Views Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-03/Stored_Procedures_Triggers_Views.sql>. Acesso em 09 de setembro de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 09/09 | Criando documento e adicionando introdução, referencias bibliográficas e Views| [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|