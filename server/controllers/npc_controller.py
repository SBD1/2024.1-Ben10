from services.sala_service import SalaService
from services.personagem_service import PersonagemService
from services.npc_service import NpcService

class NpcError(Exception):
    pass

# Constante para definir que uma determinada variável não possui valor definido

class NpcController:
    def __init__(self):
        self.sala_service = SalaService()
        self.personagem_service = PersonagemService()
        self.npc_service = NpcService()
    
    def interagir_com_npc(self, id_personagem, id_npc):
        try:
            id_sala = self.personagem_service.obter_sala_personagem(id_personagem)
            npc = self.npc_service.npc_roles(id_npc, id_sala)[0]
            i = 1

            if not npc['dialogo_associado_venda'] and not npc['id_missao_associada']:
                print("Nenhuma interação disponível com o NPC")
            else:
                print("Você deseja:")
            if npc['dialogo_associado_venda']:
                print(f"{i} - Negociar")
                i += 1
            if npc['id_missao_associada']:
                print(f"{i} - Ver Missão")


        except:
            return