# Álgebra Relacional

## <a>Introdução</a>

Segundo Elmasri e Navathe<a id="anchor_1" href="#REF1">^1^</a>, a álgebra relacional é fundamental no desenvolvimento de uma aplicação de banco de dados bem-sucedida. Ela fornece uma base formal para a definição e manipulação de dados em bancos de dados relacionais, permitindo a descrição das operações que podem ser realizadas nas tabelas do banco. A álgebra relacional não apenas facilita a compreensão e o planejamento das consultas e atualizações no banco de dados, mas também assegura que as operações sejam executadas de maneira eficiente e consistente.

## <a>Objetivo</a>

Este documento tem como objetivo detalhar a Álgebra Relacional utilizada nas principais consultas realizadas no projeto. Através deste documento, será possível entender a estrutura e a lógica das operações realizadas.

## <a>Consultas</a>


### 1. Consultar os detalhes de todas as missões associadas a um determinado NPC

```π n.id_npc, m.* (σ inns.id_sala = 2 (instancia_npc_na_sala ⨝ npc (instancia_npc_na_sala.id_npc = npc.id_npc) ⨝ missao (npc.id_missao_associada = missao.id_missao)))```

#### 2. Selecionar missões concluídas pelo personagem

π p.id_personagem, rdm.id_missao, rdm.status (σ rdm.status = 'completa' ∧ rdm.id_personagem = 2 (personagem ⨝ registro_da_missao (personagem.id_personagem = registro_da_missao.id_personagem)))

3. Verificar os pré-requisitos para uma missão específica
```π m.id_missao, m.nome_missao, pr.id_pre_requisito (σ m.id_missao = 5 (missao ⨝ pre_requisito (missao.id_missao = pre_requisito.id_missao)))```

4. Verificar a capacidade do inventário
```γ COUNT(i.id_personagem) (σ i.id_personagem = 3 (personagem ⨝ inventario (personagem.id_personagem = inventario.id_personagem)))```

5. Verificar todos os itens do inventário
```π i.nome_item (σ i.id_personagem = 3 (personagem ⨝ inventario (personagem.id_personagem = inventario.id_personagem)))```

6. Verificar todos os aliens de um personagem
```π sda.nome_alien (σ sda.id_personagem = 3 (personagem ⨝ status_do_alien (personagem.id_personagem = status_do_alien.id_personagem)))```

7. Quantidade de moedas do personagem
```π quantidade_moedas (σ p.id_personagem = 3 (personagem))```

8. Recompensa relacionada a um personagem específico
```π r.* (σ p.id_personagem = 3 (personagem ⨝ recompensa (personagem.id_personagem = recompensa.id_personagem)))```

9. Listar um NPC em uma sala
```π inns.id_npc, inns.id_sala (σ s.id_sala = 3 (instancia_npc_na_sala ⨝ sala (instancia_npc_na_sala.id_sala = sala.id_sala)))```

10. Listar todas as salas de uma determinada região, com seus pré-requisitos
```π r.nome_regiao, s.id_sala, s.id_pre_req_missao (σ r.nome_regiao = 'Nave do Vilgax' (sala ⨝ regiao (sala.nome_regiao = regiao.nome_regiao)))```

11. Buscar detalhes da recompensa na zona de armadilha
```π r.* (σ r.id_sala = 3 (zona_de_armadilha ⨝ recompensa (zona_de_armadilha.id_sala = recompensa.id_sala)))```

12. Monstro e drop do item
```π m.nome, i.* (σ m.nome = 'Demônio' (monstro ⨝ item (monstro.id_recompensa = item.nome_item)))```

13. Verificar o status de vida de um alien de um personagem
```π p.id_personagem, sda.nome_alien, sda.saude (σ p.id_personagem = 3 ∧ sda.nome_alien = 'XLR8' (status_do_alien ⨝ personagem (status_do_alien.id_personagem = personagem.id_personagem)))```

14. Consultar as recompensas de uma sala específica
```π s.id_sala, r.nome_item, r.recompensa_recebida (σ s.id_sala = 3 (recompensa ⨝ sala (recompensa.id_sala = sala.id_sala)))```








































-- Consultar os detalhes de todas as missões associadas a um determinado NPC
select n.id_npc, m.*
from instancia_npc_na_sala inns 
join npc n ON inns.id_npc = n.id_npc
join missao m on m.id_missao = n.id_missao_associada
where inns.id_sala = 2;

-- SELECIONANDO MISSÕES CONCLUÍDAS PELO PERSONAGEM
SELECT p.id_personagem, rdm.id_missao, rdm.status
FROM personagem p
JOIN registro_da_missao rdm ON p.id_personagem = rdm.id_personagem
WHERE rdm.status ='completa' and rdm.id_personagem = 2;

-- Verificando os pré requisitos para uma missão específica
select m.id_missao, m.nome_missao, pr.id_pre_requisito 
from missao m
join pre_requisito pr ON m.id_missao = pr.id_missao
where m.id_missao = 5;

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

-- Quantidade de moedas do personagem
select quantidade_moedas
from personagem p
where p.id_personagem = 3;


-- Recompensa relacionada a um personagem específico
select r.*
from personagem p
join recompensa r on r.id_personagem = p.id_personagem
where p.id_personagem = 3;

-- Listar um npc em uma sala
select inns.id_npc, inns.id_sala
from instancia_npc_na_sala inns
join sala s on s.id_sala = inns.id_sala
where s.id_sala = 3;

-- Listar todas as salas de uma determinada região, com seus pré requisitos
select r.nome_regiao, s.id_sala, s.id_pre_req_missao
from sala s
join regiao r on s.nome_regiao = r.nome_regiao
where r.nome_regiao = 'Nave do Vilgax';

-- Buscando detalhes da recompensa na zona de armadilha
select r.*
from zona_de_armadilha zda
join recompensa r on r.id_sala = zda.id_sala
where r.id_sala = 3;

-- Monstro e Drop do item
SELECT m.nome, i.*
from monstro m 
join item i ON m.id_recompensa = i.nome_item
where m.nome = 'Demônio';

-- Verificar o status de vida de um alien de um personagem
SELECT p.id_personagem, sda.nome_alien, sda.saude
FROM status_do_alien sda
join personagem p on p.id_personagem = sda.id_personagem
where p.id_personagem = 3 and sda.nome_alien = 'XLR8';

-- Consultar as recompensas de uma sala específica
SELECT s.id_sala, r.nome_item, r.recompensa_recebida
FROM recompensa r
join sala s on s.id_sala = r.id_sala
where s.id_sala = 3;

## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 6 Álgebra e Cálculo Relacional página 96 a 98.

## <a>Bibliografia</a>

> Álgebra Relacional Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-02/algebra_relacional.md>. Acesso em 28 de agosto de 2024.

> Álgebra Relacional One Shot. Disponível em: <https://sbd1.github.io/2023.2-OneShot/documentos/projeto-fisico/algebra/>. Acesso em 28 de agosto de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 28/08 | Criando documento e adicionando introdução e referencias bibliográficas| [João Artur](https://github.com/joao-artl) | [Arthur Alves](https://github.com/arthrok)|
| `1.1` | 28/08 | Adicionando Álgebra Relacional das consultas| [João Artur](https://github.com/joao-artl) | [Arthur Alves](https://github.com/arthrok)|