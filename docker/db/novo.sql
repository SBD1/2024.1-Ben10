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
VALUES (9, 7, 5);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (10, 1, 6);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (11, 15, 7);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (12, 1, 8);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (13, 1, 9);
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (14, 1, 10);





#### A FAZER #######

-- Inserir as espécies dos monstros na tabela ESPECIE
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Patrulheiro de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Fera da Selva', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Soldado de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Guarda do Templo', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Guarda de Elite de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Estátua Viva', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Capitão de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('General de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome_especie, tipo_especie) VALUES ('Guarda-Costas de Vilgax', 'Monstro');

-- monstros da região 1
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Patrulheiro de Vilgax', 'Campo de Força Portátil', 3, 50, 200, 50, 40);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Fera da Selva', 'Kit Médico', 4, 80, 300, 60, 50);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Soldado de Vilgax', 'Placa de Armadura', 5, 100, 250, 70, 60);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda do Templo', 'Espada Proto-Arma', 6, 150, 400, 90, 80);
-- monstros da região 2
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda de Elite de Vilgax', 'Granada Inibidora', 7, 300, 500, 120, 100);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Estátua Viva', 'Jato de Fuga', 8, 400, 600, 150, 120);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Capitão de Vilgax', 'Camuflagem Alienígena', 9, 500, 800, 200, 150);
-- monstros da região 3
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('General de Vilgax', 'Pistola dos Encanadores', 9, 700, 1000, 250, 200);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda-Costas de Vilgax', 'Arma Tennyson', 9, 1000, 1200, 300, 250);

-- Inserir salas 
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (1, 'Selvatrama', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (1, 'Templo de Azshara', 'Zona de Guerra');
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (1, 'Nave do Vilgax', 'Zona de Guerra');


-- Inserir zonas de guerra na tabela ZONA_DE_GUERRA
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (1, 1, 'Zona de combate contra os Cavaleiros Eternos');

-- Inserir zonas de armadilha na tabela ZONA_DE_ARMADILHA
INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) 
VALUES (2, 3, 'acréscimo');

-- Inserir NPCs na tabela NPC e associar missões e vendas
INSERT INTO NPC (id_npc, dialogo_associado_venda, id_missao_associada) 
VALUES 
    (1, 'Pronto para começar a missão?', 1), -- NPC com missão
    (2, 'Tenho uma missão para você!', 2), -- NPC com missão
    (3, NULL, 3), -- NPC apenas com missão
    (4, 'Missão perigosa à vista!', 4), -- NPC com missão
    (5, NULL, NULL), -- NPC sem missão e sem venda
    (6, 'Bem-vindo! Veja nossas ofertas especiais.', NULL), -- NPC apenas vendedor
    (7, 'Olá, Herói! Temos itens raros para você.', NULL), -- NPC apenas vendedor
    (8, 'Saudações! Aposto que esses itens são o que você estava procurando.', NULL), -- NPC apenas vendedor
    (9, 'Oi! Está procurando algo específico? Tenho itens únicos.', 5); -- NPC vendedor e com missão

-- Inserir estoque para NPCs vendedores
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 6, 5000),
       ('Kit Médico', 7, 5000),
       ('Kit Médico', 8, 5000),
       ('Kit Médico', 9, 5000),
       ('Camuflagem Alienígena', 6, 4000),
       ('Placa de Armadura', 7, 3000),
       ('Granada Inibidora', 7, 3000),
       ('Jato de Fuga', 8, 10000),
       ('Arma Tennyson', 8, 3500),
       ('Campo de Força Portátil', 9, 4000),
       ('Espada Proto-Arma', 9, 5000);



-- Inserir dados de NPC na tabela INSTANCIA_NPC_NA_SALA
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (1, 1),
       (2, 2),
       (2, 5),
       (2, 6),
       (3, 3),
       (12, 8),
       (13, 7);