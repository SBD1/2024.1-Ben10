from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class NpcRepository:
    def __init__(self):
        self.connection = create_connection()

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
                SELECT dialogo_associado_venda, id_missao_associada, nome_npc
                FROM NPC
                WHERE id_npc = %s
            """
            cursor.execute(query, (id_npc,))
            resultado = cursor.fetchone()  # Obtém a linha correspondente ao NPC
            cursor.close()

            if resultado:
                texto_comercio, id_missao, nome_npc = resultado
                texto_missao = self.obter_texto_missao(id_missao) if id_missao else None

                fala = {
                    "nomeNpc": nome_npc,
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
                SELECT n.id_npc, n.dialogo_associado_venda, n.id_missao_associada, n.nome_npc
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
        
    def obter_roles_npc(self, id_npc, id_sala):
        """
        Retorna as roles de um npc em determinada sala
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT n.id_npc, n.dialogo_associado_venda, n.id_missao_associada
                FROM NPC n
                JOIN INSTANCIA_NPC_NA_SALA ins ON ins.id_npc = n.id_npc
                WHERE ins.id_sala = %s and n.id_npc = %s;
            """
            cursor.execute(query, (id_sala, id_npc,))
            lista_npc = fetch_as_dict(cursor)
            cursor.close()
            return lista_npc
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def listar_estoque_npc(self, id_npc):
        """
        Retorna o estoque do npc
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT nome_item, preco
                FROM ESTOQUE_DO_ITEM
                WHERE id_npc = %s;
            """
            cursor.execute(query, (id_npc,))
            estoque = fetch_as_dict(cursor)
            cursor.close()
            return estoque
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def inserir_item_inventario(self, id_personagem, nome_item):
        """
        Insere um item no inventário do personagem.
        """
        try:
            cursor = self.connection.cursor()
            query = """
                INSERT INTO INVENTARIO (id_personagem, id_item, nome_item) 
                VALUES (%s, DEFAULT, %s);
            """
            cursor.execute(query, (id_personagem, nome_item))
            self.connection.commit() 
            cursor.close()
        except Exception as e:
            print(f"An error occurred: {e}")
            self.connection.rollback()
            return None
        
    def preco_item(self, id_personagem, nome_itens, key_item_venda):
        try:
            cursor = self.connection.cursor()

            item = nome_itens[key_item_venda]

            query_buscar_item = """
                SELECT 
                    CASE 
                        WHEN i.tipo_item = 'Consumível' THEN c.preco
                        WHEN i.tipo_item = 'Arma' THEN a.preco
                    END AS preco
                FROM item i
                LEFT JOIN arma a ON a.nome_item = i.nome_item
                LEFT JOIN consumivel c ON c.nome_item = i.nome_item
                WHERE i.nome_item = %s;
            """

            cursor.execute(query_buscar_item, (item,))
            preco = cursor.fetchone()
            return preco[0]

        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def vender_item(self, id_personagem, nome_itens, key_item_venda):

        item = nome_itens[key_item_venda]

        try:
            cursor = self.connection.cursor()

            query_inventario = """

            DELETE FROM inventario
            WHERE id_personagem = %s 
            AND nome_item = %s
            AND id_item = (
                SELECT MAX(id_item)
                FROM inventario
                WHERE id_personagem = %s
                AND nome_item = %s
            );

            """

            cursor.execute(query_inventario, (id_personagem, item, id_personagem, item,))

            self.connection.commit()
            cursor.close()

            return

            cursor.execute(query_inventario, (id_personagem,))

            itens = cursor.fetchall()

            cursor.close()

            return itens
        
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection:
            self.connection.close()

npc_repository = NpcRepository()