from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class HabilidadeRepository:
    def __init__(self):
        self.connection = create_connection

    def obter_habilidades_especie(self, nome_especie):
        """
        Retorna as habilidades de uma espécie
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT *
                FROM HABILIDADE
                WHERE nome_especie = %s;
            """
            cursor.execute(query, (nome_especie,))
            habilidades = fetch_as_dict(cursor)
            cursor.close()
            return habilidades
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection():
            self.connection().close()
