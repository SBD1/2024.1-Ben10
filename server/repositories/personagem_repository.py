from database.db import create_connection

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

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
