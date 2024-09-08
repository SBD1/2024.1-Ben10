CREATE TYPE efeito_armadilha AS ENUM (
    'reducao_dano_arma_metade',
    'reducao_dano_arma',
    'reducao_vida_metade',
    'reducao_vida',
    'remocao_armadura',
    'remocao_camuflagem',
    'remocao_jato'
);

CREATE TYPE tipo_status AS ENUM ('buff_dano', 'critico', 'imunidade', 'vida_extra', 'cura');
CREATE TYPE tipo_status_missao AS ENUM ('completa', 'em progresso');
CREATE TYPE tipo_habilidade AS ENUM ('dano', 'cura');


CREATE TABLE ESPECIE (
    nome VARCHAR(30) PRIMARY KEY,
    tipo_especie VARCHAR(30) NOT NULL
);

CREATE TABLE ITEM (
    nome_item VARCHAR(30) PRIMARY KEY,
    tipo_item VARCHAR(30) NOT NULL
);


CREATE TABLE REGIAO (
    nome_regiao VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL
);

CREATE TABLE MISSAO (
    id_missao INT PRIMARY KEY,
    nome_missao VARCHAR(50) NOT NULL,
    experiencia INT NOT NULL,
    descricao TEXT NOT NULL,
    recompensa_em_moedas INT NOT NULL,
    tipo_missao VARCHAR(20) NOT NULL
);

CREATE TABLE NPC (
    id_npc INT PRIMARY KEY,
    nome_npc VARCHAR(30) NOT NULL,
    dialogo_associado_venda TEXT,
    id_missao_associada INT,
    FOREIGN KEY (id_missao_associada) REFERENCES MISSAO(id_missao)
);

CREATE TABLE HABILIDADE (
    nome_especie VARCHAR(30) NOT NULL,
    nome_habilidade VARCHAR(30) NOT NULL,
    efeito tipo_habilidade NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (nome_especie, nome_habilidade),
    FOREIGN KEY (nome_especie) REFERENCES ESPECIE(nome)
);

CREATE TABLE ALIEN (
    nome VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL,
    saude INT NOT NULL,
    defesa INT NOT NULL,
    status_base INT NOT NULL,
    FOREIGN KEY (nome) REFERENCES ESPECIE(nome)
);

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

CREATE TABLE SALA (
    id_sala INT PRIMARY KEY,
    nome_regiao VARCHAR(30),
    id_pre_req_missao INT,
    tipo_sala VARCHAR(30) NOT NULL,
    FOREIGN KEY (nome_regiao) REFERENCES REGIAO(nome_regiao),
    FOREIGN KEY (id_pre_req_missao) REFERENCES MISSAO(id_missao)
);

CREATE TABLE PERSONAGEM (
    id_personagem SERIAL PRIMARY KEY,
    quantidade_moedas INT NOT NULL,
    nome_alien VARCHAR(30),
    nome VARCHAR(30) NOT NULL,
    id_sala INT,
    saude INT NOT NULL CHECK (saude >= 0),
    nivel INT NOT NULL,
    FOREIGN KEY (nome_alien) REFERENCES ALIEN(nome),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

CREATE TABLE STATUS_DO_ALIEN (
    nome_alien VARCHAR(30) NOT NULL,
    saude INT NOT NULL,
    id_personagem INT NOT NULL,
    PRIMARY KEY (nome_alien, id_personagem),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem)
);

CREATE TABLE INSTANCIA_MONSTRO (
    id_monstro SERIAL PRIMARY KEY,
    nome_especie VARCHAR(30),
    saude_atual INT NOT NULL,
    FOREIGN KEY (nome_especie) REFERENCES ESPECIE(nome)
);

CREATE TABLE INSTANCIA_ZONA_GUERRA (
    id_zona_guerra INT,
    id_personagem INT,
    id_monstro INT,
    PRIMARY KEY(id_zona_guerra, id_personagem, id_monstro),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_monstro) REFERENCES INSTANCIA_MONSTRO(id_monstro),
    FOREIGN KEY (id_zona_guerra) REFERENCES SALA(id_sala)
);

CREATE TABLE ZONA_DE_GUERRA (
    id_sala INT PRIMARY KEY,
    dificuldade INT NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

CREATE TABLE ZONA_DE_ARMADILHA (
    id_sala INT PRIMARY KEY,
    fator INT NOT NULL,
    tipo efeito_armadilha NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

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

CREATE TABLE INSTANCIA_NPC_NA_SALA (
    id_sala INT,
    id_npc INT,
    PRIMARY KEY (id_sala, id_npc),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala),
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
);

CREATE TABLE PRE_REQUISITO (
    id_missao INT,
    id_pre_requisito INT,
    PRIMARY KEY (id_missao, id_pre_requisito),
    FOREIGN KEY (id_pre_requisito) REFERENCES MISSAO(id_missao),  -- id_pre_requisito se refere a uma missão existente
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)  -- id_missao se refere à missão principal
);

CREATE TABLE CACA (
    id_missao INT PRIMARY KEY,
    quantidade_monstros INT NOT NULL,
    dificuldade_monstro INT NOT NULL,
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)
);

CREATE TABLE ENTREGA (
    id_missao INT PRIMARY KEY,
    nome_item VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)
);

CREATE TABLE REGISTRO_DA_MISSAO (
    id_personagem INT,
    id_missao INT,
    status tipo_status_missao NOT NULL,
    quantidade_monstros INT,
    PRIMARY KEY (id_personagem, id_missao),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)
);

CREATE TABLE CONSUMIVEL (
    nome_item VARCHAR(30) PRIMARY KEY, 
    preco INT NOT NULL,     
    status tipo_status NOT NULL,
    valor_consumivel INT NOT NULL,
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
);

CREATE TABLE ARMA (
    nome_item VARCHAR(30) PRIMARY KEY,
    preco INT NOT NULL, 
    dano INT NOT NULL,
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
);

CREATE TABLE INVENTARIO (
    id_personagem INT,
    id_item SERIAL,
    nome_item VARCHAR(30),
    PRIMARY KEY (id_personagem, id_item),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
);

CREATE TABLE ESTOQUE_DO_ITEM (
    nome_item VARCHAR(30),
    id_npc INT,
    preco INT NOT NULL,
    PRIMARY KEY (nome_item, id_npc),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item),
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
);

ALTER TABLE PERSONAGEM
ADD COLUMN arma VARCHAR(30);

ALTER TABLE PERSONAGEM
ADD CONSTRAINT fk_arma
FOREIGN KEY (arma) REFERENCES ARMA(nome_item);