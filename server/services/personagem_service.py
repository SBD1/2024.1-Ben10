from repositories.personagem_repository import PersonagemRepository
from services.sala_service import SalaService
from repositories.npc_repository import verificar_npc_na_sala

class PersonagemService:
    def __init__(self):
        self.personagem_repository = PersonagemRepository()
        self.sala_service = SalaService()
    
    def atualizar_sala_personagem(self, id_personagem, id_sala):
        return self.personagem_repository.atualizar_sala_personagem(id_personagem, id_sala)
    
    def trocar_jogador_de_sala(self, id_personagem, id_sala):
        permissao = self.sala_service.verificar_permissao_sala(id_personagem, id_sala)
        if permissao[0]['count']:
            self.atualizar_sala_personagem(id_personagem, id_sala)
            print(f'Você foi para a sala {id_sala}')
            npc = verificar_npc_na_sala(id_sala) # verifica se existe npc na sala
            if npc:
                print(f"NPC encontrado na sala {id_sala}: {npc}")
            else:
                print(f"Não há NPC na sala com ID {id_sala}.")
        else:
            print('troca de sala não permitida')