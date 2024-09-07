from services.sala_service import SalaService
from services.personagem_service import PersonagemService
from services.npc_service import NpcService
from utils.validation_utils import ValidationUtils
from tabulate import tabulate

# Constante para definir que uma determinada variável não possui valor definido
UNSET = -1

class SalaController:
    def __init__(self):
        self.sala_service = SalaService()
        self.id_regiao_selecionada = UNSET
        self.personagem_service = PersonagemService()
        self.npc_service = NpcService()
        self.validation_utils = ValidationUtils()
    
    def set_regiao(self, id_regiao : int) -> None:
        self.id_regiao_selecionada = id_regiao
     
    def get_regiao(self) -> int:
        return self.id_regiao_selecionada

    # Listar a região
    def listar(self):
        print("Eis as regiões existentes:")
        lista_regioes = self.sala_service.obter_todas_regioes()

        if isinstance(lista_regioes,list):
            for counter in range(len(lista_regioes)):
                nome_regiao = lista_regioes[counter].get('nome_regiao')
                descricao = lista_regioes[counter].get('descricao')

                print(f"ID: {counter + 1}\nNome: {nome_regiao}\nDescrição: {descricao}")
                print("=")
       
    def desenhar_mapa_regiao_atual(self) -> None:
        if self.get_regiao() == UNSET:
            print("Não existe nenhum mapa selecionado. Escreva \"mapa listar\" para listar as regiões.")
        else:
            self.desenhar_mapa_regiao(str(self.get_regiao()))

    # apresentar todas as regiões
    def desenhar_mapa_regiao(self, id_regiao : str):
        
        if self.get_regiao() == UNSET or self.get_regiao() != int(id_regiao):
             self.set_regiao(int(id_regiao))

        lista_regioes = self.sala_service.obter_todas_regioes()
        size = len(lista_regioes)
        indice = int(id_regiao)
        if indice > size:
            print("ID inexistente.")
        else:
            nome_regiao= lista_regioes[indice - 1].get('nome_regiao')
            salas = self.sala_service.obter_salas_por_regiao(nome_regiao)

            if not salas:
                print("Nenhuma sala encontrada.")
                return

            # Extrair apenas os valores dos IDs
            id_salas = [sala['id_sala'] for sala in salas]

            # Extrair apenas os valores dos IDs e modificar a célula com o id_sala = 24
            id_salas = [f"{id_sala}\n(Você está aqui)" if id_sala == 24 else str(id_sala) for id_sala in id_salas]

            # Garantir que todas as células tenham duas linhas (mesma altura)
            id_salas = [f"{id_sala}\n" if '\n' not in id_sala else id_sala for id_sala in id_salas]

            # Garantir que todas as células estejam alinhadas horizontalmente (20 caracteres)
            id_salas = [id_sala.center(20) for id_sala in id_salas]

            # Dividir a lista de IDs em grupos de 3
            tabela = [id_salas[i:i + 3] for i in range(0, len(id_salas), 3)]

            # Imprimir a tabela formatada com bordas uniformes
            print(tabulate(tabela, tablefmt="grid", stralign='center'))

            print(f"\n\nRegião: {nome_regiao}")

    def trocar_jogador_de_sala(self, id_personagem, id_sala):
        if not self.validation_utils.validate_integer(id_sala):
            print("Digite um número!")
            return

        id_sala = int(id_sala)
        return self.personagem_service.trocar_jogador_de_sala(id_personagem, id_sala)
    
    def mostrar_npcs_na_sala(self, id_personagem):
        id_sala = self.personagem_service.obter_sala_personagem(id_personagem)
        npcs = self.npc_service.obter_npcs_sala(id_sala)

        if not len(npcs):
            print("Nenhum NPC na sala!")

        for npc in npcs:
            output = f"NPC: {npc['id_npc']}"
            if npc['dialogo_associado_venda']:
                output += " [VENDEDOR]"
            if npc['id_missao_associada']:
                output += " [MISSÃO]"
            print(output)