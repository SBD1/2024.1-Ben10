from database.db import create_connection
from random import choice
from utils.database_helpers import fetch_as_dict
from utils.transform import dict_to_list

class ArmadilhaRepository:

    def __init__(self):
        self.connection = create_connection()
    
    def obter_lista_recompensas(self) -> list:
        """
        Obtêm a lista de recompensas em moedas
        """
        try:
            cursor = self.connection.cursor()
            query = 'SELECT recompensa_recebida FROM RECOMPENSA'
            cursor.execute(query)
            recompensas_moedas = fetch_as_dict(cursor)
            cursor.close()
            return dict_to_list(recompensas_moedas,'recompensa_recebida')
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
    
    def ganhar_moeda(self,id_personagem, moedas) -> bool:
        """
        Atualiza as moedas do personagem
        """
        try:
            cursor = self.connection.cursor()
            query = 'UPDATE PERSONAGEM SET quantidade_moedas = quantidade_moedas + {} WHERE id_personagem = {}'.format(moedas,id_personagem)
            cursor.execute(query)
            self.connection.commit()
            cursor.close()
            return True
        except Exception as e:
            print(f"An error occurred: {e}")
            return False

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()