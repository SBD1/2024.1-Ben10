from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class MissaoRepository:
    def __init__(self):
        self.connection = create_connection(silent=True)

    def obter_missao_por_npc(self, id_npc):
        """
        Retorna informações da missão associada ao npc
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT *
                FROM MISSAO
                WHERE id_missao = (
                    SELECT id_missao_associada
                    FROM NPC
                    WHERE id_npc = %s
                )
            """
            cursor.execute(query, (id_npc,))
            missao = fetch_as_dict(cursor)
            cursor.close()
            return missao
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def obter_registro_missao(self, id_personagem, id_missao):
        """
        Retorna informação de uma missao específica que o personagem está fazendo
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT *
                FROM REGISTRO_DA_MISSAO
                WHERE id_personagem = %s and id_missao = %s
            """
            cursor.execute(query, (id_personagem, id_missao,))
            missao = fetch_as_dict(cursor)
            cursor.close()
            return missao
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    # def verificar_pre_requisito(self, id_personagem, id_missao):
    #     """
    #     Retorna informação de uma missao específica que o personagem está fazendo
    #     """
    #     try:
    #         cursor = self.connection.cursor()
    #         query = """
    #             SELECT *
    #             FROM REGISTRO_DA_MISSAO
    #             WHERE id_personagem = %s and id_missao = (
    #                 SELECT id_missao
    #                 FROM MISSAO
    #                 WHERE id_missao
    #             )
    #         """
    #         cursor.execute(query, (id_personagem, id_missao,))
    #         missao = fetch_as_dict(cursor)
    #         cursor.close()
    #         return missao
    #     except Exception as e:
    #         print(f"An error occurred: {e}")
    #         return None

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
