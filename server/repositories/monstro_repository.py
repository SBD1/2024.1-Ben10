from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class MonstroRepository:
    def __init__(self):
        self.connection = create_connection()

    def obter_monstros_por_dificuldade_sala(self, id_sala):
        """
        Retorna uma lista de monstros filtrados pela dificuldade de alguma sala
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT m.nome
                FROM MONSTRO m
                WHERE m.dificuldade = (
                    SELECT zn2.dificuldade
                    FROM ZONA_DE_GUERRA zn2
                    WHERE zn2.id_sala = %s
                );
            """
            cursor.execute(query, (id_sala))
            monstros = fetch_as_dict(cursor)
            cursor.close()
            return monstros
        except Exception as e:
            print(f"An error occurred: {e}")        

    def instanciar_monstro(self, id_sala, id_personagem, monstros):
        """
        Instancia monstros na sala aleatoriamente de acordo com a dificuldade da sala
        e insere a relação na tabela INSTANCIA_ZONA_GUERRA.
        param: monstros é uma lista de nomes de monstros (PK da tabela MONSTRO)
        """
        try:
            cursor = self.connection.cursor()
            
            # Query para inserir na tabela INSTANCIA_MONSTRO
            query_insert_monstro = """
                INSERT INTO INSTANCIA_MONSTRO (id_monstro, nome_especie, saude_atual) 
                VALUES (DEFAULT, %s, 100)
                RETURNING id_monstro;
            """
            
            # Query para inserir na tabela INSTANCIA_ZONA_GUERRA
            query_insert_zona_guerra = """
                INSERT INTO INSTANCIA_ZONA_GUERRA (id_zona_guerra, id_personagem, id_monstro)
                VALUES (%s, %s, %s);
            """

            for nome_monstro in monstros:
                cursor.execute(query_insert_monstro, (nome_monstro,))
                id_monstro = cursor.fetchone()[0]  # pega o id do monstro

                cursor.execute(query_insert_zona_guerra, (id_sala, id_personagem, id_monstro))
            
            self.connection.commit()
            cursor.close()
            
        except Exception as e:
            print(f"An error occurred: {e}")



    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
