# Álgebra Relacional

## <a>Introdução</a>

Segundo Elmasri e Navathe<a id="anchor_1" href="#REF1">^1^</a>, a álgebra relacional é fundamental no desenvolvimento de uma aplicação de banco de dados bem-sucedida. Ela fornece uma base formal para a definição e manipulação de dados em bancos de dados relacionais, permitindo a descrição das operações que podem ser realizadas nas tabelas do banco. A álgebra relacional não apenas facilita a compreensão e o planejamento das consultas e atualizações no banco de dados, mas também assegura que as operações sejam executadas de maneira eficiente e consistente.

## <a>Objetivo</a>

Este documento tem como objetivo detalhar a Álgebra Relacional utilizada nas principais consultas realizadas no projeto. Através deste documento, será possível entender a estrutura e a lógica das operações realizadas.

## <a>Consultas</a>

**Abaixo está a álgebra relacional de 14 consultas:**

### <a>1. Consultar os detalhes de todas as missões associadas a um determinado NPC</a>

```π n.id_npc, m.* (σ inns.id_sala = 2 (instancia_npc_na_sala ⨝ npc (instancia_npc_na_sala.id_npc = npc.id_npc) ⨝ missao (npc.id_missao_associada = missao.id_missao)))```

### <a>2. Selecionar missões concluídas pelo personagem</a>

```π p.id_personagem, rdm.id_missao, rdm.status (σ rdm.status = 'completa' ∧ rdm.id_personagem = 2 (personagem ⨝ registro_da_missao (personagem.id_personagem = registro_da_missao.id_personagem)))```

### <a>3. Verificar os pré-requisitos para uma missão específica</a>

```π m.id_missao, m.nome_missao, pr.id_pre_requisito (σ m.id_missao = 5 (missao ⨝ pre_requisito (missao.id_missao = pre_requisito.id_missao)))```

### <a>4. Verificar a capacidade do inventário</a>

```γ COUNT(i.id_personagem) (σ i.id_personagem = 3 (personagem ⨝ inventario (personagem.id_personagem = inventario.id_personagem)))```

### <a>5. Verificar todos os itens do inventário</a>

```π i.nome_item (σ i.id_personagem = 3 (personagem ⨝ inventario (personagem.id_personagem = inventario.id_personagem)))```

### <a>6. Verificar todos os aliens de um personagem</a>

```π sda.nome_alien (σ sda.id_personagem = 3 (personagem ⨝ status_do_alien (personagem.id_personagem = status_do_alien.id_personagem)))```

### <a>7. Quantidade de moedas do personagem</a>

```π quantidade_moedas (σ p.id_personagem = 3 (personagem))```

### <a>8. Recompensa relacionada a um personagem específico</a>

```π r.* (σ p.id_personagem = 3 (personagem ⨝ recompensa (personagem.id_personagem = recompensa.id_personagem)))```

### <a>9. Listar um NPC em uma sala</a>

```π inns.id_npc, inns.id_sala (σ s.id_sala = 3 (instancia_npc_na_sala ⨝ sala (instancia_npc_na_sala.id_sala = sala.id_sala)))```

### <a>10. Listar todas as salas de uma determinada região, com seus pré-requisitos</a>

```π r.nome_regiao, s.id_sala, s.id_pre_req_missao (σ r.nome_regiao = 'Nave do Vilgax' (sala ⨝ regiao (sala.nome_regiao = regiao.nome_regiao)))```

### <a>11. Buscar detalhes da recompensa na zona de armadilha</a>

```π r.* (σ r.id_sala = 3 (zona_de_armadilha ⨝ recompensa (zona_de_armadilha.id_sala = recompensa.id_sala)))```

### <a>12. Monstro e drop do item</a>

```π m.nome, i.* (σ m.nome = 'Demônio' (monstro ⨝ item (monstro.id_recompensa = item.nome_item)))```

### <a>13. Verificar o status de vida de um alien de um personagem</a>

```π p.id_personagem, sda.nome_alien, sda.saude (σ p.id_personagem = 3 ∧ sda.nome_alien = 'XLR8' (status_do_alien ⨝ personagem (status_do_alien.id_personagem = personagem.id_personagem)))```

### <a>14. Consultar as recompensas de uma sala específica</a>

```π s.id_sala, r.nome_item, r.recompensa_recebida (σ s.id_sala = 3 (recompensa ⨝ sala (recompensa.id_sala = sala.id_sala)))```

## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 6 Álgebra e Cálculo Relacional páginas 96 a 98.

## <a>Bibliografia</a>

> Álgebra Relacional Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-02/algebra_relacional.md>. Acesso em 28 de agosto de 2024.

> Álgebra Relacional One Shot. Disponível em: <https://sbd1.github.io/2023.2-OneShot/documentos/projeto-fisico/algebra/>. Acesso em 28 de agosto de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 28/08 | Criando documento e adicionando introdução e referencias bibliográficas| [João Artur](https://github.com/joao-artl) | [Arthur Alves](https://github.com/arthrok)|
| `1.1` | 28/08 | Adicionando Álgebra Relacional das consultas| [João Artur](https://github.com/joao-artl) | [Arthur Alves](https://github.com/arthrok)|