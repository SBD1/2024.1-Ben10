??? "Tabela: PERSONAGEM"
    #### PERSONAGEM

    ```sql
    CREATE TABLE PERSONAGEM (
        id_personagem INT PRIMARY KEY, -- NOT NULL é implícito aqui
        quantidade_moedas INT NOT NULL,
        nome_alien VARCHAR(30) NOT NULL,
        nome VARCHAR(30) NOT NULL,
        id_sala INT,
        saude INT NOT NULL,
        nivel INT NOT NULL,
        FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
    );
    ```

