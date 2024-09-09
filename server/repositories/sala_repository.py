from database.db import create_connection
from utils.database_helpers import fetch_as_dict

class SalaRepository:
    def __init__(self):
        self.connection = create_connection

    def obter_todas_regioes(self):
        """
        Retorna todas as salas de uma determinada região
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT *
                FROM REGIAO
            """
            cursor.execute(query)
            lista_regioes = fetch_as_dict(cursor)
            cursor.close()
            return lista_regioes
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def obter_regiao_por_nome(self, indice_regiao : int) -> dict:
        """
        Retorna as informações de uma determinada região
        """
        lista_regiao = self.obter_todas_regioes()
        try:
            return lista_regiao[indice_regiao -1]
        except IndexError:
            print("Não existe esta região.")
        
        return None 
    
    def obter_salas_por_tipo(self, tipo_sala):
        """
        Retorna todas as salas de um determinado tipo.
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT * 
                FROM SALA 
                WHERE tipo_sala = %s
            """
            cursor.execute(query, (tipo_sala,))
            salas = fetch_as_dict(cursor)
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
            cursor = self.connection().cursor()
            query = """
                SELECT  s.id_sala
                FROM SALA s
                WHERE nome_regiao = %s
            """
            cursor.execute(query, (nome_regiao,))
            salas = fetch_as_dict(cursor)
            cursor.close()
            return salas
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def verificar_permissao_sala(self, id_personagem, id_sala):
        """
        Retorna um número indicando a quantidade de tuplas
        No caso de existir tupla, ele tem os pré-requisitos pra entrar na sala
        """
        try:
            cursor = self.connection().cursor()
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
            resultado = fetch_as_dict(cursor)
            cursor.close()
            return resultado
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def verificar_zona_guerra(self, id_sala):
        """
        Retorna 1 quando a sala for uma zona de guerra
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT COUNT(*)
                FROM SALA
                WHERE id_sala = %s and tipo_sala = 'Zona de Guerra';
            """
            cursor.execute(query, (id_sala,))
            resposta = fetch_as_dict(cursor)
            cursor.close()
            return resposta
        except Exception as e:
            print(f"An error occurred: {e}")

    def verificar_instancia_zona_guerra(self, id_personagem, id_zona_guerra):
        """
        Retorna a tupla do personagem em uma zona de guerra específica
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT *
                FROM INSTANCIA_ZONA_GUERRA
                WHERE id_personagem = %s and id_zona_guerra = %s;
            """
            cursor.execute(query, (id_personagem, id_zona_guerra))
            resposta = fetch_as_dict(cursor)
            cursor.close()
            return resposta
        except Exception as e:
            print(f"An error occurred: {e}")

    def verificar_npc_regiao(self, id_regiao):
        """
        Obtém os NPCs presentes na região, com suas respectivas salas.
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT s.id_sala, n.id_missao_associada
                FROM NPC n
                INNER JOIN INSTANCIA_NPC_NA_SALA i ON n.id_npc = i.id_npc
                INNER JOIN SALA s ON i.id_sala = s.id_sala
                INNER JOIN REGIAO r ON s.nome_regiao = r.nome_regiao
                WHERE r.nome_regiao = %s
            """
            cursor.execute(query, (id_regiao,))
            resultados = cursor.fetchall()  # Obtém todas as linhas correspondentes aos NPCs
            cursor.close()

            npcs = []
            for resultado in resultados:
                id_sala, id_missao = resultado

                npc = {
                    "idSala": id_sala,
                    "idMissaoAssociada": id_missao,
                }
                npcs.append(npc)

            return npcs if npcs else None
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
        
    def obter_pre_requisitos_missao_por_regiao(self, nome_regiao):
        """
        Obtém os pré-requisitos, ID da missão e sala onde o NPC da missão foi instanciado para uma determinada região.
        """
        try:
            cursor = self.connection().cursor()
            query = """
                SELECT PRE_REQUISITO.id_pre_requisito AS pre_requisito, INSTANCIA_NPC_NA_SALA.id_sala AS sala_npc
                FROM PRE_REQUISITO
                INNER JOIN MISSAO ON PRE_REQUISITO.id_missao = MISSAO.id_missao
                INNER JOIN NPC ON NPC.id_missao_associada = MISSAO.id_missao
                INNER JOIN INSTANCIA_NPC_NA_SALA ON INSTANCIA_NPC_NA_SALA.id_npc = NPC.id_npc
                INNER JOIN SALA ON INSTANCIA_NPC_NA_SALA.id_sala = SALA.id_sala
                WHERE SALA.nome_regiao = %s;
            """
            cursor.execute(query, (nome_regiao,))
            resultados = cursor.fetchall()
            cursor.close()

            pre_requisitos = [{
                "pre_requisito": pre_requisito,
                "sala_npc": sala_npc
            } for pre_requisito, sala_npc in resultados]

            return pre_requisitos if pre_requisitos else None

        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        if self.connection():
            self.connection().close()
