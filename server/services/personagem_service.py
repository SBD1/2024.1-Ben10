from repositories.personagem_repository import PersonagemRepository
from services.sala_service import SalaService
from services.npc_service import NpcService
from services.monstro_service import MonstroService
import os


class PersonagemService:
    def __init__(self):
        self.personagem_repository = PersonagemRepository()
        self.sala_service = SalaService()
        self.npc_service = NpcService()
        self.monstro_service = MonstroService()

    def atualizar_sala_personagem(self, id_personagem, id_sala):
        return self.personagem_repository.atualizar_sala_personagem(id_personagem, id_sala)
    
    def trocar_jogador_de_sala(self, id_personagem, id_sala):
        permissao = self.sala_service.verificar_permissao_sala(id_personagem, id_sala)
        if permissao[0]['count']:
            self.personagem_repository.atualizar_sala_personagem(id_personagem, id_sala)
            print(f'Você foi para a sala {id_sala}')
            self.npc_service.exibir_fala_npc_na_sala(id_sala)
            self.monstro_service.instanciar_monstro(id_sala, id_personagem)
        else:
            print('troca de sala não permitida')

    def obter_sala_personagem(self, id_personagem):
        id_sala = self.personagem_repository.exibir_personagem(id_personagem)[0][4]
        return id_sala

    def obter_saldo_personagem(self, id_personagem):
        id_sala = self.personagem_repository.exibir_personagem(id_personagem)[0][1]
        return id_sala

    def exibir_personagem(self, id_personagem, infos):
        dados_personagem = self.personagem_repository.exibir_personagem(id_personagem)

        if infos == 'S':
            print(f"\n-----------------------------------------------\n")

            for personagem in dados_personagem:
                print(f" ID do seu personagem: {personagem[0]}")
                print(f" Quantidade de moedas do personagem: {personagem[1]}")
                print(f" Nome do Alien atual do personagem: {personagem[2]}")
                print(f" Nome do personagem: {personagem[3]}")
                print(f" ID da sala atual do personagem: {personagem[4]}")
                print(f" Saúde do personagem: {personagem[5]}")
                print(f" Nível do personagem atual: {personagem[6]}")

            print(f"\n-----------------------------------------------")

        return dados_personagem
    
    def criar_personagem(self, personagem, alien):
        id_personage_criado = self.personagem_repository.criar_personagem(personagem, alien)
        self.exibir_personagem(id_personage_criado, 'S')
        return id_personage_criado
    
    def exibir_inventario(self, id_personagem):
        itens = self.personagem_repository.exibir_inventario(id_personagem)

        nome_itens = [item[2] for item in itens]


        os.system('clear')
        print(f"\n-----------------------------------------------")
        print('-------------Itens do inventário----------------\n')

        for row in nome_itens:
            print(row)

        print(f"\n-----------------------------------------------")

    def descontar_moedas_personagem(self, id_personagem, quantidade):
        return self.personagem_repository.descontar_moedas_personagem(id_personagem, quantidade)
    
    def obter_itens_tipo_consumivel(self, id_personagem):
        items = self.personagem_repository.obter_itens_tipo_consumivel(id_personagem)
        return items

    def receber_dano(self, id_personagem, fator):
        ## diminuir no global set
        return self.personagem_repository.receber_dano(id_personagem, fator)