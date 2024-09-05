# Modelo Entidade Relacionamento

## <a>Introdução</a>

Segundo Elmasri e Navathe<a id="anchor_1" href="#REF1">^1^</a>, a modelagem conceitual é uma etapa essencial no desenvolvimento de uma aplicação de banco de dados bem-sucedida. Essa fase abrange o design de estruturas e restrições do banco de dados, além da criação de programas que realizam consultas e atualizações. A modelagem conceitual não apenas facilita a compreensão e o planejamento do banco de dados, mas também garante que as operações sejam eficientes e seguras.

O Modelo Entidade-Relacionamento (MER) é uma ferramenta popular de alto nível utilizada no design conceitual de bancos de dados. O MER foca na identificação de entidades, relacionamentos e atributos, ajudando a criar um esquema claro e estruturado do banco de dados. Essa metodologia permite a visualização das interações entre diferentes elementos do sistema, promovendo um entendimento detalhado das necessidades do banco de dados antes da implementação física.<a id="anchor_2" href="#REF2">^2^</a>

## <a>Objetivo</a>

Este documento tem como objetivo detalhar as entidades, atributos e relacionamentos no contexto do Modelo Entidade-Relacionamento (MER). 
A representação gráfica deste modelo pode ser vista no artefato [DER](https://sbd1.github.io/2024.1-Ben10/modulo1/DER/).

## <a>Modelo Entidade Relacionamento</a>

### <a>Entidades</a>

- **PERSONAGEM**
- **STATUS_DO_ALIEN**
- **ESPECIE**
- **ALIEN**
- **MONSTRO**
- **INSTANCIA_MONSTRO**
- **INSTANCIA_ZONA_GUERRA**
- **ZONA_DE_GUERRA**
- **SALA**
- **ZONA_DE_ARMADILHA**
- **INSTANCIA_NPC_NA_SALA**
- **NPC**
- **VENDEDOR**
- **GUIA_DE_MISSOES**
- **MISSAO**
- **REGISTRO_DA_MISSAO**
- **INVENTARIO**
- **ESTOQUE_DO_ITEM**
- **ITEM**
- **ARMA**
- **CONSUMIVEL**
- **HABILIDADE**

### <a>Atributos</a>

- **PERSONAGEM**: <ins>id_personagem</ins>, nome, nivel, saude, id_sala, nome_alien, quantidade_moedas;
- **STATUS_DO_ALIEN**: <ins>nome_alien</ins>, saude;
- **ESPECIE**: <ins>nome</ins>, status_base, saude, defesa;
- **ALIEN**: descrição;
- **MONSTRO**: id_recompensa, dificuldade, recompensa_em_moedas;
- **INSTANCIA_MONSTRO**: <ins>id_monstro</ins>, saude_atual, nome_especie;
- **INSTANCIA_ZONA_GUERRA**: <ins>id_monstro</ins>, <ins>id_zona_guerra</ins>, <ins>id_personagem</ins>;
- **ZONA_DE_GUERRA**: dificuldade, descrição;
- **SALA**: <ins>id_sala</ins>, nome_regiao, id_pre_req_missao
- **ZONA_DE_ARMADILHA**: fator, tipo;
- **INSTANCIA_NPC_NA_SALA**: <ins>id_sala</ins>, <ins>id_npc</ins>;
- **NPC**: <ins>id_npc</ins>,nome_npc;
- **VENDEDOR**: dialogo_associado_venda
- **GUIA_DE_MISSOES**: <ins>id_missao_associada</ins>;
- **MISSAO**: <ins>id_missao</ins>, nome_missao, descricao, experiencia, recompensa_em_moedas
- **REGISTRO_DA_MISSAO**: <ins>id_missao</ins>, status;
- **INVENTARIO**: id_item, nome_item;
- **ESTOQUE_DO_ITEM**: <ins>nome_item</ins>, preco;
- **ITEM**: <ins>nome</ins>, preco;
- **ARMA**: dano;
- **CONSUMIVEL**: status, valor_consumivel;
- **HABILIDADE**: <ins>nome_habilidade</ins>, <ins>nome_especie</ins>, efeito, quantidade;

### <a>Relacionamentos</a>

**PERSONAGEM é _contido_ em INSTACIA_ZONA_DE_GUERRA**

- O PERSONAGEM pode ser contido em nenhuma ou varias INSTACIA_ZONA_DE_GUERRA (O,N)
- A INSTACIA_ZONA_DE_GUERRA contém apenas um personagem (1,1)


**PERSONAGEM _possui_ STATUS_DO_ALIEN**

- O PERSONAGEM possui um ou varios STATUS_DO_ALIEN (1,N)
- O STATUS_DO_ALIEN é possuido por apenas um PERSONAGEM (1,1)


**PERSONAGEM _contém_ INVENTARIO**

- O PERSONAGEM contem apenas um INVENTARIO (1,1)
- O INVENTARIO é contido por apenas um PERSONAGEM(1,1)


**PERSONAGEM _possui_ REGISTRO_DA_MISSAO**

- O PERSONAGEM possui nenhum ou um REGISTRO_DA_MISSAO (0,1)
- O REGISTRO_DA_MISSAO é possuido por apenas um PERSONAGEM (1,1)


**REGISTRO_DA_MISSAO _contem_ MISSAO**

- O REGISTRO_DA_MISSAO pode conter apenas uma missão (1,1)
- A MISSAO pode ser contida em nenhum ou varios REGISTRO_DA_MISSAO (0,N)


**MISSAO tem como _pre-requisito_ MISSAO**

- A MISSAO pode ter como pre-requisito nenhuma ou várias MISSAO (0,N)
- A MISSAO pode ser pre-requisito de nenhuma ou várias MISSAO (0,N)


**MISSAO é _demandada_ por GUIA_DE_MISSOES**

- A MISSAO pode ser demandada por apenas um GUIA_DE_MISSOES (1,1)
- O GUIA_DE_MISSOES pode demandar apenas uma MISSAO (1,1)


**INVENTARIO _inclui_ ITEM**

- O INVENTARIO pode incluir nenhum ou varios ITEM (0,N)
- O ITEM é incluso em nenhum ou varios INVENTARIO (0,N)


**ITEM _"dropa"_ MONSTRO**

- O ITEM pode ser dropado por um ou vários MONSTRO (0,N)
- O INVENTARIO pode ou não ser dropado por um MONSTRO (0,1)


**ITEM é _armazenado_ em ESTOQUE_DO_ITEM**

- O ITEM pode ser armazenado em um ESTOQUE_DO_ITEM (1,1)
- O ESTOQUE_DO_ITEM pode armezanar nenhum ou varios ITEM (0,N)


**ESTOQUE_DO_ITEM é _gerenciado_ por VENDEDOR**

- O ESTOQUE_DO_ITEM pode ser gerenciado por apenas um VENDEDOR (1,1)
- O VENDEDOR pode gerenciar um ou vários ESTOQUE_DO_ITEM (1,N)


**ITEM é _recompensa_ de ZONA_ARMADILHA**

- O ITEM pode ser recompensa de nenhuma ou várias ZONA_ARMADILHA (0,N)
- ZONA_ARMADILHA pode ter como recompensa nenhum ou um ITEM (0,1)


**STATUS_DO_ALIEN _armazena_ ALIEN**

- O STATUS_DO_ALIEN armazena apenas um ALIEN (1,1)
- O ALIEN pode ser armazenado em um ou vários STATUS_DO_ALIEN (1,N)


**MONSTRO _possui_ INSTACIA_MONSTRO**

- O MONSTRO possui uma ou várias INSTACIA_MONSTRO (1,N)
- A INSTACIA_MONSTRO pode possuir apenas um MONSTRO (1,1)


**INSTANCIA_MONSTRO _está_ em INSTANCIA_ZONA_DE_GUERRA**

- A INSTACIA_MONSTRO pode estar em apenas uma INSTANCIA_ZONA_DE_GUERRA (1,1)
- A INSTANCIA_ZONA_DE_GUERRA tem um ou várias INSTACIA_MONSTRO (1,N)


**INSTANCIA_ZONA_DE_GUERRA é _atrelada_ a ZONA_DE_GUERRA**

- A INSTANCIA_ZONA_DE_GUERRA pode estar atrelada a apenas uma ZONA_DE_GUERRA (1,1)
- A ZONA_DE_GUERRA pode atrelar nehuma ou várias INSTANCIA_ZONA_DE_GUERRA (1,N)


**SALA é _contida_ em REGIAO**

- A SALA pode estar contida em apenas uma REGIAO (1,1)
- A REGIAO pode conter uma ou várias SALA (1,N)


**NPC _contem_ INSTANCIA_NPC_NA_SALA**

- O NPC pode conter uma ou várias INSTANCIA_NPC_NA_SALA (1,N)
- A INSTANCIA_NPC_NA_SALA pode conter apenas um NPC (1,1)


**INSTANCIA_NPC_NA_SALA _está_ em SALA**

- A INSTANCIA_NPC_NA_SALA pode estar em apenas uma SALA (1,1)
- A SALA pode ter nenhuma ou várias INSTANCIA_NPC_NA_SALA (0,N)

**ESPECIE _possui_ HABILIDADE**

- A ESPECIE pode possuir apenas uma HABILIDADE (1,1)
- A HABILIDADE pode ser possuída por nenhuma ou várias ESPECIE (0,N)


## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 7. Modelagem de dados usando o modelo Entidade-Relacionamento (ER), página 131 e 132.

> <a id="REF2" href="#anchor_2">2.</a> SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. Database system concepts. 6. ed. New York: McGraw-Hill, 2011. Capítulo 7. Database Design and the E-R Model, tópico 7.1 Overview of the Design Process, página 259 e 260.

## <a>Bibliografia</a>

> Modelo Entidade Relacionamento Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-01/MER_StardewValley_v1.0.md>. Acesso em 20 de julho de 2024.

> Modelo Entidade Relacionamento One Shot. Disponível em: <https://sbd1.github.io/2023.2-OneShot/documentos/modelagem/modelo-conceitual/>. Acesso em 20 de julho de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 20/07| Criando documento e adicionando entidades, relacionamentos e atributos | [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|
| `1.1` | 19/08 | Atualizando MER| [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|
| `1.2` | 04/09 | Adicionando npc_nome ao mer| [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|