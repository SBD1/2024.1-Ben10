from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class NpcRepository:
    def __init__(self):
        self.connection = create_connection(silent=True)

    def verificar_npc_na_sala(self, id_sala):
        """
        Retorna o NPC atrelado à sala com o ID especificado.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT id_npc 
                FROM INSTANCIA_NPC_NA_SALA
                WHERE id_sala = %s
            """
            cursor.execute(query, (id_sala,))
            npc = cursor.fetchone()  # Pega o NPC associado à sala
            cursor.close()
            return npc[0] if npc else None  # Retorna o NPC ou None caso não exista
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def obter_texto_missao(self, id_missao):
        """
        Obtém o texto da missão baseado no ID da missão.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT descricao
                FROM MISSAO
                WHERE id_missao = %s
            """
            cursor.execute(query, (id_missao,))
            resultado = cursor.fetchone()  # Obtém o texto da missão
            cursor.close()
            return resultado[0] if resultado else None  # Retorna o texto da missão ou None
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def obter_fala_npc(self, id_npc):
        """
        Obtém a fala do NPC com base no ID do NPC.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT dialogo_associado_venda, id_missao_associada
                FROM NPC
                WHERE id_npc = %s
            """
            cursor.execute(query, (id_npc,))
            resultado = cursor.fetchone()  # Obtém a linha correspondente ao NPC
            cursor.close()

            if resultado:
                texto_comercio, id_missao = resultado
                texto_missao = self.obter_texto_missao(id_missao) if id_missao else None

                fala = {
                    "textoComercio": texto_comercio,
                    "textoMissao": texto_missao
                }
                return fala
            else:
                return None
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def obter_npcs_sala(self, id_sala):
        """
        Retorna as informações de todos npcs em uma sala
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT n.id_npc, n.dialogo_associado_venda, n.id_missao_associada
                FROM NPC n
                JOIN INSTANCIA_NPC_NA_SALA ins ON ins.id_npc = n.id_npc
                WHERE ins.id_sala = %s;
            """
            cursor.execute(query, (id_sala,))
            lista_npc = fetch_as_dict(cursor)
            cursor.close()
            return lista_npc
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()
