### <a>Introdução</a>
De acordo com Silberschatz et al., os triggers são uma ferramenta importante em bancos de dados, permitindo a execução automática de ações em resposta a eventos, como inserções, atualizações ou exclusões. Esses gatilhos são úteis para garantir integridade referencial, além de automatizar tarefas como o controle de estoque ou o monitoramento de alterações em dados críticos. Funções, por outro lado, oferecem uma maneira de encapsular lógicas complexas em operações reutilizáveis, frequentemente integradas diretamente na execução das consultas SQL, aumentando a flexibilidade e a eficiência dos SGBDs modernos  .

### <a>Objetivo</a>
Este trabalho tem como objetivo explorar as funcionalidades dos **triggers** e **functions** em sistemas de banco de dados relacionais, focando em como essas ferramentas podem ser utilizadas para automatizar processos e garantir a consistência dos dados. Além disso, será abordada a criação de funções externas em linguagens de programação como C e Java, destacando os benefícios e riscos associados à sua integração nos bancos de dados  .

### <a>Exemplos de Triggers e Functions</a>
Nesta seção, são apresentados exemplos de **triggers** e **functions** implementados em SQL, com descrições detalhadas de suas funcionalidades. Por exemplo, um trigger pode ser utilizado para garantir que, ao atualizar uma tabela de inventário, seja verificada a quantidade mínima de um item, disparando automaticamente uma ordem de reposição quando o nível estiver abaixo do mínimo. Já uma função pode ser definida para calcular o número de alunos matriculados em um curso específico, utilizando a linguagem C para otimizar o processamento.

??? "Trigger: verificar_exclusividade_missao"

    ```sql
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
    ```

??? "Trigger: ajustar_quantidade_monstros"

    ```sql
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
    ```

??? "Trigger: atualizar_vida"

    ```sql
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
    ```

??? "Trigger: atualizar_vida_alien"

    ```sql
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
    BEFORE INSERT OR UPDATE ON STATUS_DO_ALIEN
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_vida_alien();
    ```

??? "Trigger: atualizar_vida_monstro"

    ```sql
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
    ```

??? "Trigger: verifica_arma_inventario"

    ```sql
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
    ```

??? "Trigger: destransformar_personagem"

    ```sql
    CREATE OR REPLACE FUNCTION destransformar_personagem() RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.saude <= 0 THEN
            UPDATE PERSONAGEM
            SET nome_alien = NULL
            WHERE id_personagem = NEW.id_personagem;
        END IF;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER trg_destransformar_personagem
    AFTER UPDATE ON STATUS_DO_ALIEN
    FOR EACH ROW
    WHEN (NEW.saude <= 0)
    EXECUTE FUNCTION destransformar_personagem();
    ```

??? "Função: curar_alien_gradativamente"

    ```sql
    CREATE OR REPLACE FUNCTION curar_alien_gradativamente(personagem_id INTEGER) RETURNS VOID AS $$
    DECLARE
        cursor_aliens CURSOR FOR 
            SELECT sda.*, a.saude AS saude_maxima 
            FROM STATUS_DO_ALIEN sda 
            JOIN ALIEN a ON a.nome = sda.nome_alien 
            WHERE sda.id_personagem = personagem_id;

        alien_row RECORD;
        nivel_personagem INTEGER;
    BEGIN
        SELECT nivel INTO nivel_personagem
        FROM PERSONAGEM
        WHERE id_personagem = personagem_id;

        FOR alien_row IN cursor_aliens LOOP
            UPDATE STATUS_DO_ALIEN
            SET saude = LEAST(saude + GREATEST(FLOOR(alien_row.saude_maxima * nivel_personagem * 0.02), 1), alien_row.saude_maxima * nivel_personagem)
            WHERE nome_alien = alien_row.nome_alien AND id_personagem = alien_row.id_personagem;
        END LOOP;
    END;
    $$ LANGUAGE plpgsql;
    ```

??? "Trigger: insere_item"

    ```sql
    -- Trigger dos itens
    CREATE OR REPLACE FUNCTION insere_item() RETURNS TRIGGER AS $check_item$
    BEGIN
        IF new.tipo_item IS NULL THEN
            RETURN NULL;
        END IF;
        IF NEW.tipo_item = 'Consumível' THEN
            PERFORM * FROM item WHERE nome_item = NEW.nome_item AND tipo_item = 'Arma';
            IF FOUND THEN 
                RAISE EXCEPTION 'O item não pode ter dois tipos';
            END IF;
        END IF;
        IF NEW.tipo_item = 'Arma' THEN
            PERFORM * FROM item WHERE nome_item = NEW.nome_item AND tipo_item = 'Consumível';
            IF FOUND THEN 
                RAISE EXCEPTION 'O item não pode ter dois tipos';
            END IF;
        END IF;
        RETURN NEW;
    END;
    $check_item$ LANGUAGE plpgsql;

    CREATE TRIGGER check_insere_item 
    BEFORE INSERT OR UPDATE ON item
    FOR EACH ROW EXECUTE PROCEDURE insere_item();
    ```

??? "Trigger: insere_consumivel"

    ```sql
    -- Trigger dos consumíveis
    CREATE OR REPLACE FUNCTION insere_consumivel() RETURNS TRIGGER AS $check_consumivel$
    BEGIN
        PERFORM * FROM item WHERE nome_item = NEW.nome_item AND tipo_item = 'Arma';
        IF FOUND THEN 
            RAISE EXCEPTION 'O item é uma arma e não um consumível';
        END IF;
        RETURN NEW;
    END;
    $check_consumivel$ LANGUAGE plpgsql;

    CREATE TRIGGER check_insere_consumivel 
    BEFORE INSERT OR UPDATE ON CONSUMIVEL
    FOR EACH ROW EXECUTE PROCEDURE insere_consumivel();
    ```

??? "Trigger: insere_arma"

    ```sql
    -- Trigger das armas
    CREATE OR REPLACE FUNCTION insere_arma() RETURNS TRIGGER AS $check_arma$
    BEGIN
        PERFORM * FROM item WHERE nome_item = NEW.nome_item AND tipo_item = 'Consumível';
        IF FOUND THEN 
            RAISE EXCEPTION 'O item é um consumível e não uma arma';
        END IF;
        RETURN NEW;
    END;
    $check_arma$ LANGUAGE plpgsql;

    CREATE TRIGGER check_insere_arma
    BEFORE INSERT OR UPDATE ON ARMA
    FOR EACH ROW EXECUTE PROCEDURE insere_arma();
    ```
