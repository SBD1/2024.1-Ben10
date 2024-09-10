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