from services.personagem_service import PersonagemService
from tabulate import tabulate
from utils.validation_utils import ValidationUtils
from services.item_service import ItemService

class PersonagemController:

    def __init__(self):
        self.personagem_service = PersonagemService()
        self.validation_utils = ValidationUtils()
        self.item_service = ItemService()

    def exibir_personagem(self, id_personagem, infos):
        return self.personagem_service.exibir_personagem(id_personagem, infos)
    
    def criar_personagem(self, personagem, alien):
        return self.personagem_service.criar_personagem(personagem, alien)
    
    def exibir_inventario(self, id_personagem):
        return self.personagem_service.exibir_inventario(id_personagem)
    
    def listar_itens(self, items):
        headers = ["Opção", "Nome do Item", "Buff", "Fator"]
        
        tabela = [[indice + 1, item['nome_item'], item['status'], item['valor_consumivel']] for indice, item in enumerate(items)]
        
        print(tabulate(tabela, headers=headers, tablefmt="grid"))

    def usar_consumivel(self, id_personagem):
        items = self.personagem_service.obter_itens_tipo_consumivel(id_personagem)
        self.listar_itens(items)

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
        