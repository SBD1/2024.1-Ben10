# 2024.1 - Ben 10

<div align="center">
    <img src="assets\ben-10.jpg" style="width:35vw"/>
    <p> Figura 1: Logo do Ben 10</p> 
</div>

##  Sobre o Projeto 

Projeto criado para a disciplina de Sistema de Banco de Dados 1. Neste projeto, será desenvolvido um MUD onde os conceitos de bancos de dados serão aplicados. Serão solicitadas 3 entregas, cada uma com suas próprias avaliações. Ao fim do projeto, será entregue um jogo funcional inspirado no famoso desenho Ben 10, criada pelo [Man of Action](https://manofaction.tv/).

##  Entregas 
- Módulo 1
    - [Modelo Entidade Relacionamento](https://sbd1.github.io/2024.1-Ben10/modulo1/MER/)
    - [Diagrama Entidade Relacionamento](https://sbd1.github.io/2024.1-Ben10/modulo1/DER/)
    - [Modelo Relacional](https://sbd1.github.io/2024.1-Ben10/modulo1/MR/)
    - [Dicionário de Dados](https://github.com/SBD1/2024.1-Ben10/blob/main/docs/modulo1/dicionario-de-dados.pdf)

- Módulo 2
    - [DDL](https://sbd1.github.io/2024.1-Ben10/modulo2/ddl/)
    - [DML](https://sbd1.github.io/2024.1-Ben10/modulo2/dml/)
    - [DQL](https://sbd1.github.io/2024.1-Ben10/modulo2/dql/)
    - [Álgebra Relacional](https://sbd1.github.io/2024.1-Ben10/modulo2/algebraRelacional/)

##  Apresentações 

- [Módulo 1](https://sbd1.github.io/2024.1-Ben10/apresentacao/apresentacao1/)
- [Módulo 2](https://sbd1.github.io/2024.1-Ben10/apresentacao/apresentacao2/)
- [Módulo 3](https://sbd1.github.io/2024.1-Ben10/apresentacao/apresentacao3/)

##  Como jogar 

###  Ferramentas Necessárias 

Antes de começar, você precisará das seguintes ferramentas instaladas no seu sistema:

- **Git**: Para clonar o repositório.
- **Docker**: Para criar e executar contêineres.
- **Docker Compose**: Para orquestrar múltiplos contêineres e simplificar a execução do projeto.

###  Configuração e Execução 

Siga os passos abaixo para configurar e executar o projeto:

####  1. Clone o Repositório 

Clone o repositório usando o comando abaixo:

```bash
git clone https://github.com/SBD1/2024.1-Ben10.git
```

####  2. Navegue para o Diretório Docker 

Entre no diretório onde o Docker Compose está configurado:

```bash
cd ./2024.1-Ben10/docker
```

####  3. Derrube Contêineres Existentes 

Se você já tem contêineres rodando de uma sessão anterior, derrube-os e remova seus volumes com o comando:

```bash
docker compose down -v
```

####  4. Construa e Inicie os Contêineres 

Construa as imagens Docker e inicie os contêineres em segundo plano com:

```bash
docker compose up --build -d
```

####  5. Acesse o Contêiner e Execute o Jogo 

Depois que os contêineres estiverem em execução, você pode acessar o contêiner principal e iniciar o jogo com o seguinte comando:

```bash
clear
docker exec -it game /bin/bash -c "python3 -u app.py"
```

## Equipe
<center>
<table>
  <tr>
    <td align="center"><a href="https://github.com/Arthrok"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/98776585?v=4" width="100px;" alt=""/><br /><sub><b>Arthur Melo</b></sub></a><br />
    <td align="center"><a href="https://github.com/ericbky"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/65634855?v=4" width="100px;" alt=""/><br /><sub><b>Eric Silveira</b></sub></a><br />
    <td align="center"><a href="https://github.com/joao-artl"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/124414056?v=4" width="100px;" alt=""/><br /><sub><b>João Artur Leles</b></sub></a><br />
    <td align="center"><a href="https://github.com/roddas"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/9947506?s=400&u=9099a80d33941ce041da685cda67347896a85a4b&v=4" width="100px;" alt=""/><br /><sub><b>Rodolfo Cabral Neves</b></sub></a><br />
  </tr>
</table>
</center>