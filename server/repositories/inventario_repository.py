from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class InventarioRepository:
    def __init__(self):
        self.connection = create_connection()

    def obter_armas(self) -> list:
            """
            Retorna todas as armas
            """
            try:
                cursor = self.connection.cursor()
                query = """
                    SELECT *
                    FROM ARMA
                """
                cursor.execute(query)
                lista_armas = fetch_as_dict(cursor)
                cursor.close()
                return lista_armas
            except Exception as e:
                print(f"An error occurred: {e}")
                return None
            
    def obter_arma(self, posicao : str) -> dict:
        """
        Retorna um determinado consumível
        """
        indice = int(posicao)
        if (isinstance(indice, int) == False):
            print("Opção inválida. Selecione novamente :-(")
            return None
        
        lista_arma = self.obter_armas()
        
        try:
            return lista_arma[indice - 1]
        except IndexError:
            print("Não existe esta arma.") 
    
    def comprar_consumivel(self, consumivel : dict, id_personagem : str) -> None:
        personagem = PersonagemRepository()
        preco = int(consumivel.get('preco'))
        valor = personagem.obter_moedas()
        print(preco, valor)


    def obter_consumiveis(self) -> list:
        """
        Retorna todos os consumíveis
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT *
                FROM ESTOQUE_DO_ITEM
            """
            cursor.execute(query)
            lista_consumiveis = fetch_as_dict(cursor)
            cursor.close()
            return lista_consumiveis
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
    

    def obter_consumível(self, posicao : str) -> dict:
        """
        Retorna um determinado consumível
        """
        indice = int(posicao)
        if (isinstance(indice, int) == False):
            print("Opção inválida. Selecione novamente :-(")
            return None
        
        lista_consumiveis = self.obter_consumiveis()
        
        try:
            return lista_consumiveis[indice - 1]
        except IndexError:
            print("Não existe este consumível.") 
         
    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
