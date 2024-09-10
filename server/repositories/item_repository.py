from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class ItemRepository:
    def __init__(self):
        self.connection = create_connection()

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
        
    def curar_vida_personagem(self, id_personagem, fator):
        """
        Cura a vida do personagem
        """
        try:
            cursor = self.connection.cursor()
            query = """
                UPDATE PERSONAGEM
                SET saude = saude + %s
                WHERE id_personagem = %s;
            """
            cursor.execute(query, (fator, id_personagem,))
            self.connection.commit()
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            return None       

    def curar_vida_alien(self, id_personagem, nome_alien, fator):
        """
        Cura a vida do alien
        """
        try:
            cursor = self.connection.cursor()
            query = """
                UPDATE STATUS_DO_ALIEN
                SET saude = saude + %s
                WHERE id_personagem = %s and nome_alien = %s;
            """
            cursor.execute(query, (fator, id_personagem, nome_alien,))
            self.connection.commit()
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            return None         

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()

item_repository = ItemRepository()
