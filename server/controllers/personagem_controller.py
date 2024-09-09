from services.personagem_service import PersonagemService
from tabulate import tabulate
from utils.validation_utils import ValidationUtils
from services.item_service import ItemService
from config.config import GLOBAL_SETS

class PersonagemController:

    def __init__(self):
        self.personagem_service = PersonagemService()
        self.validation_utils = ValidationUtils()
        self.item_service = ItemService()

    def exibir_personagem(self, id_personagem, infos):
        return self.personagem_service.exibir_personagem(id_personagem, infos)
    
    def exibir_missoes_e_intro(self):
        return self.personagem_service.exibir_missoes_e_intro()
    
    def criar_personagem(self, personagem, alien):
        return self.personagem_service.criar_personagem(personagem, alien)
    
    def exibir_inventario(self, id_personagem):
        return self.personagem_service.exibir_inventario(id_personagem)
    
    def listar_itens_consumivel(self, items):
        headers = ["Opção", "Nome do Item", "Buff", "Fator"]
        
        tabela = [[indice + 1, item['nome_item'], item['status'], item['valor_consumivel']] for indice, item in enumerate(items)]
        
        print(tabulate(tabela, headers=headers, tablefmt="grid"))

    def usar_consumivel(self, id_personagem):
        items = self.personagem_service.obter_itens_tipo_consumivel(id_personagem)
        self.listar_itens_consumivel(items)

        while True:
            opcao = input('\nEscolha uma opção para usar (ou digite "sair" para cancelar): ')

            if opcao.lower() == 'sair':
                print("Saindo da seleção de itens...")
                return

            if self.validation_utils.validate_integer_in_range(opcao, 1, len(items)):
                opcao = int(opcao)
                break  
            else:
                print("Este item não está nas opções. Tente novamente ou digite 'sair'.")

        item = items[opcao - 1]

        self.item_service.usar_consumivel(id_personagem, item)

        return 
        
    def listar_itens_tipo_arma(self, items):
        headers = ["Opção", "Nome do Item", "Dano"]
        
        tabela = [[indice + 1, item['nome_item'], item['dano']] for indice, item in enumerate(items)]
        
        print(tabulate(tabela, headers=headers, tablefmt="grid"))

    def trocar_arma(self, id_personagem):
        items = self.personagem_service.obter_itens_tipo_arma(id_personagem)
        self.listar_itens_tipo_arma(items)

        while True:
            opcao = input('\nEscolha uma opção para usar (ou digite "sair" para cancelar): ')

            if opcao.lower() == 'sair':
                print("Saindo da seleção de itens...")
                return

            if self.validation_utils.validate_integer_in_range(opcao, 1, len(items)):
                opcao = int(opcao)
                break  
            else:
                print("Este item não está nas opções. Tente novamente ou digite 'sair'.")

        item = items[opcao - 1]

        self.personagem_service.trocar_arma(id_personagem, item)

        return 

    def setar_global_set(self, id_personagem):
        personagem = self.personagem_service.obter_informacoes_personagem(id_personagem)[0]

        GLOBAL_SETS['transformado'] = personagem['nome_alien']
        GLOBAL_SETS['vida_maxima'] = personagem['nivel'] * 100
        GLOBAL_SETS['vida_atual'] = personagem['saude']
        GLOBAL_SETS['alien']['vida_maxima'] = personagem['saude_especie'] * personagem['nivel']
        GLOBAL_SETS['alien']['vida_atual'] = personagem['saude_alien']
        GLOBAL_SETS['alien']['dano'] = personagem['dano_alien']
        GLOBAL_SETS['arma']['nome'] = personagem['arma']
        GLOBAL_SETS['arma']['dano'] = personagem['dano_arma']