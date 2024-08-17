-- Insere itens na tabela ITEM
INSERT INTO ITEM (nome_item, preco) 
VALUES ('Kit Médico', 5000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Placa de Armadura', 3000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Jato de Fuga', 10000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Campo de Força Portátil', 4000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Camuflagem Alienígena', 4000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Projétil Laser', 2000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Arma Tennyson', 12500);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Espada Proto-Arma', 4000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Granada Inibidora', 4000);

INSERT INTO ITEM (nome_item, preco) 
VALUES ('Pistola dos Encanadores', 4000);

-- Inserir itens na tabela CONSUMIVEL
INSERT INTO CONSUMIVEL (nome_item, status, valor_consumivel) 
VALUES ('Kit Médico', 'inativo', 3);

INSERT INTO CONSUMIVEL (nome_item, status, valor_consumivel) 
VALUES ('Placa de Armadura', 'inativo', 3);

INSERT INTO CONSUMIVEL (nome_item, status, valor_consumivel) 
VALUES ('Jato de Fuga', 'inativo', 1);

INSERT INTO CONSUMIVEL (nome_item, status, valor_consumivel) 
VALUES ('Campo de Força Portátil', 'inativo', 1);

INSERT INTO CONSUMIVEL (nome_item, status, valor_consumivel) 
VALUES ('Camuflagem Alienígena', 'inativo', 2);

-- Inserir itens na tabela ARMA
INSERT INTO ARMA (nome_item, dano) 
VALUES ('Projétil Laser', 40);

INSERT INTO ARMA (nome_item, dano) 
VALUES ('Arma Tennyson', 120);

INSERT INTO ARMA (nome_item, dano) 
VALUES ('Espada Proto-Arma', 60);

INSERT INTO ARMA (nome_item, dano) 
VALUES ('Granada Inibidora', 50);

INSERT INTO ARMA (nome_item, dano) 
VALUES ('Pistola dos Encanadores', 60);

-- Inserir espécies na tabela ESPECIE
INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Quatro Braços', 170, 120, 90);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('XLR8', 75, 65, 85);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Chama', 100, 85, 90);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Diamante', 160, 120, 95);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Besta', 95, 80, 90);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Insectóide', 85, 75, 88);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Fantasmático', 80, 70, 85);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Ultra T', 105, 110, 92);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Massa Cinzenta', 40, 50, 120);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Aquático', 95, 90, 87);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Vilgax', 550, 140, 130);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Humano Hipnotizado', 40, 50, 60);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Servo', 70, 80, 100);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Demônio', 150, 80, 150);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Soldado de Elite', 80, 30, 100);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Lobo de duas-cabeças', 100, 100, 100);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Cavaleiro Eterno', 300, 100, 100);

INSERT INTO ESPECIE (nome, saude, defesa, status_base) 
VALUES ('Encanador Traidor', 200, 100, 70);

-- Inserir aliens na tabela ALIEN
INSERT INTO ALIEN (nome, descricao) 
VALUES ('Quatro Braços', 'Alien com quatro braços e grande força física.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('XLR8', 'Alien extremamente rápido e ágil.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Chama', 'Alien que pode manipular e lançar fogo.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Diamante', 'Alien com corpo cristalino e resistente.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Besta', 'Alien com sentidos aguçados e força animal.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Insectóide', 'Alien com capacidade de voo e rajadas de ferrão.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Fantasmático', 'Alien que pode se tornar intangível e invisível.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Ultra T', 'Alien com armadura tecnológica e super força.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Massa Cinzenta', 'Alien com intelecto superior e habilidades tecnológicas.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Aquático', 'Alien que pode respirar debaixo dágua e manipular a água.');

INSERT INTO ALIEN (nome, descricao) 
VALUES ('Vilgax', 'Alien com força descomunal e resistência extrema.');

-- Inserir monstros na tabela MONSTRO
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Vilgax', 'Espada Proto-Arma', 10, 10000);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Humano Hipnotizado', 'Kit Médico', 1, 300);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Servo', 'Granada Inibidora', 2, 500);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Demônio', 'Pistola dos Encanadores', 3, 800);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Soldado de Elite', 'Placa de Armadura', 3, 1000);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Lobo de duas-cabeças', 'Camuflagem Alienígena', 4, 1500);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Cavaleiro Eterno', 'Arma Tennyson', 5, 4000);

INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas) 
VALUES ('Encanador Traidor', 'Campo de Força Portátil', 5, 3000);

-- Inserir habilidades na tabela HABILIDADE
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Quatro Braços', 'Força Bruta', 'dano', 70);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('XLR8', 'Super Velocidade', 'paralisia', 120);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Chama', 'Lançar Fogo', 'dano', 95);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Diamante', 'Corpo Cristalino', 'defesa', 120);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Besta', 'Sentidos Aguçados', 'dano', 100);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Insectóide', 'Rajada de Ferrão', 'dano', 105);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Fantasmático', 'Intangibilidade', 'paralisia', 110);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Ultra T', 'Armadura Tecnológica', 'defesa', 110);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Massa Cinzenta', 'Intelecto Superior', 'cura', 120);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Aquático', 'Hidroquinese', 'dano', 85);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Vilgax', 'Força Descomunal', 'dano', 150);

