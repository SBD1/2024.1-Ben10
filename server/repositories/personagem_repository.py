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
            cursor.execute(query, (id_sala, id_personagem))
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

            insert = """
                INSERT INTO PERSONAGEM (id_personagem, quantidade_moedas, nome_alien, nome, id_sala, saude, nivel) 
                VALUES (DEFAULT, 1000, %s, %s, 1, 100, 1)
                RETURNING id_personagem;
            """

            cursor.execute(insert, (alien, personagem,))

            id_personagem_criado = cursor.fetchone()[0]

            self.connection.commit()

            os.system('clear')

            print(f'\n O ID do seu personagem é o número: {id_personagem_criado}')
            print(f'\n Guarde-o para entrar das próximas vezes!\n')

            query_inventario = """
            INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
            VALUES (%s, 1, 'Kit Médico'),
                (%s, 2, 'Placa de Armadura');
            """

            cursor.execute(query_inventario, (id_personagem_criado, id_personagem_criado,))

            self.connection.commit()

            query_alien = """
            SELECT a.*
            FROM alien a
            WHERE a.nome = %s;
            """

            cursor.execute(query_alien, (alien,))

            vida_alien = cursor.fetchone()[2]

            query_status_alien = """
            INSERT INTO STATUS_DO_ALIEN (nome_alien, saude, id_personagem)
            VALUES (%s, %s, %s);
            """
            cursor.execute(query_status_alien, (alien, vida_alien, id_personagem_criado,))

            self.connection.commit()

            cursor.close()

            return id_personagem_criado

        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def exibir_inventario(self, id_personagem):

        itens = []

        try:
            cursor = self.connection.cursor()

            query_inventario = """

            SELECT i.*
            FROM inventario i
            WHERE i.id_personagem = %s

            """

            cursor.execute(query_inventario, (id_personagem,))

            itens = cursor.fetchall()

            cursor.close()

            return itens
        
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def descontar_moedas_personagem(self, id_personagem, preco):
        """
        Desconta as moedas do personagem
        """
        try:
            cursor = self.connection.cursor()
            query = """
                UPDATE PERSONAGEM
                SET quantidade_moedas = quantidade_moedas - %s
                WHERE id_personagem = %s;
            """
            cursor.execute(query, (preco, id_personagem))
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
