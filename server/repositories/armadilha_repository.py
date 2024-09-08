from database.db import create_connection
from utils.constants import * 

class ArmadilhaRepository:

    def __init__(self):
        self.connection = create_connection()

    def obter_efeito(self, id_personagem):

        try:

            cursor = self.connection.cursor()

            query_aliens_personagem = """
                SELECT s.nome_alien, s.saude
                FROM status_do_alien s
                WHERE s.id_personagem = %s;
            """

            cursor.execute(query_aliens_personagem, (id_personagem,))
            dados = cursor.fetchall()
            cursor.close()

            return dados

        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        