-- Inserir regiões na tabela REGIAO 
INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Base dos Cavaleiros Eternos', 'Base central dos Cavaeiros Eternos');

INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Base dos Encanadores', 'Base principal dos Encanadores, parcialmente destruída após um invasão');

INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Nave do Vilgax', 'Nave principal de Vilgax');

-- Inserir missões na tabela MISSAO 
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas) 
VALUES (1, 'Investigar a Base', 200, 'Descubra o que os Cavaleiros Eternos estão tramando na base secreta.', 500);

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas) 
VALUES (2, 'Derrotar Vilgax', 1000, 'Enfrente Vilgax e impeça seus planos de dominação.', 10000);

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas) 
VALUES (3, 'Resgate Gwen', 300, 'Salve Gwen, que foi sequestrada por alienígenas.', 700);

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas) 
VALUES (4, 'Recuperar o Omnitrix', 400, 'Recupere o Omnitrix que foi roubado por um misterioso inimigo.', 800);

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas) 
VALUES (5, 'Enfrente o Colecionador', 600, 'Derrote o Colecionador e suas criaturas mutantes que ameaçam os encanadores', 1200);

-- Inserir pre-requisito das missões na tabela PRE_REQUISITO
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (2, 4); -- Necessário completar missão 4 para fazer missão 2

INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (3, 1); -- Necessário completar missão 1 para fazer missão 3

INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (5, 3); -- Necessário completar missão 3 para fazer missão 5

-- Inserir salas para a região 'Base dos Cavaleiros Eternos'
INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (1, 'Base dos Cavaleiros Eternos');

INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (2, 'Base dos Cavaleiros Eternos');

INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (3, 'Base dos Cavaleiros Eternos');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao) 
VALUES (4, 'Base dos Cavaleiros Eternos', 1);

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao) 
VALUES (5, 'Base dos Cavaleiros Eternos', 3);

-- Inserir salas para a região 'Base dos Encanadores'
INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (6, 'Base dos Encanadores');

INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (7, 'Base dos Encanadores');

INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (8, 'Base dos Encanadores');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao) 
VALUES (9, 'Base dos Encanadores', 3);

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao) 
VALUES (10, 'Base dos Encanadores', 5);

-- Inserir salas para a região 'Nave do Vilgax'
INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (11, 'Nave do Vilgax');

INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (12, 'Nave do Vilgax');

INSERT INTO SALA (id_sala, nome_regiao) 
VALUES (13, 'Nave do Vilgax');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao)  
VALUES (14, 'Nave do Vilgax', 4);

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao) 
VALUES (15, 'Nave do Vilgax', 2);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (1, 1);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (3, 1);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (4, 10);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (7, 1);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (8, 3);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (9, 4);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (12, 5);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (13, 4);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (14, 3);

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade) 
VALUES (15, 3);

INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) 
VALUES (2, 3, 'acréscimo');

INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) 
VALUES (5, 2, 'redução');

INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) 
VALUES (6, 4, 'acréscimo');

INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) 
VALUES (10, 5, 'redução');

INSERT INTO ZONA_DE_ARMADILHA (id_sala, fator, tipo) 
VALUES (11, 3, 'acréscimo');

-- Inserir NPC na tabela NPC
INSERT INTO NPC (id_npc) 
VALUES 
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9);

-- Assosciar NPC a uma MISSAO
INSERT INTO GUIA_DE_MISSOES (id_npc, id_missao_associada) 
VALUES (1, 1);  -- NPC 1 associado à Missão 1

INSERT INTO GUIA_DE_MISSOES (id_npc, id_missao_associada) 
VALUES (2, 2);  -- NPC 2 associado à Missão 2

INSERT INTO GUIA_DE_MISSOES (id_npc, id_missao_associada) 
VALUES (3, 3);  -- NPC 3 associado à Missão 3

INSERT INTO GUIA_DE_MISSOES (id_npc, id_missao_associada) 
VALUES (4, 4);  -- NPC 4 associado à Missão 4

INSERT INTO GUIA_DE_MISSOES (id_npc, id_missao_associada) 
VALUES (5, 5);  -- NPC 5 associado à Missão 5

-- Inserir NPC VENDEDOR
INSERT INTO VENDEDOR (id_npc, dialogo_associado_venda) 
VALUES (6, 'Bem-vindo! Veja nossas ofertas especiais de itens e equipamentos.');

INSERT INTO VENDEDOR (id_npc, dialogo_associado_venda) 
VALUES (7, 'Olá, Herói! Temos itens raros e poderosos disponíveis para você.');

