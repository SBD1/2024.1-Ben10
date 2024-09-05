-- Função que será chamada pelo trigger
CREATE OR REPLACE FUNCTION verificar_exclusividade_missao()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se a missão já está em outra tabela de especialização
    IF EXISTS (SELECT 1 FROM CACA WHERE id_missao = NEW.id_missao)
        OR EXISTS (SELECT 1 FROM ENTREGA WHERE id_missao = NEW.id_missao) THEN
        RAISE EXCEPTION 'A missão já está associada a uma especialização diferente.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para a tabela CACA
CREATE TRIGGER trigger_verificar_exclusividade_caca
BEFORE INSERT OR UPDATE ON CACA
FOR EACH ROW EXECUTE FUNCTION verificar_exclusividade_missao();

-- Trigger para a tabela ENTREGA
CREATE TRIGGER trigger_verificar_exclusividade_entrega
BEFORE INSERT OR UPDATE ON ENTREGA
FOR EACH ROW EXECUTE FUNCTION verificar_exclusividade_missao();

-- Trigger Function
CREATE OR REPLACE FUNCTION ajustar_quantidade_monstros()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se a missão é do tipo ENTREGA
    IF (SELECT tipo_missao FROM MISSAO WHERE id_missao = NEW.id_missao) = 'ENTREGA' THEN
        -- Se for do tipo ENTREGA, seta quantidade_monstros como NULL
        NEW.quantidade_monstros := NULL;
    ELSE
        -- Para outros tipos de missão, garante que quantidade_monstros não seja NULL
        IF NEW.quantidade_monstros IS NULL THEN
            RAISE EXCEPTION 'Quantidade de monstros não pode ser NULL para missões que não sejam do tipo ENTREGA.';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trigger_ajustar_quantidade_monstros
BEFORE INSERT OR UPDATE ON REGISTRO_DA_MISSAO
FOR EACH ROW EXECUTE FUNCTION ajustar_quantidade_monstros();

-- Insere itens na tabela ITEM
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Kit Médico', 'Consumível');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Placa de Armadura', 'Consumível');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Jato de Fuga', 'Consumível');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Campo de Força Portátil', 'Consumível');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Camuflagem Alienígena', 'Consumível');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Projétil Laser', 'Arma');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Arma Tennyson', 'Arma');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Espada Proto-Arma', 'Arma');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Granada Inibidora', 'Arma');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Pistola dos Encanadores', 'Arma');

-- Inserir itens na tabela CONSUMIVEL
INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Kit Médico', 5000, 'cura', 3);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Placa de Armadura', 3000, 'imunidade', 3);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Jato de Fuga', 10000, 'vida_extra', 1);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Campo de Força Portátil', 4000, 'buff_dano', 1);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Camuflagem Alienígena', 4000, 'critico', 2);

-- Inserir itens na tabela ARMA
INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Projétil Laser', 2000, 40);

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Arma Tennyson', 12500, 120);

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Espada Proto-Arma', 4000, 60);

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Granada Inibidora', 4000, 50);

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Pistola dos Encanadores', 4000, 60);

-- Inserir espécies na tabela ESPECIE
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Quatro Braços', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('XLR8', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Chama', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Diamante', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Besta', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Insectóide', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Fantasmático', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Ultra T', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Massa Cinzenta', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Aquático', 'Alien');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Humano Hipnotizado', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Servo', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Demônio', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Soldado de Elite', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Lobo de duas-cabeças', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Cavaleiro Eterno', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Encanador Traidor', 'Monstro');

-- Inserir aliens na tabela ALIEN
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Quatro Braços', 'Alien com quatro braços e grande força física.', 170, 120, 90);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('XLR8', 'Alien extremamente rápido e ágil.', 75, 65, 85);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Chama', 'Alien que pode manipular e lançar fogo.', 100, 85, 90);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Diamante', 'Alien com corpo cristalino e resistente.', 160, 120, 95);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Besta', 'Alien com sentidos aguçados e força animal.', 95, 80, 90);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Insectóide', 'Alien com capacidade de voo e rajadas de ferrão.', 85, 75, 88);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Fantasmático', 'Alien que pode se tornar intangível e invisível.', 80, 70, 85);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Ultra T', 'Alien com armadura tecnológica e super força.', 105, 110, 92);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Massa Cinzenta', 'Alien com intelecto superior e habilidades tecnológicas.', 40, 50, 120);
INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Aquático', 'Alien que pode respirar debaixo dágua e manipular a água.', 95, 90, 87);

