# Álgebra Relacional


### MISSÃO

**1. Consultar os detalhes de todas as missões associadas a um determinado NPC:**

\[
\pi_{n.id\_npc, m.*} (\sigma_{inns.id\_sala = 2} ((instancia\_npc\_na\_sala \bowtie_{id\_npc} npc) \bowtie_{id\_missao = id\_missao\_associada} missao))
\]


## <a>Histórico de Versão</a>

| Versão| Data | Descrição  | Autor(es)  | Revisor(es) |
| ----- |----- | ---------- | ---------- | ----------- | 
| `1.0` | 28/08 | Criando documento e adicionando introdução e referencias bibliográficas| [João Artur](https://github.com/joao-artl) | [Arthur Alves](https://github.com/arthrok)|
| `1.1` | 28/08 | Adicionando Álgebra Relacional das consultas| [João Artur](https://github.com/joao-artl) | [Arthur Alves](https://github.com/arthrok)|