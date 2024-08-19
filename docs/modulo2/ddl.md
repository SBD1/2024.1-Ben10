??? "Tabela: PERSONAGEM"
    #### PERSONAGEM

    ```sql
    CREATE TABLE PERSONAGEM (
    id_personagem INT PRIMARY KEY,
    quantidade_moedas INT NOT NULL,
    nome_alien VARCHAR(30),
    nome VARCHAR(30) NOT NULL,
    id_sala INT,
    saude INT NOT NULL,
    nivel INT NOT NULL,
    FOREIGN KEY (nome_alien) REFERENCES ALIEN(nome),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
    );
    ```

??? "Tabela: ESPECIE"
    #### ESPECIE

    ```sql
    CREATE TABLE ESPECIE (
    nome VARCHAR(30) PRIMARY KEY,
    tipo_especie VARCHAR(30) NOT NULL
    );
    ```

??? "Tabela: ITEM"
    #### ITEM

    ```sql
    CREATE TABLE ITEM (
    nome_item VARCHAR(30) PRIMARY KEY,
    tipo_item VARCHAR(30) NOT NULL
    );
    ```

??? "Tabela: REGIAO"
    #### REGIAO

    ```sql
    CREATE TABLE REGIAO (
    nome_regiao VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL
    );
    ```

??? "Tabela: MISSAO"
    #### MISSAO

    ```sql
    CREATE TABLE MISSAO (
    id_missao INT PRIMARY KEY,
    nome_missao VARCHAR(30) NOT NULL,
    experiencia INT NOT NULL,
    descricao TEXT NOT NULL,
    recompensa_em_moedas INT NOT NULL
    );
    ```

??? "Tabela: NPC"
    #### NPC

    ```sql
    CREATE TABLE NPC (
    id_npc INT PRIMARY KEY,
    dialogo_associado_venda TEXT,
    id_missao_associada INT,
    FOREIGN KEY (id_missao_associada) REFERENCES MISSAO(id_missao)
    );
    ```

??? "Tabela: HABILIDADE"
    #### HABILIDADE

    ```sql
    CREATE TABLE HABILIDADE (
    nome_especie VARCHAR(30) NOT NULL,
    nome_habilidade VARCHAR(30) NOT NULL,
    efeito tipo_habilidade NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (nome_especie, nome_habilidade),
    FOREIGN KEY (nome_especie) REFERENCES ESPECIE(nome)
    );
    ```

??? "Tabela: ALIEN"
    #### ALIEN

    ```sql
    CREATE TABLE ALIEN (
    nome VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL,
    saude INT NOT NULL,
    defesa INT NOT NULL,
    status_base INT NOT NULL,
    FOREIGN KEY (nome) REFERENCES ESPECIE(nome)
    );
    ```

??? "Tabela: MONSTRO"
    #### MONSTRO

    ```sql
    CREATE TABLE MONSTRO (
    nome VARCHAR(30) PRIMARY KEY,
    id_recompensa VARCHAR(30),
    dificuldade INT NOT NULL,
    recompensa_em_moedas INT NOT NULL,
    saude INT NOT NULL,
    defesa INT NOT NULL,
    status_base INT NOT NULL,
    FOREIGN KEY (nome) REFERENCES ESPECIE(nome),
    FOREIGN KEY (id_recompensa) REFERENCES ITEM(nome_item)
    );
    ```

??? "Tabela: SALA"
    #### SALA

    ```sql
    CREATE TABLE SALA (
    id_sala INT PRIMARY KEY,
    nome_regiao VARCHAR(30),
    id_pre_req_missao INT,
    tipo_sala VARCHAR(30) NOT NULL,
    FOREIGN KEY (nome_regiao) REFERENCES REGIAO(nome_regiao),
    FOREIGN KEY (id_pre_req_missao) REFERENCES MISSAO(id_missao)
    );
    ```

??? "Tabela: STATUS_DO_ALIEN"
    #### STATUS_DO_ALIEN

    ```sql
    CREATE TABLE STATUS_DO_ALIEN (
    nome_alien VARCHAR(30) NOT NULL,
    saude INT NOT NULL,
    id_personagem INT NOT NULL,
    PRIMARY KEY (nome_alien, id_personagem),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem)
    );
    ```

??? "Tabela: INSTANCIA_MONSTRO"
    #### INSTANCIA_MONSTRO

    ```sql
    CREATE TABLE INSTANCIA_MONSTRO (
    id_monstro INT PRIMARY KEY,
    nome_especie VARCHAR(30),
    saude_atual INT NOT NULL,
    FOREIGN KEY (nome_especie) REFERENCES ESPECIE(nome)
    );
    ```

