from database.db import create_connection

class PersonagemRepository:
    def __init__(self):
        self.connection = create_connection()

    def obter_informacoes_personagem(self, id_personagem):
        """
        Retorna todas as informações do personagem
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT * 
                FROM PERSONAGEM p
                WHERE p.id_personagem = %s
            """
            cursor.execute(query, (id_personagem,))
            salas = cursor.fetchall()
            cursor.close()
            return salas
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
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
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
