INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Kit Médico', 'Consumível');
Espada de Bog Kah

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

-- inserção na tabela CACA
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (1, 10, 1);

-- inserção na tabela ENTREGA
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (4, 'Omnitrix');

-- Inserir regiões na tabela REGIAO 
INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Selvatrama', 'Floresta tropical do Planeta Eugera, conhecida por guardar muitos segredos');
INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Templo dos Antigos', 'Templo');

-- Inserção de missões na tabela MISSAO com o tipo de missão especificado
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (1, 'Derrote a patrulha de Vilgax', 75, 'Vilgax não sabe que estamos no planeta, garanta que permaneça assim', 300, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (2, 'Recupere a Espada de Bog Kah', 150, 'A Espada de Bog Kah, tem um mapa entalhado na lâmina, talvez ele leva ao templo que Vilgax está procurando', 400, 'Entrega');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (3, 'Derrote os monstros da selva', 150, 'A selva possui muitos perigos, tome cuidado', 300, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (4, 'Entregue os suprimentos ao vilarejo', 200, 'Quando chegou ao planeta, Vilgax trouxe muita destruição, ajude os habitantes do planeta', 1000, 'Entrega');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (5, 'Proteja o vilarejo', 250, 'Vilgax enviou tropas para investigar a área, defenda o vilarejo', 1000, 'CACA');
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (6, 'Derrote o guarda do templo ', 350, 'Vilgax localizou o templo e deixou um guarda em sua porta, derrote-o', 1000, 'Exploracao');








-- Inserir salas para a região 'Base dos Cavaleiros Eternos'
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (1, 'Base dos Cavaleiros Eternos', 'Zona de Guerra');