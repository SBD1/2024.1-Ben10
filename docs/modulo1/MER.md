# Modelo Entidade Relacionamento

## <a>Introdução</a>

Segundo Elmasri e Navathe<a id="anchor_1" href="#REF1">^1^</a>, a modelagem conceitual é uma etapa essencial no desenvolvimento de uma aplicação de banco de dados bem-sucedida. Essa fase abrange o design de estruturas e restrições do banco de dados, além da criação de programas que realizam consultas e atualizações. A modelagem conceitual não apenas facilita a compreensão e o planejamento do banco de dados, mas também garante que as operações sejam eficientes e seguras.

O Modelo Entidade-Relacionamento (MER) é uma ferramenta popular de alto nível utilizada no design conceitual de bancos de dados. O MER foca na identificação de entidades, relacionamentos e atributos, ajudando a criar um esquema claro e estruturado do banco de dados. Essa metodologia permite a visualização das interações entre diferentes elementos do sistema, promovendo um entendimento detalhado das necessidades do banco de dados antes da implementação física.<a id="anchor_2" href="#REF2">^2^</a>

## <a>Objetivo</a>

Este documento tem como objetivo detalhar as entidades, atributos e relacionamentos no contexto do Modelo Entidade-Relacionamento (MER). 
A representação gráfica deste modelo pode ser vista no artefato [DER](https://sbd1.github.io/2024.1-Ben10/modulo1/DER/).

## <a>Modelo Entidade Relacionamento/a>

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

### <a>Atributos</a>

- **PERSONAGEM**: <ins>id_personagem</ins>, nome, nivel, saude, id_sala, nome_alien, quantidade_moedas;
- **STATUS_DO_ALIEN**: <ins>nome_alien</ins>, saude;
- **ESPECIE**: <ins>nome</ins>, status_base, saude, defesa, habilidade;
- **ALIEN**: terceira_habilidade, segunda_habilidade;
- **MONSTRO**: id_recompensa, dificuldade, recompensa_em_moedas;
- **INSTANCIA_MONSTRO**: <ins>id_monstro</ins>, saude_atual, nome_especie;
- **INSTANCIA_ZONA_GUERRA**: <ins>id_monstro</ins>, <ins>id_zona_guerra</ins>, <ins>id_personagem</ins>;
- **ZONA_DE_GUERRA**: dificuldade;
- **SALA**: <ins>id_sala</ins>, nome_regiao, id_pre_req_missao
- **ZONA_DE_ARMADILHA**: fator, tipo;
- **INSTANCIA_NPC_NA_SALA**: <ins>id_sala</ins>, <ins>id_npc</ins>;
- **NPC**: <ins>id_npc</ins>;
- **VENDEDOR**: dialogo_associado_venda
- **GUIA_DE_MISSOES**: <ins>id_missao_associada</ins>;
- **MISSAO**: <ins>id_missao</ins>, nome_missao, descricao, experiencia, recompensa_em_moedas
- **REGISTRO_DA_MISSAO**: <ins>id_missao</ins>, status;
- **INVENTARIO**: id_item, nome_item;
- **ESTOQUE_DO_ITEM**: <ins>nome_item</ins>, preco;
- **ITEM**: <ins>nome</ins>, preco;
- **ARMA**: dano;
- **CONSUMIVEL**: status, valor_consumivel;

### <a>Relacionamentos</a>

**PERSONAGEM é _contido_ em INSTACIA_ZONA_DE_GUERRA**
- O PERSONAGEM pode ser contido em nenhuma ou varias INSTACIA_ZONA_DE_GUERRA (O,N)
- A INSTACIA_ZONA_DE_GUERRA contém apenas um personagem (1,1)

**PERSONAGEM _possui_ STATUS_DO_ALIEN**
- O PERSONAGEM possui um ou varios STATUS_DO_ALIEN (1,N)
- O STATUS_DO_ALIEN é possuído por apenas um PERSONAGEM (1,1)

**PERSONAGEM _contém_ INVENTARIO**
- O PERSONAGEM contem apenas um INVENTARIO (1,1)
- O INVENTARIO é contido por apenas um PERSONAGEM(1,1)

**INVENTARIO _inclui_ ITEM**
- O INVENTARIO pode incluir nenhum ou varios ITEM (0,N)
- O ITEM é incluso em nenhum ou varios INVENTARIO (0,N)




## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 7. Modelagem de dados usando o modelo Entidade-Relacionamento (ER), página 131 e 132.

> <a id="REF2" href="#anchor_2">2.</a> SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. Database system concepts. 6. ed. New York: McGraw-Hill, 2011. Capítulo 7. Database Design and the E-R Model, tópico 7.1 Overview of the Design Process, página 259 e 260.

## <a>Bibliografia</a>

> Modelo Entidade Relacionamento Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-01/MER_StardewValley_v1.0.md>. Acesso em 20 de julho de 2024.

> Modelo Entidade Relacionamento One Shot. Disponível em: <https://sbd1.github.io/2023.2-OneShot/documentos/modelagem/modelo-conceitual/>. Acesso em 20 de julho de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 20/07| Criando documento e adicionando entidades, relacionamentos e atributos | João Artur | Eric Silveira