from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class RegiaoRepository:
    def __init__(self):
        self.connection = create_connection

    def obter_todas_regioes(self):
        """
        Retorna todas as salas de uma determinada região
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT *
                FROM REGIAO
            """
            cursor.execute(query)
            lista_regioes = fetch_as_dict(cursor)
            cursor.close()
            return lista_regioes
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def obter_regiao_por_nome(self, indice_regiao : int) -> dict:
        """
        Retorna as informações de uma determinada região
        """
        lista_regiao = self.obter_todas_regioes()
        try:
            return lista_regiao[indice_regiao -1]
        except IndexError:
            print("Não existe esta região.")
        
        return None 

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection():
            self.connection().close()