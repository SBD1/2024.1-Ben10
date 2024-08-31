<center>
# <a>Ben 10 - 2024.1</a>
</center>

<div style="text-align: center;">
    <img src="assets/ben-10.jpg" style="width: 30vw; border-radius: 20%;"/>
    <p><b>Figura 1:</b> Logo do Ben 10</p>
</div>


## <a>Sobre o Projeto</a>

Projeto criado para a disciplina de Sistema de Banco de Dados 1. Neste projeto, será desenvolvido um MUD onde os conceitos de bancos de dados serão aplicados. Serão solicitadas 3 entregas, cada uma com suas próprias avaliações. Ao fim do projeto, será entregue um jogo funcional inspirado no famoso desenho Ben 10, criada pelo [Man of Action](https://manofaction.tv/).

## <a>Entregas</a>
- Módulo 1
    - [Modelo Entidade Relacionamento](https://sbd1.github.io/2024.1-Ben10/modulo1/MER/)
    - [Diagrama Entidade Relacionamento](https://sbd1.github.io/2024.1-Ben10/modulo1/DER/)
    - [Modelo Relacional](https://sbd1.github.io/2024.1-Ben10/modulo1/MR/)
    - [Dicionário de Dados](https://github.com/SBD1/2024.1-Ben10/blob/main/docs/modulo1/dicionario-de-dados.pdf)

- Módulo 2
    - [DDL](https://sbd1.github.io/2024.1-Ben10/modulo2/ddl/)
    - [DML](https://sbd1.github.io/2024.1-Ben10/modulo2/dml/)
    - [DQL](https://sbd1.github.io/2024.1-Ben10/modulo2/dql/)

## <a>Apresentações</a>

- [Módulo 1](https://sbd1.github.io/2024.1-Ben10/apresentacao/apresentacao1/)
- [Módulo 2](https://sbd1.github.io/2024.1-Ben10/apresentacao/apresentacao2/)

## <a>Como jogar</a>

### <a>Ferramentas Necessárias</a>

Antes de começar, você precisará das seguintes ferramentas instaladas no seu sistema:

- **Git**: Para clonar o repositório.
- **Docker**: Para criar e executar contêineres.
- **Docker Compose**: Para orquestrar múltiplos contêineres e simplificar a execução do projeto.

### <a>Configuração e Execução</a>

Siga os passos abaixo para configurar e executar o projeto:

#### <a>1. Clone o Repositório</a>

Clone o repositório usando o comando abaixo:

```bash
git clone https://github.com/SBD1/2024.1-Ben10.git
```

#### <a>2. Navegue para o Diretório Docker</a>

Entre no diretório onde o Docker Compose está configurado:

```bash
cd ./2024.1-Ben10/docker
```

#### <a>3. Derrube Contêineres Existentes</a>

Se você já tem contêineres rodando de uma sessão anterior, derrube-os e remova seus volumes com o comando:

```bash
docker compose down -v
```

#### <a>4. Construa e Inicie os Contêineres</a>

Construa as imagens Docker e inicie os contêineres em segundo plano com:

```bash
docker compose up --build -d
```

#### <a>5. Acesse o Contêiner e Execute o Jogo</a>

Depois que os contêineres estiverem em execução, você pode acessar o contêiner principal e iniciar o jogo com o seguinte comando:

```bash
clear
docker exec -it game /bin/bash -c "python3 -u app.py"
```

## <a>Equipe</a>
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