CREATE SCHEMA IF NOT EXISTS public;

SET search_path TO public;

CREATE TYPE IF NOT EXISTS tipo_reducao_acrescimo AS ENUM ('redução', 'acréscimo');
CREATE TYPE IF NOT EXISTS tipo_status AS ENUM ('ativo', 'inativo');
CREATE TYPE IF NOT EXISTS tipo_status_missao AS ENUM ('incompleta', 'completa', 'em progresso');

CREATE TABLE IF NOT EXISTS public.ESPECIE (
    nome VARCHAR(30) PRIMARY KEY,
    saude INT NOT NULL,
    habilidade INT NOT NULL,
    defesa INT NOT NULL,
    status_base INT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.ITEM (
    nome_item VARCHAR(30) PRIMARY KEY,
    preco INT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.NPC (
    id_npc INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS public.REGIAO (
    nome_regiao VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.MISSAO (
    id_missao INT PRIMARY KEY,
    nome_missao VARCHAR(30) NOT NULL,
    experiencia INT NOT NULL,
    descricao TEXT NOT NULL,
    recompensa_em_moedas INT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.ALIEN (
    nome VARCHAR(30) PRIMARY KEY,
    primeira_habilidade VARCHAR(30) NOT NULL,
    segunda_habilidade VARCHAR(30) NOT NULL,
    FOREIGN KEY (nome) REFERENCES ESPECIE(nome)
);

CREATE TABLE IF NOT EXISTS public.MONSTRO (
    nome VARCHAR(30) PRIMARY KEY,
    id_recompensa VARCHAR(30), -- Mudança de INT para VARCHAR(30)
    dificuldade INT NOT NULL,
    recompensa_em_moedas INT NOT NULL,
    FOREIGN KEY (nome) REFERENCES ESPECIE(nome),
    FOREIGN KEY (id_recompensa) REFERENCES ITEM(nome_item) -- Ajuste para referenciar o nome_item
);

CREATE TABLE IF NOT EXISTS public.SALA (
    id_sala INT PRIMARY KEY,
    nome_regiao VARCHAR(30),
    id_pre_req_missao INT,
    FOREIGN KEY (nome_regiao) REFERENCES REGIAO(nome_regiao),
    FOREIGN KEY (id_pre_req_missao) REFERENCES MISSAO(id_missao)
);

CREATE TABLE IF NOT EXISTS public.PERSONAGEM (
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

CREATE TABLE IF NOT EXISTS public.STATUS_DO_ALIEN (
    nome_alien VARCHAR(30) NOT NULL,
    saude INT NOT NULL,
    id_personagem INT NOT NULL,
    PRIMARY KEY (nome_alien, id_personagem),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem)
);

CREATE TABLE IF NOT EXISTS public.INSTANCIA_MONSTRO (
    id_monstro INT PRIMARY KEY,
    nome_especie VARCHAR(30),
    saude_atual INT NOT NULL,
    FOREIGN KEY (nome_especie) REFERENCES ESPECIE(nome)
);

CREATE TABLE IF NOT EXISTS public.INSTANCIA_ZONA_GUERRA (
    id_zona_guerra INT,
    id_personagem INT,
    id_monstro INT,
    PRIMARY KEY(id_zona_guerra, id_personagem, id_monstro),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_monstro) REFERENCES INSTANCIA_MONSTRO(id_monstro),
    FOREIGN KEY (id_zona_guerra) REFERENCES SALA(id_sala)
);

CREATE TABLE IF NOT EXISTS public.ZONA_DE_GUERRA (
    id_sala INT PRIMARY KEY,
    dificuldade INT NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

CREATE TABLE IF NOT EXISTS public.ZONA_DE_ARMADILHA (
    id_sala INT PRIMARY KEY,
    fator INT NOT NULL,
    tipo tipo_reducao_acrescimo NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

CREATE TABLE IF NOT EXISTS public.RECOMPENSA (
    id_personagem INT,
    id_sala INT,
    nome_item VARCHAR(30),
    recompensa_recebida INT NOT NULL,
    PRIMARY KEY (id_personagem, id_sala),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

CREATE TABLE IF NOT EXISTS public.INSTANCIA_NPC_NA_SALA (
    id_sala INT,
    id_npc INT,
    PRIMARY KEY (id_sala, id_npc),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala),
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
);

CREATE TABLE IF NOT EXISTS public.GUIA_DE_MISSOES (
    id_npc INT PRIMARY KEY,
    id_missao_associada INT,
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc),
    FOREIGN KEY (id_missao_associada) REFERENCES MISSAO(id_missao)
);

CREATE TABLE IF NOT EXISTS public.VENDEDOR (
    id_npc INT PRIMARY KEY,
    dialogo_associado_venda TEXT NOT NULL,
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
);

CREATE TABLE IF NOT EXISTS public.PRE_REQUISITO (
    id_missao INT,
    id_pre_requisito INT,
    PRIMARY KEY (id_missao, id_pre_requisito),
    FOREIGN KEY (id_pre_requisito) REFERENCES MISSAO(id_missao),  -- id_pre_requisito se refere a uma missão existente
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)  -- id_missao se refere à missão principal
);

CREATE TABLE IF NOT EXISTS public.REGISTRO_DA_MISSAO (
    id_personagem INT,
    id_missao INT,
    status tipo_status_missao NOT NULL,
    PRIMARY KEY (id_personagem, id_missao),
    FOREIGN KEY (id_personagem) REFERENCES PERSONAGEM(id_personagem),
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)
);

CREATE TABLE IF NOT EXISTS public.CONSUMIVEL (
    nome_item VARCHAR(30) PRIMARY KEY,      
    status tipo_status NOT NULL,
    valor_consumivel INT NOT NULL,
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
);

CREATE TABLE IF NOT EXISTS public.ARMA (
    nome_item VARCHAR(30) PRIMARY KEY,
    status tipo_status NOT NULL,
    dano INT NOT NULL,
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
);

CREATE TABLE IF NOT EXISTS public.INVENTARIO (
    id_personagem INT,
    id_item INT,
    nome_item VARCHAR(30),
    PRIMARY KEY (id_personagem, id_item),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item)
);

CREATE TABLE IF NOT EXISTS public.ESTOQUE_DO_ITEM (
    nome_item VARCHAR(30),
    id_npc INT,
    preco INT NOT NULL,
    PRIMARY KEY (nome_item, id_npc),
    FOREIGN KEY (nome_item) REFERENCES ITEM(nome_item),
    FOREIGN KEY (id_npc) REFERENCES NPC(id_npc)
);