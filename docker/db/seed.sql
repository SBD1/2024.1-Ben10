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

CREATE OR REPLACE FUNCTION atualizar_vida() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.saude > NEW.nivel * 100 THEN
        NEW.saude := NEW.nivel * 100;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualizar_vida
BEFORE UPDATE ON personagem
FOR EACH ROW
EXECUTE FUNCTION atualizar_vida();

CREATE OR REPLACE FUNCTION atualizar_vida_alien() RETURNS TRIGGER AS $$
DECLARE
    vida_maxima INTEGER;
    nivel INTEGER;
BEGIN
    -- Buscar a vida máxima do alien com base no personagem
    SELECT a.saude INTO vida_maxima
    FROM STATUS_DO_ALIEN sda
    JOIN ALIEN a ON a.nome = sda.nome_alien
    WHERE a.nome = NEW.nome_alien AND sda.id_personagem = NEW.id_personagem;

    -- Buscar o nível do personagem
    SELECT p.nivel INTO nivel
    FROM PERSONAGEM p
    WHERE p.id_personagem = NEW.id_personagem;

    -- Se a nova saúde for maior que a vida máxima permitida pelo nível, ajusta
    IF NEW.saude > vida_maxima * nivel THEN
        NEW.saude := vida_maxima * nivel;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualizar_vida_alien
BEFORE UPDATE ON STATUS_DO_ALIEN
FOR EACH ROW
EXECUTE FUNCTION atualizar_vida_alien();

CREATE OR REPLACE FUNCTION atualizar_vida_monstro() RETURNS TRIGGER AS $$
DECLARE
    vida_maxima INTEGER;
BEGIN
    SELECT m.saude INTO vida_maxima
    FROM MONSTRO m
    WHERE m.nome = NEW.nome_especie;

    IF NEW.saude_atual > vida_maxima THEN
        NEW.saude_atual := vida_maxima;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualizar_vida_monstro
BEFORE INSERT OR UPDATE ON INSTANCIA_MONSTRO
FOR EACH ROW
EXECUTE FUNCTION atualizar_vida_monstro();

CREATE OR REPLACE FUNCTION verifica_arma_inventario() RETURNS TRIGGER AS $$
BEGIN
    PERFORM 1 FROM INVENTARIO WHERE nome_item = OLD.nome_item AND id_personagem = OLD.id_personagem;
    
    IF NOT FOUND THEN
        UPDATE PERSONAGEM
        SET arma = NULL
        WHERE id_personagem = OLD.id_personagem AND arma = OLD.nome_item;
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_verifica_arma_inventario
AFTER DELETE ON INVENTARIO
FOR EACH ROW
EXECUTE FUNCTION verifica_arma_inventario();

-- Trigger da missão
CREATE OR REPLACE FUNCTION conclusao_missao_monstros() RETURNS trigger
AS $conclusao_missao_monstros$
BEGIN
    IF EXISTS (SELECT 1
    FROM registro_da_missao rm
    JOIN caca c ON c.id_missao = NEW.id_missao
    WHERE rm.id_personagem = NEW.id_personagem AND NEW.quantidade_monstros >= c.quantidade_monstros AND rm.status != 'completa') THEN
        UPDATE registro_da_missao
        SET status = 'completa'
        WHERE id_personagem = NEW.id_personagem AND
        id_missao = NEW.id_missao;
    END IF;

    RETURN NEW;
END;
$conclusao_missao_monstros$ LANGUAGE plpgsql;

CREATE TRIGGER tg_conclusao_missao_monstros
AFTER UPDATE OR INSERT ON registro_da_missao
FOR EACH ROW
EXECUTE FUNCTION conclusao_missao_monstros();

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
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Espada de Bog Kah', 'Arma');
INSERT INTO ITEM (nome_item, tipo_item) VALUES ('Lança de Azshara', 'Arma');


-- Inserir itens na tabela CONSUMIVEL
INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Kit Médico', 5000, 'cura', 100);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Placa de Armadura', 3000, 'imunidade', 3);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Jato de Fuga', 10000, 'vida_extra', 25);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Campo de Força Portátil', 4000, 'buff_dano', 15);

INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
VALUES ('Camuflagem Alienígena', 4000, 'critico', 50);

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

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Espada de Bog Kah', 6000, 40);

INSERT INTO ARMA (nome_item, preco, dano) 
VALUES ('Lança de Azshara', 7000, 90);


-- Inserir as espécies dos aliens na tabela ESPECIE
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

-- Inserir as espécies dos monstros na tabela ESPECIE
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Patrulheiro de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Fera da Selva', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Soldado de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Guarda do Templo', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Guarda de Elite', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Estátua Viva', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Capitão do Exército', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('General Khartosh', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Guarda-Costas de Vilgax', 'Monstro');
INSERT INTO ESPECIE (nome, tipo_especie) VALUES ('Vilgax', 'Monstro');

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


