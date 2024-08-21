def fetch_as_dict(cursor):
    """
    Transforma o resultado de uma consulta em uma lista de dicionários,
    onde as chaves são os nomes das colunas e os valores são os dados correspondentes.
    """
    rows = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    return [dict(zip(column_names, row)) for row in rows]
