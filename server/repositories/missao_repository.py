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
    
    def obter_id_missao_pre_requisito(self, id_missao):
        """
        Retorna o id de uma missao pre requisito
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT id_pre_requisito
                FROM PRE_REQUISITO
                WHERE id_missao = %s
            """
            cursor.execute(query, (id_missao,))
            missao = fetch_as_dict(cursor)
            cursor.close()
            return missao
        except Exception as e:
            print(f"An error occurred: {e}")
            return None     
        
    def verificar_pre_requisito(self, id_personagem, id_missao):
        """
        Retorna informação de uma missao completa pelo personagem
        """
        try:
            cursor = self.connection.cursor()
            query = """
                select *
                from registro_da_missao rdm 
                where rdm.id_personagem = %s and rdm.status = 'completa' and rdm.id_missao = %s
            """
            cursor.execute(query, (id_personagem, id_missao,))
            missao = fetch_as_dict(cursor)
            cursor.close()
            return missao
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        

    def instanciar_registro_da_missao(self, id_personagem, id_missao):
        """
        Insere um novo registro na tabela REGISTRO_DA_MISSAO.
        """
        try:
            cursor = self.connection.cursor()

            # Aqui, você pode adaptar a lógica para inserir a quantidade_monstros dependendo do tipo da missão.
            query = """
                INSERT INTO REGISTRO_DA_MISSAO (id_personagem, id_missao, status, quantidade_monstros)
                VALUES (%s, %s, 'em progresso', 0)
            """
            
            cursor.execute(query, (id_personagem, id_missao))
            self.connection.commit()  # Confirma a transação
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            self.connection.rollback()  # Desfaz a transação em caso de erro

    def verificar_item_inventario(self, id_personagem, id_missao):
        """
        Retorna o item no inventario do personagem
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT *
                FROM INVENTARIO
                WHERE id_personagem = %s and nome_item = (
                    SELECT nome_item
                    FROM ENTREGA
                    WHERE id_missao = %s
                )
                LIMIT 1
            """
            cursor.execute(query, (id_personagem, id_missao,))
            item = fetch_as_dict(cursor)
            cursor.close()
            return item
        except Exception as e:
            print(f"An error occurred: {e}")
            return None        

    def concluir_missao(self, id_personagem, id_missao):
        """
        Atualiza o status de uma missão para 'completa' na tabela REGISTRO_DA_MISSAO.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                UPDATE REGISTRO_DA_MISSAO
                SET status = 'completa'
                WHERE id_personagem = %s AND id_missao = %s
            """

            cursor.execute(query, (id_personagem, id_missao))
            self.connection.commit()  # Confirma a transação
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            self.connection.rollback()  # Desfaz a transação em caso de erro

    def entregar_recompensa(self, id_personagem, experiencia, moedas):
        """
        Atualiza o dinherio e nível do personagem de acordo com a recompensa da missao
        """
        try:
            cursor = self.connection.cursor()
            query = """
                UPDATE PERSONAGEM
                SET nivel = nivel + %s,
                    quantidade_moedas = quantidade_moedas + %s
                WHERE id_personagem = %s
            """


            cursor.execute(query, (experiencia, moedas, id_personagem))
            self.connection.commit()  # Confirma a transação
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            self.connection.rollback()  # Desfaz a transação em caso de erro        

    def obter_missao_caca(self, id_missao):
        """
        Retorna a missao de caça pelo id da missao
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT *
                FROM CACA
                WHERE id_missao = %s
            """
            cursor.execute(query, (id_missao,))
            missao = fetch_as_dict(cursor)
            cursor.close()
            return missao
        except Exception as e:
            print(f"An error occurred: {e}")
            return None      

    def verificar_monstros_mortos_missao(self, id_personagem, id_missao, quantidade_monstros):
        """
        Verifica se a quantidade de monstros na tabela REGISTRO_DA_MISSAO 
        é maior ou igual ao argumento quantidade_monstros.
        Retorna True se a condição for satisfeita, caso contrário, False.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT quantidade_monstros
                FROM REGISTRO_DA_MISSAO
                WHERE id_personagem = %s AND id_missao = %s
            """

            cursor.execute(query, (id_personagem, id_missao))
            result = cursor.fetchone()  # Obtém o primeiro resultado

            cursor.close()

            if result and result[0] >= quantidade_monstros:
                return True
            else:
                return False

        except Exception as e:
            print(f"An error occurred: {e}")
            return False


    def tirar_item_inventario(self, id_personagem, id_item):
        """
        Remove um item específico do inventário de um personagem.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                DELETE FROM INVENTARIO
                WHERE id_personagem = %s AND id_item = %s
            """

            cursor.execute(query, (id_personagem, id_item))
            self.connection.commit()  # Confirma a transação
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            self.connection.rollback()  # Desfaz a transação em caso de erro

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
