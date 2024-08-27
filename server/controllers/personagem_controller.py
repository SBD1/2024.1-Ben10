from services.personagem_service import PersonagemService

class PersonagemController:

    def __init__(self):
        self.personagem_service = PersonagemService()

    def exibirPersonagem(self, id_personagem, infos):
        return self.personagem_service.exibir_personagem(id_personagem, infos)
    
    def criar_personagem(self, personagem, alien):
        return self.personagem_service.criar_personagem(personagem, alien)
        
