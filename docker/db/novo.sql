-- Inserir item na tabela ITEM
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Espada de Bog Kah', 'Arma');

INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Lança de Azshara', 'Arma');

-- Inserir arma na tabela ARMA
INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Espada de Bog Kah', 6000, 40);

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Lança de Azshara', 7000, 90);

-- Inserir regiões na tabela REGIAO 
INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Selvatrama', 'Floresta tropical do Planeta Eugera, conhecida por guardar muitos segredos');
INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Templo de Azshara', 'Um antigo templo, cheio de segredos e perigos');
INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Nave do Vilgax', 'Nave principal do exército de Vilgax');

-- Inserção de missões na tabela MISSAO com o tipo de missão especificado
-- regiao 1
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (1, 'Derrote a patrulha de Vilgax', 75, 'Vilgax não sabe que estamos no planeta, garanta que permaneça assim', 300, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (2, 'Recupere a Espada de Bog Kah', 150, 'A Espada de Bog Kah, tem um mapa entalhado na lâmina, talvez ele leva ao templo que Vilgax está procurando', 400, 'Entrega');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (3, 'Derrote os monstros da selva', 150, 'A selva possui muitos perigos, tome cuidado', 300, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (4, 'Entregue os suprimentos ao vilarejo', 200, 'Quando chegou ao planeta, Vilgax trouxe muita destruição, ajude os habitantes do planeta e leve suprimentos médicos', 1000, 'Entrega');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (5, 'Proteja o vilarejo', 250, 'Vilgax enviou tropas para investigar a área, defenda o vilarejo', 1000, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (6, 'Derrote o guarda do templo ', 350, 'Vilgax localizou o templo e deixou um guarda em sua porta, derrote-o', 1000, 'CACA');
-- regiao 2
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (7, 'Derrote os guardas de elite', 350, 'Guardas de elite estão aqui para nos parar, derrote-os', 1300, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (8, 'Entregue a Lança de Azshara', 350, 'Assim como a espada que nos trouxe até aqui, a lança pode ter informaçoes de como devemos seguir no templo', 1300, 'Entrega');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (9, 'Derrote os guardas do templo', 400, 'Algumas estátuas estão ganhando vida, cuide delas', 2000, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (10, 'Derrote o Capitão', 500, 'Vilgax mandou um de seus capitães explorar o templo, pare ele', 2500, 'CACA');
-- regiao 3
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (11, 'Derrote os guardas da nave', 500, 'A nave está cheia de soldados, cuide deles', 2500, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (12, 'Derrote o General do Exército', 500, 'Acabe com o comandante das forças de Vilgax', 2500, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (13, 'Derrote o Guarda-Costas', 700, 'O Guarda-Costas é a única coisa que separa você de Vilgax, acabe com ele', 5000, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (14, 'Derrote Vilgax', 3000, 'Vilgax está na sala de comando, derrote-o', 10000, 'CACA');

-- Inserção de pre-requisitos das missões na tabela PRE_REQUISITO
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (2, 1);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (3, 1);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (4, 3);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (5, 4);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (6, 3);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (7, 6);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (8, 7);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (9, 8);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (10, 8);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (11, 10);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (12, 11);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (13, 12);
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (14, 13);

-- inserção na tabela ENTREGA
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (2, 'Espada de Bog Kah');
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (4, 'Kit Médico');
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (8, 'Lança de Azshara');

-- inserção na tabela CACA
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (1, 5, 1);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (3, 7, 2);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (5, 7, 3);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (6, 1, 4);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (7, 8, 5);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (9, 7, 6);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (10, 1, 7);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (11, 15, 5);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (12, 1, 8);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (13, 1, 9);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (14, 1, 10);


-- Inserir as espécies dos monstros na tabela ESPECIE
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Patrulheiro de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Fera da Selva', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Soldado de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Guarda do Templo', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Guarda de Elite', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Estátua Viva', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Capitão do Exército', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('General Khartosh', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Guarda-Costas de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Vilgax', 'Monstro');

-- Inserir os monstros na tabela MONSTRO
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Patrulheiro de Vilgax', 'Campo de Força Portátil', 1, 50, 200, 40, 30);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Fera da Selva', 'Kit Médico', 2, 80, 300, 50, 40);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Soldado de Vilgax', 'Placa de Armadura', 3, 100, 250, 60, 50);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda do Templo', 'Espada Proto-Arma', 4, 150, 400, 70, 60);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda de Elite', 'Granada Inibidora', 5, 300, 90, 70);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Estátua Viva', 'Jato de Fuga', 6, 400, 100, 80);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Capitão do Exército', 'Camuflagem Alienígena', 7, 500, 110, 90);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('General Khartosh', 'Pistola dos Encanadores', 8, 700, 130, 110);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda-Costas de Vilgax', 'Arma Tennyson', 9, 1000, 150, 130);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Vilgax', 'Arma Tennyson', 10, 10000, 200, 170);


-- Salas da região Selvatrama (1 a 20)
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (1, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (2, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (3, 'Selvatrama', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (4, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (5, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (6, 'Selvatrama', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (7, 'Selvatrama', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (8, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (9, 'Selvatrama', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (10, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (11, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (12, 'Selvatrama', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (13, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (14, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (15, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (16, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (17, 'Selvatrama', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (18, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (19, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (20, 'Selvatrama', 'Zona de Guerra');

-- Salas da região Templo de Azshara (21 a 40)
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (21, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (22, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (23, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (24, 'Templo de Azshara', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (25, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (26, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (27, 'Templo de Azshara', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (28, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (29, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (30, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (31, 'Templo de Azshara', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (32, 'Templo de Azshara', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (33, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (34, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (35, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (36, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (37, 'Templo de Azshara', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (38, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (39, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (40, 'Templo de Azshara', 'Zona de Guerra');

-- Salas da região Nave do Vilgax (41 a 60)
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (41, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (42, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (43, 'Nave do Vilgax', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (44, 'Nave do Vilgax', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (45, 'Nave do Vilgax', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (46, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (47, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (48, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (49, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (50, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (51, 'Nave do Vilgax', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (52, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (53, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (54, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (55, 'Nave do Vilgax', 'Zona de Armadilha');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (56, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (57, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (58, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (59, 'Nave do Vilgax', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) VALUES (60, 'Nave do Vilgax', 'Zona de Guerra');

-- Zonas de Armadilha na região Selvatrama
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (3, 2, 'acréscimo');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (6, 2, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (7, 2, 'acréscimo');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (9, 3, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (12, 3, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (17, 3, 'acréscimo');

-- Zonas de Armadilha na região Templo de Azshara
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (24, 4, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (27, 4, 'acréscimo');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (31, 4, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (32, 5, 'acréscimo');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (37, 5, 'redução');

-- Zonas de Armadilha na região Nave do Vilgax
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (43, 7, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (44, 7, 'acréscimo');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (45, 7, 'redução');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (51, 8, 'acréscimo');
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) VALUES (55, 9, 'redução');




-- Zonas de Guerra na primeira região
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (1, 1, 'A entrada está tranquila, mas não abaixe a guarda.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (2, 1, 'Você pode ouvir patrulhas de Vilgax ao longe.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (4, 2, 'Tropas de reconhecimento de Vilgax estão rondando a área.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (5, 2, 'Há sinais de uma recente batalha, prepare-se.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (8, 2, 'A área parece deserta, mas cuidado com emboscadas.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (10, 2, 'Você encontrou um ponto estratégico de defesa, mas não está seguro.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (11, 1, 'Os escombros indicam que este local foi palco de uma recente invasão.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (13, 3, 'Você está se aproximando do centro do conflito.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (14, 3, 'Guerras antigas foram travadas aqui, e agora você está no meio de mais uma.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (15, 3, 'Vilgax instalou uma base provisória aqui.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (16, 3, 'A resistência de Vilgax está aumentando à medida que você avança.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (18, 3, 'Os inimigos parecem estar mais organizados nesta área.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (19, 3, 'Vários grupos de soldados estão em patrulha.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (20, 4, 'Um grande contingente de tropas está estacionado aqui.');

-- Zonas de Guerra na região Templo de Azshara
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (21, 5, 'Você chegou às ruínas do templo!');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (22, 5, 'O templo está fortemente vigiado, todo passo é uma ameaça.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (23, 6, 'As estátuas do templo começam a se mexer, um mau presságio');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (25, 5, 'Os caminhos são traiçoeiros e guardados por sentinelas.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (26, 6, 'Uma aura poderosa e opressora emana das profundezas do templo.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (28, 5, 'Os guardiões do templo protegem ferozmente este local sagrado.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (29, 5, 'Você está perto do centro do templo, mas a resistência ainda é intensa.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (30, 5, 'O salão principal está cercado de inimigos prontos para atacar.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (33, 6, 'Você sente que algo ancestral está prestes a despertar.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (34, 6, 'O coração do templo está perto, mas o perigo é maior do que nunca.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (35, 5, 'Os corredores estão cobertos de armadilhas e guardiões.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (36, 5, 'Relíquias antigas e guardas incansáveis bloqueiam seu caminho.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (38, 6, 'O templo emana uma força que ameaça sua sanidade.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (39, 5, 'A batalha contra o tempo e os guardiões não dá trégua.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (40, 7, 'Você está nas profundezas do templo, onde apenas os mais fortes sobrevivem.');

-- Zonas de Guerra na região Nave do Vilgax
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (41, 5, 'Você invadiu a nave de Vilgax.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (42, 5, 'O corredor está repleto de guardas fortemente armados.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (46, 5, 'Sons metálicos ecoam pela nave, indicando movimento constante de tropas.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (47, 5, 'Você ouve as ordens dos capitães de Vilgax, coordenando os ataques.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (48, 5, 'A nave treme com a movimentação de forças inimigas. A batalha será dura.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (49, 5, 'Você está chegando perto do centro de comando, mas a resistência é feroz.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (50, 5, 'O controle da nave está próximo, mas muitos guardas ainda estão no caminho.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (52, 5, 'O caos reina nos corredores enquanto você enfrenta os últimos obstáculos.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (53, 5, 'As tropas estão concentradas na sala de controle, será uma batalha difícil.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (54, 5, 'O núcleo da nave está perto, protegido por guardas incansáveis.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (56, 8, 'Você sente a presença do general do exército de Vilgax, sua força é esmagadora.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (57, 5, 'Tropas de elite estão entre você e Vilgax, lute com tudo que tem.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (58, 9, 'A batalha final se aproxima, o guarda-costas de Vilgax é um oponente implacável.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (59, 5, 'As últimas defesas da nave estão sendo quebradas.');
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) VALUES (60, 10, 'Você está cara a cara com Vilgax.');




-- NPCs da Região 1
INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (1, 'Azmuth', 'Pronto para começar a missão de derrotar a patrulha de Vilgax?', 1);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (2, 'Tork', 'A Espada de Bog Kah pode levar ao próximo passo na batalha contra Vilgax. Vai recuperá-la?', 2);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (3, 'Zarik', 'A selva está cheia de monstros!', 3);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (4, 'Elara', 'Leve esses suprimentos ao vilarejo, eles precisam de ajuda!', 4);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (5, 'Xander', 'As tropas de Vilgax estão chegando, defenda o vilarejo!', 5);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (6, 'Max', 'O guarda do templo parece ser muito forte', 6);

-- NPCs da Região 2
INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (7, 'Thanos', 'O templo está infestado de guardas de Elite', 7);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (8, 'Kara', 'A Lança de Azshara tem informações valiosas sobre o paradeiro da relíquia, você pode entregá-la?', 8);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (9, 'Darios', 'As estátuas do templo parecem estar se mexendo!', 9);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (10, 'Lucan', 'O Capitão de Vilgax está no templo!', 10);

-- NPCs da Região 3
INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (11, 'Vega', 'A nave está cheia de soldados!', 11);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (12, 'Rogar', 'O General de Vilgax parece muito forte!', 12);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (13, 'Thane', 'O Guarda-Costas está entre você e Vilgax. Está pronto para enfrentá-lo?', 13);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (14, 'Nimue', 'Vilgax está na sala de comando. Esta é sua última chance de derrotá-lo!', 14);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (15, 'Quel Thalas', 'Tenho alguns itens a venda', NULL);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (16, 'Gwendolin', 'Precisando de alguma coisa?', NULL);

INSERT INTO NPC (id_npc, nome_npc, dialogo_associado_venda, id_missao_associada) 
VALUES (17, 'Artoras', 'Seja Bem-vindo a minha loja', NULL);


-- Inserir estoque para NPCs vendedores

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 6, 5000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Arma Tennyson', 6, 25000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Campo de Força Portátil', 6, 8000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Placa de Armadura', 6, 3000);


INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Camuflagem Alienígena', 16, 12000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Projétil Laser', 16, 15000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 16, 5000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Jato de Fuga', 16, 7000);


INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Espada Proto-Arma', 15, 30000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Granada Inibidora', 15, 20000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Pistola dos Encanadores', 15, 18000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Placa de Armadura', 15, 3000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Campo de Força Portátil', 17, 8000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Jato de Fuga', 17, 7000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Projétil Laser', 17, 15000);
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Granada Inibidora', 17, 20000);


-- Inserir dados de NPC na tabela INSTANCIA_NPC_NA_SALA
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (2, 1);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (4, 2);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (8, 3);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (14, 4);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (16, 5);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (19, 6);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (22, 7);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (26, 8);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (34, 9);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (39, 10);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (42, 11);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (50, 12);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (57, 13);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (59, 14);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (10, 15);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (25, 16);
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) VALUES (49, 17);
