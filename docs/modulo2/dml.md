# DML (Data Manipulation Language)

## <a>Introdução</a>

Segundo Elmasri e Navathe<a id="anchor_1" href="#REF1">^1^</a>, o DML (Data Manipulation Language) é um componente fundamental na operação de bancos de dados, pois permite a interação com os dados armazenados. Essa linguagem inclui comandos que facilitam a inserção, atualização, exclusão e consulta de dados em um banco de dados, garantindo que as informações sejam manipuladas de maneira eficiente e precisa. O DML é utilizado para a execução de transações, onde múltiplas operações de manipulação de dados podem ser realizadas de forma atômica, garantindo a consistência e integridade do banco de dados.

A importância do DML está na sua capacidade de permitir que usuários e aplicativos interajam diretamente com o banco de dados. Ao utilizar comandos DML, como SELECT, INSERT, UPDATE e DELETE, é possível extrair e modificar dados conforme as necessidades do sistema, mantendo a flexibilidade e dinamismo das operações. Essa flexibilidade é essencial pois possibilita a criação de consultas complexas que extraem informações detalhadas e relevantes para a tomada de decisões.<a id="anchor_2" href="#REF2">^2^</a>


## <a>Objetivo</a>

Este documento tem como objetivo detalhar o uso do DML (Data Manipulation Language) no contexto do projeto. Serão abordadas as principais operações de inserção, atualização, exclusão e consulta de dados, com foco em como essas operações são realizadas dentro do projeto, visando garantir a integridade e eficiência do sistema.

## <a>Dados</a>

