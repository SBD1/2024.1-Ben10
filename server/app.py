import psycopg2

def connection_postgreSQL():
    try:
        # Conexão com o banco de dados
        connection = psycopg2.connect(
            host="postgres",  # Usar 'localhost' se testar local, 'postgres' se testar com docker
            database="postgres_ben10",
            port="5432",
            user="postgres_trabalho_ben10",
            password="1234"
        )
        cursor = connection.cursor()

        # Verificar a versão do PostgreSQL
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Versão do PostgreSQL: {db_version[0]}\n")

    except Exception as error:
        print(f"Erro na conexão com o PostgreSQL: {error}")

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            print("close")
            connection.close()

connection_postgreSQL()