-- Inserir os monstros na tabela MONSTRO
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Patrulheiro de Vilgax', 'Espada de Bog Kah', 1, 50, 200, 40, 30);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Fera da Selva', 'Kit Médico', 2, 80, 300, 50, 40);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Soldado de Vilgax', 'Placa de Armadura', 3, 100, 250, 60, 50);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda do Templo', 'Lança de Azshara', 4, 150, 400, 70, 60);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda de Elite', 'Granada Inibidora', 5, 300, 90, 70, 75);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Estátua Viva', 'Jato de Fuga', 6, 400, 100, 80, 80);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Capitão do Exército', 'Camuflagem Alienígena', 7, 500, 110, 90, 90);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('General Khartosh', 'Pistola dos Encanadores', 8, 700, 130, 110, 95);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Guarda-Costas de Vilgax', 'Arma Tennyson', 9, 1000, 150, 130, 110);
INSERT INTO MONSTRO (nome, id_recompensa, dificuldade, recompensa_em_moedas, saude, defesa, status_base)
VALUES ('Vilgax', 'Arma Tennyson', 10, 10000, 200, 170, 250);

-- Inserir habilidades na tabela HABILIDADE

-- Quatro Braços (Força e resistência física, não faz sentido cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Quatro Braços', 'Força Bruta', 'dano', 70);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Quatro Braços', 'Soco Devastador', 'dano', 80);

-- XLR8 (Velocidade extrema, sem habilidades de cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('XLR8', 'Super Velocidade', 'dano', 120);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('XLR8', 'Aceleração Tempestiva', 'dano', 90);

-- Chama (Controle de fogo, não faz sentido cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Chama', 'Lançar Fogo', 'dano', 95);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Chama', 'Explosão de Fogo', 'dano', 100);

-- Diamante (Corpo cristalino, pode ter uma habilidade de cura por regeneração)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Diamante', 'Corpo Cristalino', 'cura', 120);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Diamante', 'Lâmina Cristalina', 'dano', 85);

-- Besta (Habilidades sensoriais e físicas, sem cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Besta', 'Sentidos Aguçados', 'dano', 100);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Besta', 'Garras Letais', 'dano', 90);

-- Insectóide (Capacidades de combate com ferrões, sem cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Insectóide', 'Rajada de Ferrão', 'dano', 105);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Insectóide', 'Explosão de Veneno', 'dano', 110);

-- Fantasmático (Intangibilidade e poderes sobrenaturais, pode ter cura como efeito espectral)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Fantasmático', 'Intangibilidade', 'cura', 110);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Fantasmático', 'Assombração', 'dano', 90);

-- Ultra T (Armadura, pode ter cura como regeneração tecnológica)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Ultra T', 'Armadura Tecnológica', 'cura', 110);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Ultra T', 'Canhão Laser', 'dano', 100);

-- Massa Cinzenta (Intelecto superior, pode ter cura como habilidade mental)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Massa Cinzenta', 'Intelecto Superior', 'cura', 120);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Massa Cinzenta', 'Tecnologia Improvisada', 'dano', 85);

-- Aquático (Controle da água, não faz sentido cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Aquático', 'Hidroquinese', 'dano', 85);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Aquático', 'Explosão de Água', 'dano', 95);

-- Vilgax (Força bruta, sem habilidades de cura)
INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Vilgax', 'Força Descomunal', 'dano', 150);

INSERT INTO HABILIDADE (nome_especie, nome_habilidade, efeito, quantidade) 
VALUES ('Vilgax', 'Raio Devastador', 'dano', 160);


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

-- inserção na tabela ENTREGA
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (2, 'Espada de Bog Kah');
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (4, 'Kit Médico');
INSERT INTO ENTREGA (id_missao, nome_item) 
VALUES (8, 'Lança de Azshara');

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
VALUES (1, 'Azmuth', 'Vilgax está atrás de um artefato muito poderoso, mas primeiro precisamos derrotar sua patrulha.', 1);

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

-- Inserir personagens na tabela PERSONAGEM
INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
VALUES (DEFAULT, 5000, 'Chama', 'Ben', 3, 100, 10),
       (DEFAULT, 10000000, 'Ultra T', 'Max', 1, 50, 1),
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
       (2, DEFAULT, 'Campo de Força Portátil'),
       (2, DEFAULT, 'Camuflagem Alienígena'),
       (3, DEFAULT, 'Jato de Fuga'),
       (3, DEFAULT, 'Kit Médico'),
       (4, DEFAULT, 'Campo de Força Portátil'),
       (4, DEFAULT, 'Kit Médico');

-- Inserir status do alien na tabela STATUS_DO_ALIEN
INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
VALUES ('Chama',150, 1),
       ('Ultra T',75, 2),
       ('XLR8',120, 2),
       ('XLR8',120, 3),
       ('Massa Cinzenta',130, 4);

-- Inserir instâncias dos monstros na tabela INSTANCIA_MONSTRO
INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
VALUES (DEFAULT, 'Vilgax', 80),
       (DEFAULT, 'Guarda de Elite', 75),
       (DEFAULT, 'Guarda do Templo', 50),
       (DEFAULT, 'General Khartosh', 250);

-- Inserir dados da zona de guerra na tabela INSTANCIA_ZONA_GUERRA
INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro) 
VALUES (1, 1, 1),
       (2, 2, 2),
       (4, 3, 3),
       (5, 4, 4);

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


-- Inserir recompensas na tabela RECOMPENSA
INSERT INTO RECOMPENSA (id_personagem, id_sala, nome_item, recompensa_recebida) 
VALUES (1, 3, 'Kit Médico', 500), 
       (2, 6, 'Placa de Armadura', 600),
       (3, 7, 'Jato de Fuga', 1000);
