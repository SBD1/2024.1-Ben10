from database.db import create_connection

class SalaRepository:
    def __init__(self):
        self.connection = create_connection()

    def obter_salas_por_tipo(self, tipo_sala):
        """
        Retorna todas as salas de um determinado tipo.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT * 
                FROM SALA 
                WHERE tipo_sala = %s
            """
            cursor.execute(query, (tipo_sala,))
            salas = cursor.fetchall()
            cursor.close()
            return salas
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def obter_salas_por_regiao(self, nome_regiao):
        """
        Retorna todas as salas de uma determinada região
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT  s.id_sala, s.nome_regiao
                FROM SALA s
                WHERE nome_regiao = %s
            """
            cursor.execute(query, (nome_regiao,))
            salas = cursor.fetchall()
            cursor.close()
            return salas
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def verificar_permissao_sala(self, id_personagem, id_sala):
        """
        Retorna para o jogador se ele pode entrar em uma sala específica
        """
        try:
            cursor = self.connection.cursor()
            query = """
                select COUNT(*)
                from sala s 
                left join registro_da_missao rdm on rdm.id_missao = s.id_pre_req_missao
                where (rdm.id_personagem = %s
                    and rdm.status = 'completa' 
                    or s.id_pre_req_missao is null) 
                and s.id_sala = %s
            """
            cursor.execute(query, (id_personagem, id_sala,))
            salas = cursor.fetchall()
            cursor.close()
            return salas
        except Exception as e:
            print(f"An error occurred: {e}")
            return None


    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
