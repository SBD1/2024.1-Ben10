from services.personagem_service import PersonagemService

class PersonagemController:

    def __init__(self):
        self.personagem_service = PersonagemService()

    def exibirPersonagem(self, id_personagem):
        return self.personagem_service.exibir_personagem(id_personagem)
        