??? "Tabela: INSTANCIA_ZONA_GUERRA"
    #### INSTANCIA_ZONA_GUERRA

    ```sql
    CREATE TABLE INSTANCIA_ZONA_GUERRA (
    id_zona_guerra INT,
    id_personagem INT,
    id_monstro INT,
    PRIMARY KEY(id_zona_guerra, id_personagem, id_monstro),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_monstro) REFERENCES INSTANCIA_MONSTRO(id_monstro),
    FOREIGN KEY (id_zona_guerra) REFERENCES SALA(id_sala)
    );
    ```

??? "Tabela: ZONA_DE_GUERRA"
    #### ZONA_DE_GUERRA

    ```sql
    CREATE TABLE ZONA_DE_GUERRA (
    id_sala INT PRIMARY KEY,
    dificuldade INT NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
    );
    ```

??? "Tabela: ZONA_DE_ARMADILHA"
    #### ZONA_DE_ARMADILHA

    ```sql
    CREATE TABLE ZONA_DE_ARMADILHA (
    id_sala INT PRIMARY KEY,
    fator INT NOT NULL,
    tipo tipo_reducao_acrescimo NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
    );
    ```

??? "Tabela: RECOMPENSA"
    #### RECOMPENSA

    ```sql
    CREATE TABLE RECOMPENSA (
    id_personagem INT,
    id_sala INT,
    nome_item VARCHAR(30),
    recompensa_recebida INT NOT NULL,
    PRIMARY KEY (id_personagem, id_sala),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_sala) REFERENCES ZONA_DE_ARMADILHA(id_sala)
    );
    ```

??? "Tabela: INSTANCIA_NPC_NA_SALA"
    #### INSTANCIA_NPC_NA_SALA

    ```sql
    CREATE TABLE INSTANCIA_NPC_NA_SALA (
    id_sala INT,
    id_npc INT,
    PRIMARY KEY (id_sala, id_npc),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala),
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
    );
    ```

??? "Tabela: PRE_REQUISITO"
    #### PRE_REQUISITO

    ```sql
    CREATE TABLE PRE_REQUISITO (
    id_missao INT,
    id_pre_requisito INT,
    PRIMARY KEY (id_missao, id_pre_requisito),
    FOREIGN KEY (id_pre_requisito) REFERENCES MISSAO(id_missao),  -- id_pre_requisito se refere a uma missão existente
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)  -- id_missao se refere à missão principal
    );
    ```

??? "Tabela: REGISTRO_DA_MISSAO"
    #### REGISTRO_DA_MISSAO

    ```sql
    CREATE TABLE REGISTRO_DA_MISSAO (
    id_personagem INT,
    id_missao INT,
    status tipo_status_missao NOT NULL,
    PRIMARY KEY (id_personagem, id_missao),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)
    );
    ```

??? "Tabela: CONSUMIVEL"
    #### CONSUMIVEL

    ```sql
    CREATE TABLE CONSUMIVEL (
    nome_item VARCHAR(30) PRIMARY KEY, 
    preco INT NOT NULL,     
    status tipo_status NOT NULL,
    valor_consumivel INT NOT NULL,
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
    );
    ```

??? "Tabela: ARMA"
    #### ARMA

    ```sql
    CREATE TABLE ARMA (
    nome_item VARCHAR(30) PRIMARY KEY,
    preco INT NOT NULL, 
    dano INT NOT NULL,
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
    );
    ```

??? "Tabela: INVENTARIO"
    #### INVENTARIO

    ```sql
    CREATE TABLE INVENTARIO (
    id_personagem INT,
    id_item INT,
    nome_item VARCHAR(30),
    PRIMARY KEY (id_personagem, id_item),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
    );
    ```

??? "Tabela: ESTOQUE_DO_ITEM"
    #### ESTOQUE_DO_ITEM

    ```sql
    CREATE TABLE ESTOQUE_DO_ITEM (
    nome_item VARCHAR(30),
    id_npc INT,
    preco INT NOT NULL,
    PRIMARY KEY (nome_item, id_npc),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item),
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
    );
    ```

## <a>Bibliografia</a>

> DDL Relacionamento Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-02/DDL.sql>. Acesso em 13 de agosto de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 19/08 | Criando documento e adicionando DDL | [Arthur Alves](https://github.com/arthrok) | [Eric Silveira](https://github.com/ericbky)|
