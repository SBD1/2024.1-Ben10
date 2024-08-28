from repositories.personagem_repository import PersonagemRepository
from services.sala_service import SalaService
from services.npc_service import NpcService
from services.monstro_service import MonstroService


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
        