-- Inserir monstros na tabela MONSTRO
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Vilgax', 'Espada Proto-Arma', 10, 10000, 550, 140, 130);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Humano Hipnotizado', 'Kit Médico', 1, 300, 40, 50, 60);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Servo', 'Granada Inibidora', 2, 500, 70, 80, 100);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Demônio', 'Pistola dos Encanadores', 3, 800, 150, 80, 150);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Soldado de Elite', 'Placa de Armadura', 3, 1000, 80, 30, 100);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Lobo de duas-cabeças', 'Camuflagem Alienígena', 4, 1500, 100, 100, 100);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Cavaleiro Eterno', 'Arma Tennyson', 5, 4000, 300, 100, 100);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base) VALUES ('Encanador Traidor', 'Campo de Força Portátil', 5, 3000, 200, 100, 70);

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
VALUES ('Base dos Cavaleiros Eternos', 'Base central dos Cavaleiros Eternos');

INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Base dos Encanadores', 'Base principal dos Encanadores, parcialmente destruída após uma invasão');

INSERT INTO REGIAO(nome_regiao, descricao)
VALUES ('Nave do Vilgax', 'Nave principal de Vilgax');

-- Inserção de missões na tabela MISSAO com o tipo de missão especificado
INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (1, 'Investigar a Base', 200, 'Descubra o que os Cavaleiros Eternos estão tramando na base secreta.', 500, 'CACA');

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (2, 'Derrotar Vilgax', 1000, 'Enfrente Vilgax e impeça seus planos de dominação.', 10000, 'CACA');

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (3, 'Recuperar a Placa de Armadura', 300, 'recupere Placa de Armadura', 700, 'ENTREGA');

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (4, 'Recuperar o Omnitrix', 400, 'Recupere o Omnitrix que foi roubado por um misterioso inimigo.', 800, 'ENTREGA');

INSERT INTO MISSAO (id_missao, nome_missao, experiencia, descricao, recompensa_em_moedas, tipo_missao) 
VALUES (5, 'Enfrente o Colecionador', 600, 'Derrote o Colecionador e suas criaturas mutantes que ameaçam os encanadores.', 1200, 'CACA');

-- Inserção de pre-requisitos das missões na tabela PRE_REQUISITO
INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
VALUES (2, 4); -- Necessário completar missão 4 para fazer missão 2

-- inserção na tabela CACA
INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (1, 10, 1);

INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (2, 15, 2);

INSERT INTO CACA (id_missao, quantidade_monstros, dificuldade_monstro) 
VALUES (5, 20, 3);

-- inserção na tabela ENTREGA
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (4, 'Omnitrix');

INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (3, 'Placa de Armadura');

