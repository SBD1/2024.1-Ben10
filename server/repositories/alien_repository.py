from database.db import create_connection

class AlienRepository:

    def __init__(self):
        self.connection = create_connection()

    def exibir_aliens(self, id_personagem):

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
        
    def trocar_alien(self, id_personagem, nome_alien):
        
        try:
            cursor = self.connection.cursor()

            query_trocar_personagem = """
                UPDATE personagem
                SET nome_alien = %s
                WHERE id_personagem = %s

            """

            cursor.execute(query_trocar_personagem, (nome_alien, id_personagem,))

            self.connection.commit()

            cursor.close()

            return True

        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def exibir_alien_atual(self, id_personagem):
        
        try:

            cursor = self.connection.cursor()

            query = """

            SELECT p.nome_alien, s.saude
            FROM personagem p
            JOIN status_do_alien s
            ON p.nome_alien = s.nome_alien 
            WHERE s.id_personagem = %s;

            """

            cursor.execute(query, (id_personagem,))

            dados = cursor.fetchone()

            cursor.close()

            return dados

        except Exception as e:
            print(f"An error occurred: {e}")
            return None
            