INSERT INTO VENDEDOR (id_npc, dialogo_associado_venda) 
VALUES (8, 'Saudações! Aposto que esses itens são o que você estava procurando.');

INSERT INTO VENDEDOR (id_npc, dialogo_associado_venda) 
VALUES (9, 'Oi! Está procurando algo específico? Tenho itens únicos à sua disposição.');

-- Inserir ESTOQUE_DO_ITEM para um NPC
INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 6, 5000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 7, 5000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 8, 5000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Kit Médico', 9, 5000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Camuflagem Alienígena', 6, 4000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Placa de Armadura', 7, 3000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Granada Inibidora', 7, 3000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Jato de Fuga', 8, 10000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Arma Tennyson', 8, 3500);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Campo de Força Portátil', 9, 4000);

INSERT INTO ESTOQUE_DO_ITEM (nome_item, id_npc, preco) 
VALUES ('Espada Proto-Arma', 9, 5000);

-- Inserir personagens na tabela PERSONAGEM
INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
VALUES (1, 5000, 'Chama', 'Ben', 3, 350, 10);

INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
VALUES (2, 500, 'Ultra T', 'Max', 1, 100, 1);

INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
VALUES (3, 500, 'XLR8', 'Kevin', 1, 100, 1);

INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
VALUES (4, 500, 'Massa Cinzenta', 'Gwen', 1, 100, 1);

-- Inserir registros de missões na tabela REGISTRO_DA_MISSAO
INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status) 
VALUES (1, 4, 'em progresso');  -- Personagem 1 em Missão 4

INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status) 
VALUES (2, 1, 'completa');    -- Personagem 2 em Missão 1

INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status) 
VALUES (3, 1, 'incompleta');     -- Personagem 3 em Missão 1

INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status) 
VALUES (4, 1, 'incompleta');  -- Personagem 4 em Missão 1

-- Inserir itens na tabela INVENTARIO
INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (1, 1, 'Kit Médico');  -- Personagem 1 possui o item 'Kit Médico'

INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (2, 1, 'Placa de Armadura');  -- Personagem 2 possui o item 'Placa de Armadura'

INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (2, 2, 'Kit Médico');  -- Personagem 2 possui o item 'Kit Médico'

INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (3, 1, 'Jato de Fuga');  -- Personagem 3 possui o item 'Jato de Fuga'

INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (3, 2, 'Kit Médico');  -- Personagem 3 possui o item 'Kit Médico'

INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (4, 1, 'Campo de Força Portátil');  -- Personagem 4 possui o item 'Campo de Força Portátil'

INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (4, 2, 'Kit Médico');  -- Personagem 4 possui o item 'Kit Médico'

-- Inserir status do alien na tabela STATUS_DO_ALIEN
INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
VALUES('Chama',150, 1);

INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
VALUES('Ultra T',75, 2);

INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
VALUES('XLR8',120, 3);

INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
VALUES('Massa Cinzenta',130, 4);

-- Inserir instâncias dos monstros na tabela INSTANCIA_MONSTRO
INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
VALUES (1, 'Humano Hipnotizado', 80);

INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
VALUES (2, 'Servo', 75);

INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
VALUES (3, 'Demônio', 50);

INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
VALUES (4, 'Soldado de Elite', 250);

-- Inserir dados da zona de guerra na tabela INSTANCIA_ZONA_GUERRA
INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro) 
VALUES (3, 1, 1);

INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro) 
VALUES (4, 2, 2);

INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro) 
VALUES (7, 3, 3);

INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro) 
VALUES (8, 4, 4);

-- Inserir dados de NPC na tabela INSTANCIA_NPC_NA_SALA
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (1, 1);

INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (2, 2);

INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (3, 3);

INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (12, 8);

INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (13, 7);

-- Inserir recompensas na tabela RECOMPENSA
INSERT INTO RECOMPENSA (id_personagem, id_sala, nome_item, recompensa_recebida) 
VALUES (1, 3, 'Kit Médico', 500);  -- Personagem 1 recebe 'Kit Médico' na Sala 3

INSERT INTO RECOMPENSA (id_personagem, id_sala, nome_item, recompensa_recebida) 
VALUES (2, 4, 'Placa de Armadura', 600);  -- Personagem 2 recebe 'Placa de Armadura' na Sala 4

INSERT INTO RECOMPENSA (id_personagem, id_sala, nome_item, recompensa_recebida) 
VALUES (3, 7, 'Jato de Fuga', 1000);  -- Personagem 3 recebe 'Jato de Fuga' na Sala 7

INSERT INTO RECOMPENSA (id_personagem, id_sala, nome_item, recompensa_recebida) 
VALUES (4, 8, 'Campo de Força Portátil', 400);  -- Personagem 4 recebe 'Campo de Força Portátil' na Sala 8