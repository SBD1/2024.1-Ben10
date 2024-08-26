from database.db import create_connection
from utils.database_helpers import fetch_as_dict

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

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
