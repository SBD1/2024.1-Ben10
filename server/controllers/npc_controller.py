from services.sala_service import SalaService
from services.personagem_service import PersonagemService
from services.npc_service import NpcService
from utils.validation_utils import ValidationUtils
from tabulate import tabulate
from services.missao_service import MissaoService

class NpcError(Exception):
    pass

class NpcController:
    def __init__(self):
        self.sala_service = SalaService()
        self.personagem_service = PersonagemService()
        self.npc_service = NpcService()
        self.validation_utils = ValidationUtils()
        self.missao_service = MissaoService()


    def listar_estoque_npc(self, id_npc):
        estoque = self.npc_service.listar_estoque_npc(id_npc)
        
        headers = ["Opção", "Nome do Item", "Preço"]
        
        tabela = [[indice + 1, item['nome_item'], item['preco']] for indice, item in enumerate(estoque)]
        
        print(tabulate(tabela, headers=headers, tablefmt="grid"))

        return estoque
    
    def negociar_com_npc(self, id_npc, id_personagem):
        saldo_personagem = self.personagem_service.obter_saldo_personagem(id_personagem)
        print(f"\nSeu saldo atual é: {saldo_personagem}\n")
        estoque = self.listar_estoque_npc(id_npc)
        escolha = input("\nEscolha uma opção de item para comprar ou digite \"sair\" para cancelar a compra!\n")

        if escolha == "SAIR" or escolha == "sair":
            return
                
        if not self.validation_utils.validate_integer_in_range(escolha, 1, len(estoque)):
            raise NpcError("Opção Inválida")
        
        escolha = int(escolha)

        item_escolhido = estoque[escolha - 1]

        if int(item_escolhido['preco']) > int(saldo_personagem):
            print("Saldo insuficiente para comprar este item!")
            return
        
        self.npc_service.comprar_item(id_personagem, item_escolhido)

    def falar_sobre_missao(self, id_npc, id_personagem):
        missao = self.missao_service.obter_missao_por_npc(id_npc)[0]
        try:
            tem_missao = self.missao_service.verificar_registro_missao(id_personagem, missao['id_missao'])
            self.missao_service.pode_fazer_missao(id_personagem, missao['id_missao'])
            
            print("\nMissão:", missao['nome_missao'])
            print("Descrição:", missao['descricao'])
            print("Recompensa:", missao['recompensa_em_moedas'])

            if not tem_missao:
                resposta = input("\nDeseja aceitar a missão? \"S\" (SIM) ou \"N\" (NÃO)\n")
                while resposta != 'S' and resposta != "s" and resposta != "N" and resposta != "n":
                    print("Entrada inválida. Por favor, digite \"S\" (SIM) ou \"N\" (NÃO).")
                    resposta = input("\nDeseja aceitar a missão? \"S\" (SIM) ou \"N\" (NÃO)\n")

                if resposta == 's' or resposta == 'S':
                    self.missao_service.instanciar_registro_da_missao(id_personagem, missao['id_missao'])
                    print("\nMissão em progresso!")

                return
            
            self.missao_service.entregar_missao(id_personagem, missao)
        except:
            return

    def interagir_com_npc(self, id_personagem, id_npc):
        try:
            id_sala = self.personagem_service.obter_sala_personagem(id_personagem)
            npc = self.npc_service.npc_roles(id_npc, id_sala)[0]

            i = 1

            if not npc['dialogo_associado_venda'] and not npc['id_missao_associada']:
                print("Nenhuma interação disponível com o NPC")
                return
            else:
                print("Você deseja:")
            if npc['dialogo_associado_venda']:
                print(f"{i} - Negociar")
                i += 1
            if npc['id_missao_associada']:
                print(f"{i} - Ver Missão")

            opcao = input()
            if not self.validation_utils.validate_integer_in_range(opcao, 1, i):
                raise NpcError("Opção inválida!")
            
            opcao = int(opcao)

            if opcao == 1 and npc['dialogo_associado_venda']:
                self.negociar_com_npc(id_npc, id_personagem)
                return
            self.falar_sobre_missao(id_npc, id_personagem)

        except:
            return