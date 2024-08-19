-- Atualização aumentando a quantidade de moedas do jogador
UPDATE PERSONAGEM
SET quantidade_moedas = quantidade_moedas + 1000
WHERE id_personagem = 4;
-- id_personagem será recebido dinamicamente


-- Atualização do status de uma missão para completa
UPDATE REGISTRO_DA_MISSAO
SET status = 'completa'
WHERE id_personagem = 2 AND id_missao = 1;
-- id_personagem e id_missao serão recebidos dinamicamente

-- Reduzir a saúde de uma instância de monstro
UPDATE INSTANCIA_MONSTRO
SET saude_atual = saude_atual - 50
WHERE id_monstro = 3;
-- id_monstro será recebido dinamicamente junto com o dano


-- Atualizar a sala atual de um personagem
UPDATE PERSONAGEM
SET id_sala = 3
WHERE id_personagem = 1;
-- id_personagem e id_sala serão recebidos dinamicamente

-- Atualizar a recompensa recebida por um personagem em uma sala
UPDATE RECOMPENSA
SET recompensa_recebida = 700
WHERE id_personagem = 1 AND id_sala = 2;
-- id_personagem e id_sala serão recebidos dinamicamente

-- Alterar o status de um consumível para ativo
UPDATE CONSUMIVEL
SET status = 'ativo'
WHERE nome_item = 'Placa de Armadura';
-- nome_item será recebido dinamicamente