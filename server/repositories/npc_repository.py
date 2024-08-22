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
        cursor.execute(query, id_sala)
        npc = cursor.fetchone()  # Pega o npc associado a sala
        cursor.close()
        connection.close()
        return npc[0] # Retorna o NPC ou None caso não exista
    except Exception as e:
        print(f"An error occurred: {e}")
        return None
