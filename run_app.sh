cd ./docker

# sudo docker compose down -v
sudo docker compose up --build -d

sleep 10

clear

sudo docker exec -it game /bin/bash -c "python3 -u app.py"