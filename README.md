# 2024.1-Ben10

Bem-vindo ao repositório do projeto 2024.1-Ben10! Este projeto é um jogo desenvolvido em Python, que roda dentro de um contêiner Docker. Aqui estão as instruções para configurar, construir e executar o jogo.

## Ferramentas Necessárias

Antes de começar, você precisará das seguintes ferramentas instaladas no seu sistema:

- **Git**: Para clonar o repositório.
- **Docker**: Para criar e executar contêineres.
- **Docker Compose**: Para orquestrar múltiplos contêineres e simplificar a execução do projeto.

## Configuração e Execução

Siga os passos abaixo para configurar e executar o projeto:

### 1. Clone o Repositório

Clone o repositório usando o comando abaixo:

```bash
git clone https://github.com/SBD1/2024.1-Ben10.git
```

### 2. Navegue para o Diretório Docker

Entre no diretório onde o Docker Compose está configurado:

```bash
cd ./2024.1-Ben10/docker
```

### 3. Derrube Contêineres Existentes

Se você já tem contêineres rodando de uma sessão anterior, derrube-os e remova seus volumes com o comando:

```bash
docker compose down -v
```

### 4. Construa e Inicie os Contêineres

Construa as imagens Docker e inicie os contêineres em segundo plano com:

```bash
docker compose up --build -d
```

### 5. Acesse o Contêiner e Execute o Jogo

Depois que os contêineres estiverem em execução, você pode acessar o contêiner principal e iniciar o jogo com o seguinte comando:

```bash
clear
docker exec -it game /bin/bash -c "python3 -u app.py"
```