-- Inserir salas para a região 'Base dos Cavaleiros Eternos'
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (1, 'Base dos Cavaleiros Eternos', 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (2, 'Base dos Cavaleiros Eternos', 'Zona de Armadilha');

INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (3, 'Base dos Cavaleiros Eternos', 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao, tipo_sala) 
VALUES (4, 'Base dos Cavaleiros Eternos', 1, 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao, tipo_sala) 
VALUES (5, 'Base dos Cavaleiros Eternos', 3, 'Zona de Armadilha');

-- Inserir salas para a região 'Base dos Encanadores'
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (6, 'Base dos Encanadores', 'Zona de Armadilha');

INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (7, 'Base dos Encanadores', 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (8, 'Base dos Encanadores', 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao, tipo_sala) 
VALUES (9, 'Base dos Encanadores', 3, 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao, tipo_sala) 
VALUES (10, 'Base dos Encanadores', 5, 'Zona de Armadilha');

-- Inserir salas para a região 'Nave do Vilgax'
INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (11, 'Nave do Vilgax', 'Zona de Armadilha');

INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (12, 'Nave do Vilgax', 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, tipo_sala) 
VALUES (13, 'Nave do Vilgax', 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao, tipo_sala)  
VALUES (14, 'Nave do Vilgax', 4, 'Zona de Guerra');

INSERT INTO SALA (id_sala, nome_regiao, id_pre_req_missao, tipo_sala) 
VALUES (15, 'Nave do Vilgax', 2, 'Zona de Guerra');

-- Inserir zonas de guerra na tabela ZONA_DE_GUERRA
INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (1, 1, 'Zona de combate contra os Cavaleiros Eternos');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (3, 1, 'Zona de combate com armadilhas leves');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (4, 10, 'Zona de combate intensa com chefe da região');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (7, 1, 'Zona de combate inicial dos Encanadores');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (8, 3, 'Zona de combate médio');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (9, 4, 'Zona de combate avançado dos Encanadores');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (12, 5, 'Zona de combate intermediária da Nave do Vilgax');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (13, 4, 'Zona de combate com inimigos múltiplos');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (14, 3, 'Zona de combate estratégica');

INSERT INTO ZONA_DE_GUERRA (id_sala, dificuldade, descricao) 
VALUES (15, 3, 'Zona de combate final da Nave do Vilgax');

-- Inserir zonas de armadilha na tabela ZONA_DE_ARMADILHA
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

-- Inserir personagens na tabela PERSONAGEM
INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
VALUES (DEFAULT, 5000, 'Chama', 'Ben', 3, 350, 10),
       (DEFAULT, 10000000, 'Ultra T', 'Max', 1, 100, 1),
       (DEFAULT, 500, 'XLR8', 'Kevin', 1, 100, 1),
       (DEFAULT, 500, 'Massa Cinzenta', 'Gwen', 1, 100, 1);

-- Inserir registros de missões na tabela REGISTRO_DA_MISSAO
INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status, quantidade_monstros) 
VALUES (1, 4, 'em progresso', 0),
       (2, 1, 'completa', 0),
       (3, 1, 'em progresso', 0),
       (4, 1, 'em progresso', 0);

-- Inserir itens na tabela INVENTARIO
INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
VALUES (1, DEFAULT, 'Kit Médico'),
       (2, DEFAULT, 'Placa de Armadura'),
       (2, DEFAULT, 'Kit Médico'),
       (3, DEFAULT, 'Jato de Fuga'),
       (3, DEFAULT, 'Kit Médico'),
       (4, DEFAULT, 'Campo de Força Portátil'),
       (4, DEFAULT, 'Kit Médico');

-- Inserir status do alien na tabela STATUS_DO_ALIEN
INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
VALUES ('Chama',150, 1),
       ('Ultra T',75, 2),
       ('XLR8',120, 3),
       ('Massa Cinzenta',130, 4);

-- Inserir instâncias dos monstros na tabela INSTANCIA_MONSTRO
INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
VALUES (DEFAULT, 'Humano Hipnotizado', 80),
       (DEFAULT, 'Servo', 75),
       (DEFAULT, 'Demônio', 50),
       (DEFAULT, 'Soldado de Elite', 250);

-- Inserir dados da zona de guerra na tabela INSTANCIA_ZONA_GUERRA
INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro) 
VALUES (3, 1, 1),
       (4, 2, 2),
       (7, 3, 3),
       (8, 4, 4);

-- Inserir dados de NPC na tabela INSTANCIA_NPC_NA_SALA
INSERT INTO INSTANCIA_NPC_NA_SALA (id_sala, id_npc) 
VALUES (1, 1),
       (2, 2),
       (2, 5),
       (2, 6),
       (3, 3),
       (12, 8),
       (13, 7);

-- Inserir recompensas na tabela RECOMPENSA
INSERT INTO RECOMPENSA (id_personagem, id_sala, nome_item, recompensa_recebida) 
VALUES (1, 2, 'Kit Médico', 500), 
       (2, 5, 'Placa de Armadura', 600),
       (3, 6, 'Jato de Fuga', 1000), 
       (4, 10, 'Campo de Força Portátil', 400),
       (1, 11, 'Campo de Força Portátil', 400);