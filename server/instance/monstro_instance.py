from repositories.monstro_repository import MonstroRepository
from repositories.personagem_repository import PersonagemRepository

personagem_repository = PersonagemRepository()
monstro_repository = MonstroRepository()

class MonstroInstance:
    def __init__(self, monstro):
        self.id_zona_guerra = monstro.get('id_zona_guerra')
        self.id_personagem = monstro.get('id_personagem')
        self.id_monstro = monstro.get('id_monstro')
        self.nome_especie = monstro.get('nome_especie')
        self.saude_atual = monstro.get('saude_atual')
        self.nome = monstro.get('nome')
        self.id_recompensa = monstro.get('id_recompensa')
        self.dificuldade = monstro.get('dificuldade')
        self.recompensa_em_moedas = monstro.get('recompensa_em_moedas')
        self.saude = monstro.get('saude')
        self.defesa = monstro.get('defesa')
        self.status_base = monstro.get('status_base')

    def receber_dano(self, dano):
        if self.saude_atual - dano <= 0:
            dano = self.saude_atual
        
        self.saude_atual = self.saude_atual - dano

        monstro_repository.receber_dano(self.id_monstro, dano)

        if self.saude_atual == 0:
            print("O monstro foi derrotado")
            # entregar recompensa

    def atacar(self):
        if self.saude_atual == 0:
            return
        
        # função pra dar dano no personagem
        # decidir qual fator vai ser (habilidade ou dano padrão)
        fator = self.status_base
        personagem_repository.receber_dano(self.id_personagem, fator)
        print(f"Você recebeu {fator} de dano!")