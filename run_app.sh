sudo docker compose down -v
sudo docker compose up --build -d # Executa em modo detached (em segundo plano)

sleep 10

sudo docker exec -it game /bin/bash -c "python3 -u app.py"