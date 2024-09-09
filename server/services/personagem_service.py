from repositories.personagem_repository import PersonagemRepository
from services.sala_service import SalaService
from services.npc_service import NpcService
from services.monstro_service import MonstroService
from repositories.npc_repository import NpcRepository
import os
from config.config import GLOBAL_SETS


class PersonagemService:
    def __init__(self):
        self.personagem_repository = PersonagemRepository()
        self.sala_service = SalaService()
        self.npc_service = NpcService()
        self.monstro_service = MonstroService()
        self.npc_repository = NpcRepository()

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
        id_sala = self.personagem_repository.exibir_personagem(id_personagem)
        return id_sala[0].get('id_sala')

    def obter_saldo_personagem(self, id_personagem):
        id_sala = self.personagem_repository.exibir_personagem(id_personagem)
        return id_sala[0].get('quantidade_moedas')

    def exibir_personagem(self, id_personagem, infos):

        dados = self.personagem_repository.exibir_personagem(id_personagem)[0]

        if infos == 'S':
            print(f"\n-----------------------------------------------\n")

            print(f" ID do seu personagem: {dados.get('id_personagem')}")
            print(f" Quantidade de moedas do personagem: {dados.get('quantidade_moedas')}")
            print(f" Nome do Alien atual do personagem: {dados.get('nome_alien')}")
            print(f" Arma atual usada pelo personagem: {dados.get('arma')}")
            print(f" Nome do personagem: {dados.get('nome')}")
            print(f" ID da sala atual do personagem: {dados.get('id_sala')}")
            print(f" Saúde do personagem: {dados.get('saude')}")
            print(f" Nível do personagem atual: {dados.get('nivel')}")

            print(f"\n-----------------------------------------------")

        return dados.get('id_personagem')
    
    def criar_personagem(self, personagem, alien):
        id_personagem_criado = self.personagem_repository.criar_personagem(personagem, alien)
        self.exibir_personagem(id_personagem_criado, 'S')
        return id_personagem_criado
    
    def exibir_inventario(self, id_personagem, vender):
        itens = self.personagem_repository.exibir_inventario(id_personagem)

        nome_itens = [item[2] for item in itens]
        i = 1

        validate = False

        os.system('clear')
        while(validate == False):
            print(f"\n-----------------------------------------------")
            print('-------------Itens do inventário----------------\n')

            for row in nome_itens:
                print(f"{i} - {row}")
                i += 1
            print(f"\n-----------------------------------------------\n")

            if vender == 'S':
                key_item_venda = input("Obs: Os itens não são vendidos pelo mesmo valor da compra!\nQual item você deseja vender? ")
                key_item_venda = int(key_item_venda)
                if key_item_venda > 0 and key_item_venda < i: 
                    key_item_venda = key_item_venda - 1
                    preco = self.npc_repository.preco_item(id_personagem, nome_itens, key_item_venda)

                    print("\nPreco de venda do item: ", preco,"\n")

                    confirmacao = input('Realmente deseja vender esse item? (S / N): ')

                    if confirmacao == 'S' or confirmacao == 's':
                        self.npc_repository.vender_item(id_personagem, nome_itens, key_item_venda)

                        self.personagem_repository.adiciona_moedas_personagem(id_personagem, preco)

                        print('Item vendido com sucesso!')
                        validate = True

                    elif confirmacao == 'N' or confirmacao == 'n':
                        print("Ok! Até uma próxima! :)")
                        validate = True

                    else:
                        os.system('clear')
                        print('Não foi possível efetuar a operação, digite um valor válido!')

                else:
                    os.system('clear')
                    print('Não foi possível efetuar a operação, digite um valor válido!')

            else:
                validate = True

            return 

    def descontar_moedas_personagem(self, id_personagem, quantidade):
        return self.personagem_repository.descontar_moedas_personagem(id_personagem, quantidade)
    
    def obter_itens_tipo_consumivel(self, id_personagem):
        items = self.personagem_repository.obter_itens_tipo_consumivel(id_personagem)
        return items
    
    def obter_itens_tipo_arma(self, id_personagem):
        items = self.personagem_repository.obter_itens_tipo_arma(id_personagem)
        return items

    def receber_dano(self, id_personagem, fator):
        return self.personagem_repository.receber_dano(id_personagem, fator)
    
    def obter_informacoes_personagem(self, id_personagem):
        return self.personagem_repository.obter_informacoes_personagem(id_personagem)
    
    def trocar_arma(self, id_personagem, arma):
        self.personagem_repository.trocar_arma(id_personagem, arma['nome_item'])

        GLOBAL_SETS['arma']['nome'] = arma['nome_item']
        GLOBAL_SETS['arma']['dano'] = arma['dano']

        print(f"\nAgora você está usando a arma {arma['nome_item']}\n")
