from repositories.personagem_repository import PersonagemRepository
from services.sala_service import SalaService
from services.npc_service import NpcService
from services.monstro_service import MonstroService
import pandas as pd


class PersonagemService:
    def __init__(self):
        self.personagem_repository = PersonagemRepository()
        self.sala_service = SalaService()
        self.npc_repository = NpcService()
        self.monstro_service = MonstroService()

    def atualizar_sala_personagem(self, id_personagem, id_sala):
        return self.personagem_repository.atualizar_sala_personagem(id_personagem, id_sala)
    
    def trocar_jogador_de_sala(self, id_personagem, id_sala):
        permissao = self.sala_service.verificar_permissao_sala(id_personagem, id_sala)
        if permissao[0]['count']:
            self.personagem_repository.atualizar_sala_personagem(id_personagem, id_sala)
            print(f'Você foi para a sala {id_sala}')
            self.npc_repository.exibir_fala_npc_na_sala(id_sala)
            self.monstro_service.instanciar_monstro(id_sala, id_personagem)
        else:
            print('troca de sala não permitida')

    def exibir_personagem(self, id_personagem):
        dados_personagem = self.personagem_repository.exibir_personagem(id_personagem)

        print(f"\n\n--------------------------------------------------\n")

        for personagem in dados_personagem:
            print(f" ID do seu personagem: {personagem[0]}")
            print(f" Quantidade de moedas do personagem: {personagem[1]}")
            print(f" Nome do Alien atual do personagem: {personagem[2]}")
            print(f" Nome do personagem: {personagem[3]}")
            print(f" ID da sala atual do personagem: {personagem[4]}")
            print(f" Saúde do personagem: {personagem[5]}")
            print(f" Nível do personagem atual: {personagem[6]}")

        print(f"\n--------------------------------------------------")

        return dados_personagem