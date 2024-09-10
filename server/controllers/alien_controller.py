from services.alien_service import AlienService
from controllers.personagem_controller import PersonagemController
personagem_controller = PersonagemController()

class AlienController:

    def __init__(self):
        self.alien_service = AlienService()

    
    def exibir_aliens(self, id_personagem, trocar):
        self.alien_service.exibir_aliens(id_personagem, trocar)
        personagem_controller.setar_global_set()
        return 
    
    def exibir_alien_atual(self, id_personagem):
        self.alien_service.exibir_alien_atual(id_personagem)
        return 