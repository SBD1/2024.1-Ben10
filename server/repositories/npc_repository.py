from database.db import create_connection

def verificar_npc_na_sala(id_sala):

    # Retorna o NPC atrelado à sala com o ID especificado.

    try:
        connection = create_connection(silent=True)
        cursor = connection.cursor()
        query = """
            SELECT id_npc 
            FROM INSTANCIA_NPC_NA_SALA
            WHERE id_sala = %s
        """
        cursor.execute(query, (id_sala,))
        npc = cursor.fetchone()  # Pega o npc associado a sala
        cursor.close()
        connection.close()
        return npc[0] # Retorna o NPC ou None caso não exista
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def obter_texto_missao(id_missao):
    
    # Obtém o texto da missão baseado no ID da missão.

    try:
        connection = create_connection(silent=True)
        cursor = connection.cursor()
        query = """
            SELECT descricao
            FROM MISSAO
            WHERE id_missao = %s
        """
        cursor.execute(query, (id_missao,))
        resultado = cursor.fetchone()  # Obtém o texto da missão
        
        cursor.close()
        connection.close()

        if resultado:
            return resultado[0]  # Retorna o texto da missão
        else:
            return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def obter_fala_npc(id_npc):

    # Obtém a fala do NPC com base no ID do NPC. 

    try:
        connection = create_connection(silent=True)
        cursor = connection.cursor()
        query = """
            SELECT dialogo_associado_venda, id_missao_associada
            FROM NPC
            WHERE id_npc = %s
        """
        cursor.execute(query, (id_npc,))
        resultado = cursor.fetchone()  # Obtém a linha correspondente ao NPC

        cursor.close()
        connection.close()

        if resultado:
            texto_comercio, id_missao = resultado
            if id_missao:
                texto_missao = obter_texto_missao(id_missao)
            else:
                texto_missao = None

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
