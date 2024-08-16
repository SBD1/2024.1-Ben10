import psycopg2

def structure_db(cursor, connection):
    try:
        with open('ddl-definitivo.sql', 'r') as file:
            ddl_sql = file.read()
        
        # Divida os comandos SQL em uma lista, separados por ';'
        commands = ddl_sql.split(';')
        
        # Execute cada comando separadamente
        for command in commands:
            if command.strip():  # Verifica se o comando não está vazio
                cursor.execute(command)
        
        connection.commit()
        print("Arquivo .sql executado com sucesso!")

    except Exception as error:
        print(f"Erro ao executar o arquivo .sql: {error}")
        connection.rollback()

def connection_postgreSQL():
    try:
        # Conexão com o banco de dados
        connection = psycopg2.connect(
            host="localhost",
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

        # Executar o script SQL
        structure_db(cursor, connection)

    except Exception as error:
        print(f"Erro na conexão com o PostgreSQL: {error}")

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

connection_postgreSQL()
