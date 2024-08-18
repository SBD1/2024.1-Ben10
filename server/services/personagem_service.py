from repositories.personagem_repository import PersonagemRepository

class PersonagemService:
    def __init__(self):
        self.personagem_repository = PersonagemRepository()

    def obter_informacoes_personagem(self, id_personagem):
        """
        Retorna informações de um personagem
        :param id_personagem: ID do personagem a ser filtrado
        :return: Lista toda as colunas referentes ao personagem
        """
        return self.personagem_repository.obter_informacoes_personagem(id_personagem)
    
    def atualizar_sala_personagem(self, id_personagem, id_sala):
        return self.personagem_repository.atualizar_sala_personagem(id_personagem, id_sala)