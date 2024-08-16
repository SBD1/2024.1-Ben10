import psycopg2

connection = psycopg2.connect(
    host="localhost",
    database="postgres_ben10",
    port="5432",
    user="postgres_trabalho_ben10",
    password="1234"
)

cur = connection.cursor()

cur.execute("SELECT version();")

db_version = cur.fetchone()
print(f"Versão do PostgreSQL: {db_version[0]}")

cur.close()
connection.close()
