import psycopg2
from psycopg2 import OperationalError

def create_connection(silent=False):
    try:
        connection = psycopg2.connect(
            host="postgres",  # Usar 'localhost' se testar localmente, 'postgres' se testar com Docker
            database="postgres_ben10",
            port="5432",
            user="postgres_trabalho_ben10",
            password="1234"
        )
        return connection
    except OperationalError as e:
        print(f"The error '{e}' occurred")
        return None

if __name__ == "__main__":
    conn = create_connection()
    if conn:
        conn.close()