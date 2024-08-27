from database.db import create_connection
from utils.database_helpers import fetch_as_dict
import os

class PersonagemRepository:
    def __init__(self):
        self.connection = create_connection()

    def atualizar_sala_personagem(self, id_personagem, id_sala):
        """
        Atualiza a sala em que o personagem está
        """
        try:
            cursor = self.connection.cursor()
            query = """
                UPDATE PERSONAGEM
                SET id_sala = %s
                WHERE id_personagem = %s;
            """
            cursor.execute(query, (id_personagem, id_sala))
            self.connection.commit()
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")

    def exibir_personagem(self, id_personagem):

        result = []

        try:
            cursor = self.connection.cursor()
            query =  """
            SELECT p.*
            FROM personagem p
            WHERE p.id_personagem = %s;
            """
            
            cursor.execute(query, (id_personagem,))
            dados = cursor.fetchall()
            cursor.close()

            for row in dados:
                result.append(row)

            if result:
                return result
            else:
                return None

        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def criar_personagem(self, personagem, alien):

        try:
            cursor = self.connection.cursor()

            query_id = """
                SELECT COUNT(p.*)
                FROM PERSONAGEM p;
            """

            cursor.execute(query_id)

            qtd = cursor.fetchone()[0] # vai definir o id no banco, de acordo com a quantidade de personagens

            insert = """
                INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
                VALUES (%s, 1000, %s, %s, 1, 100, 1);
            """

            cursor.execute(insert, (qtd+1, alien, personagem,))

            self.connection.commit()
            cursor.close()

            cursor.close()

            os.system('clear')

            print(f'\n O ID do seu personagem é o número: {qtd+1}')
            print(f'\n Guarde-o para entrar das próximas vezes!\n')

            return qtd+1

        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
