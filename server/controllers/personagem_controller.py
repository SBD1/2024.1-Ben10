from services.personagem_service import PersonagemService

class PersonagemController:

    def __init__(self):
        self.personagem_service = PersonagemService()

    def exibir_personagem(self, id_personagem, infos):
        return self.personagem_service.exibir_personagem(id_personagem, infos)
    
    def criar_personagem(self, personagem, alien):
        return self.personagem_service.criar_personagem(personagem, alien)
    
    def exibir_inventario(self, id_personagem):
        return self.personagem_service.exibir_inventario(id_personagem)
    
    def listar_inventario(self, id_personagem):
        return self.personagem_service.exibir_inventario(id_personagem)
