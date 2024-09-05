from services.alien_service import AlienService

class AlienController:

    def __init__(self):
        self.alien_service = AlienService()

    
    def exibir_aliens(self, id_personagem, trocar):
        self.alien_service.exibir_aliens(id_personagem, trocar)

        return 
    
    def exibir_alien_atual(self, id_personagem):
        self.alien_service.exibir_alien_atual(id_personagem)

        return 