**As operações foram divididas em 4 arquivos: Insert, Delete, Update, e Select. O arquivo correspondente às consultas pode ser localizado na página [DQL](https://sbd1.github.io/2024.1-Ben10/modulo2/dql/), enquanto os demais estão exibidos abaixo:**

??? "INSERT"
    #### INSERT

    ```sql
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
    VALUES ('Kit Médico', 5000, 'ativo', 3);

    INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
    VALUES ('Placa de Armadura', 3000, 'inativo', 3);

    INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
    VALUES ('Jato de Fuga', 10000, 'inativo', 1);

    INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
    VALUES ('Campo de Força Portátil', 4000, 'ativo', 1);

    INSERT INTO CONSUMIVEL (nome_item, preco, status, valor_consumivel) 
    VALUES ('Camuflagem Alienígena', 4000, 'ativo', 2);

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
    INSERT INTO ALIEN (nome, descricao, saude, defesa, status_base) VALUES ('Vilgax', 'Alien com força descomunal e resistência extrema.', 550, 140, 130);

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
    VALUES (5, 'Enfrente o Colecionador', 600, 'Derrote o Colecionador e suas criaturas mutantes que ameaçam os encanadores.', 1200);

    -- Inserir pre-requisito das missões na tabela PRE_REQUISITO
    INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
    VALUES (2, 4); -- Necessário completar missão 4 para fazer missão 2

    INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
    VALUES (3, 1); -- Necessário completar missão 1 para fazer missão 3

    INSERT INTO PRE_REQUISITO (id_missao, id_pre_requisito) 
    VALUES (5, 3); -- Necessário completar missão 3 para fazer missão 5

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
    VALUES (1, 5000, 'Chama', 'Ben', 3, 350, 10),
       (2, 500, 'Ultra T', 'Max', 1, 100, 1),
       (3, 500, 'XLR8', 'Kevin', 1, 100, 1),
       (4, 500, 'Massa Cinzenta', 'Gwen', 1, 100, 1);

    -- Inserir registros de missões na tabela REGISTRO_DA_MISSAO
    INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status) 
    VALUES (1, 4, 'em progresso'),
       (2, 1, 'completa'),
       (3, 1, 'incompleta'),
       (4, 1, 'incompleta');

    -- Inserir itens na tabela INVENTARIO
    INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
    VALUES (1, 1, 'Kit Médico'),
       (2, 1, 'Placa de Armadura'),
       (2, 2, 'Kit Médico'),
       (3, 1, 'Jato de Fuga'),
       (3, 2, 'Kit Médico'),
       (4, 1, 'Campo de Força Portátil'),
       (4, 2, 'Kit Médico');

    -- Inserir status do alien na tabela STATUS_DO_ALIEN
    INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
    VALUES ('Chama',150, 1),
       ('Ultra T',75, 2),
       ('XLR8',120, 3),
       ('Massa Cinzenta',130, 4);

    -- Inserir instâncias dos monstros na tabela INSTANCIA_MONSTRO
    INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
    VALUES (1, 'Humano Hipnotizado', 80),
       (2, 'Servo', 75),
       (3, 'Demônio', 50),
       (4, 'Soldado de Elite', 250);

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
    ```

<font size="3"><p style="text-align: center">Fonte: [João Artur](https://github.com/joao-artl).</p></font>

??? "DELETE"
    #### DELETE

    ```sql
      -- =============================== INSTÂNCIA ====================================
      -- Excluir Alien de Status do Alien
      DELETE FROM status_do_alien a
      WHERE a.id_personagem = 1 AND a.nome_alien = 'Massa Cinzenta';

      -- Excluir Monstro de Instância Monstro
      DELETE FROM instancia_monstro m
      WHERE m.id_monstro = 5;

      -- Excluir Instância de Zona de Guerra
      DELETE FROM zona_de_guerra zg
      WHERE zg.id_zona_guerra = 1 AND zg.id_personagem = 2 AND zg.id_monstro = 3;

      -- Excluir Instância de NPC em uma sala
      DELETE FROM instancia_npc_na_sala ns
      WHERE ns.id_sala = 1 AND ns.id_npc = 3;

      -- ========================================= ESPÉCIE ===============================

      -- Excluir um Alien
      BEGIN TRANSACTION;

      -- Primeiro remove o alien da tabela alien
      DELETE FROM alien a
      WHERE a.nome = 'Massa Cinzenta';

      -- Depois, remove o alien da tabela especie
      DELETE FROM especie e
      WHERE e.nome = 'Massa Cinzenta';

      COMMIT;

      -- Excluir um Monstro
      BEGIN TRANSACTION;

      -- Primeiro remove o monstro da tabela monstro
      DELETE FROM monstro m
      WHERE m.nome = 'VILGAX';

      -- Depois, remove o alien da tabela especie
      DELETE FROM especie e
      WHERE e.nome = 'VILGAX';

      COMMIT;

      -- Excluir Especie da tabela especie
      DELETE FROM especie e
      WHERE e.nome = 'VILGAX';

      -- Excluir uma Habilidade
      DELETE FROM habilidade h
      WHERE h.nome_habilidade = 'Super Velocidade';


      -- ========================================= SALA ===============================

      -- Excluir uma Zona de Guerra
      BEGIN TRANSACTION;

      -- Primeiro remove a sala de zona de Guerra
      DELETE FROM zona_de_guerra
      WHERE s.id_sala = 4;

      -- Depois, exclui a sala
      DELETE FROM sala s
      WHERE s.id_sala = 4;

      COMMIT;

      -- Excluir uma Zona de Armadilha
      BEGIN TRANSACTION;

      -- Primeiro remove a sala de zona armadilha
      DELETE FROM zona_de_armadilha 
      WHERE s.id_sala = 3;

      -- Depois, exclui a sala
      DELETE FROM sala s
      WHERE s.id_sala = 3;

      COMMIT;

      -- Excluir sala da tabela Sala
      DELETE FROM sala s
      WHERE s.id_sala = 5;

      -- =========================================== MISSÃO ===================================================

      -- Excluir pré-requisitos da missão
      DELETE FROM pre_requisito pr
      WHERE pr.id_missao = 1 AND pr.id_pre_requisito = 2;

      -- Excluir registro da missão de um personagem
      DELETE FROM registro_da_missao r
      JOIN personagem p ON r.id_personagem = p.id_personagem
      WHERE r.id_missao = 1 AND p.id_personagem = 2;

      -- Excluir a missão
      DELETE FROM missao m
      WHERE m.id_missao = 2;

      -- ============================================= PERSONAGEM =============================================

      -- Excluir item do inventário do personagem
      DELETE FROM inventario i
      WHERE i.id_personagem = 1 AND i.id_item = 1;

      -- Excluir o personagem
      DELETE FROM personagem p
      WHERE p.id_personagem = 5;

      -- =========================================== NPC ==================================

      -- Excluir um npc associado a missao
      DELETE FROM npc n
      WHERE n.id_missao_associada = 2 AND n.id_npc = 1;

      -- Excluir o item do Estoque do Item
      DELETE FROM estoque_do_item ei
      WHERE ei.id_npc = 1 AND ei.nome_item = 'Kit Médico';

      -- Excluir o NPC
      DELETE FROM npc n
      WHERE n.id_npc = 1;

      -- ========================================= ITEM ===============================

      -- Excluir um consumível
      BEGIN TRANSACTION;

      -- Primeiro remove o item da tabela consumível
      DELETE FROM consumivel c
      WHERE c.nome_item = 'Kit Médico';

      -- Depois, remove o item da tabela item
      DELETE FROM item i
      WHERE i.nome_item = 'Kit Médico';

      COMMIT;

      -- Excluir uma arma
      BEGIN TRANSACTION;

      -- Primeiro remove o item da tabela arma
      DELETE FROM arma a
      WHERE c.nome_item = 'Arma Tennyson';

      -- Depois, remove o item da tabela item
      DELETE FROM item i
    ```
<font size="3"><p style="text-align: center">Fonte: [João Artur](https://github.com/joao-artl).</p></font>

??? "UPDATE"
    #### UPDATE

    ```sql
      ---------------------------------------------- PERSONAGEM ----------------------------------------------

      -- Atualização aumentando a quantidade de moedas do jogador
      UPDATE PERSONAGEM
      SET quantidade_moedas = quantidade_moedas + 1000
      WHERE id_personagem = 4;
      -- id_personagem será recebido dinamicamente

      -- Atualizar a sala atual de um personagem
      UPDATE PERSONAGEM
      SET id_sala = 3
      WHERE id_personagem = 1;
      -- id_personagem e id_sala serão recebidos dinamicamente

      -- Atualização alterando o alien associado ao personagem
      UPDATE PERSONAGEM
      SET nome_alien = 'Ultra T'
      WHERE id_personagem = 1;
      -- id_personagem e nome_alien serão recebidos dinamicamente

      -- Atualização reduzindo a saúde do personagem
      UPDATE PERSONAGEM
      SET saude = saude - 100
      WHERE id_personagem = 1;
      -- id_personagem e quantidade a ser subtraída serão recebidos dinamicamente

      -- Atualização aumentando o nível do personagem
      UPDATE PERSONAGEM
      SET nivel = nivel + 1
      WHERE id_personagem = 1;
      -- id_personagem será recebido dinamicamente

      ---------------------------------------------- STATUS_DO_ALIEN ----------------------------------------------

      -- Atualização da saúde do alien no status do alien
      UPDATE STATUS_DO_ALIEN
      SET saude = 120
      WHERE nome_alien = 'Chama' AND id_personagem = 1;
      -- nome_alien e id_personagem serão recebidos dinamicamente

      ---------------------------------------------- REGISTRO_DA_MISSAO ----------------------------------------------

      -- Atualização do status de uma missão para completa
      UPDATE REGISTRO_DA_MISSAO
      SET status = 'completa'
      WHERE id_personagem = 2 AND id_missao = 1;
      -- id_personagem e id_missao serão recebidos dinamicamente

      -- Atualização do status de uma missão para em progresso
      UPDATE REGISTRO_DA_MISSAO
      SET status = 'em progresso'
      WHERE id_personagem = 2 AND id_missao = 1;
      -- id_personagem e id_missao serão recebidos dinamicamente

      ---------------------------------------------- HABILIDADE ----------------------------------------------

      -- Atualização aumentando o dano de uma habilidade em 50%
      UPDATE HABILIDADE
      SET quantidade = quantidade * 1.5
      WHERE nome_especie = 'Quatro Braços' AND nome_habilidade = 'Força Bruta';
      -- nome_especie e nome_habilidade serão recebidos dinamicamente

      ---------------------------------------------- INSTANCIA_MONSTRO ----------------------------------------------

      -- Reduzir a saúde de uma instância de monstro
      UPDATE INSTANCIA_MONSTRO
      SET saude_atual = saude_atual - 50
      WHERE id_monstro = 3;
      -- id_monstro será recebido dinamicamente junto com o dano

      ---------------------------------------------- RECOMPENSA ----------------------------------------------

      -- Atualizar a recompensa recebida por um personagem em uma sala, seta 1 se foi recebida (0 significa que ele não pegou o loot, ele pode querer pegar mais tarde)
      UPDATE RECOMPENSA
      SET recompensa_recebida = 1
      WHERE id_personagem = 1 AND id_sala = 2;
      -- id_personagem e id_sala serão recebidos dinamicamente

      ---------------------------------------------- CONSUMIVEL ----------------------------------------------

      -- Alterar o status de um consumível para ativo
      UPDATE CONSUMIVEL
      SET status = 'ativo'
      WHERE nome_item = 'Placa de Armadura';
      -- nome_item será recebido dinamicamente

      -- Alterar o status de um consumível para inativo
      UPDATE CONSUMIVEL
      SET status = 'inativo'
      WHERE nome_item = 'Placa de Armadura';
      -- nome_item será recebido dinamicamente
    ```
<font size="3"><p style="text-align: center">Fonte: [Arthur Alves](https://github.com/arthrok).</p></font>

## <a>Referência Bibliográfica</a>

> <a id="REF1" href="#anchor_1">1.</a> ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. Tradução: Daniel Vieira. Revisão técnica: Enzo Seraphim; Thatyana de Faria Piola Seraphim. 6. ed. São Paulo: Pearson Addison Wesley, 2011. Capítulo 2 Conceitos e arquitetura do sistema de banco de dados, tópico 2.3 Linguagens e interfaces do banco de dados, páginas 24 e 25

> <a id="REF2" href="#anchor_2">2.</a> SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. Database system concepts. 6. ed. New York: McGraw-Hill, 2011. Cápitulo 1 Introduction, tópico 1.4.1 Data-Manipulation Language, páginas 10 a 12.

## <a>Bibliografia</a>

> DML Relacionamento Stardew Valley. Disponível em: <https://github.com/SBD1/2023.2-Grupo01-StardewValley/blob/main/docs/Entrega-02/DML.sql>. Acesso em 13 de agosto de 2024.

> DML One Shot. Disponível em: <https://sbd1.github.io/2023.2-OneShot/documentos/projeto-fisico/dml/>. Acesso em 13 de agosto de 2024.

## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 13/08 | Criando documento e adicionando introdução e referencias bibliográficas| [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|
| `1.1` | 14/08 | Adicionando INSERT| [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|
| `1.2` | 19/08 | Atualizando INSERT e adicionando DELETE| [João Artur](https://github.com/joao-artl) | [Eric Silveira](https://github.com/ericbky)|
| `1.3` | 19/08 | Adicionando UPDATE | [Arthur Alves](https://github.com/arthrok) | [João Artur](https://github.com/joao-artl)|
