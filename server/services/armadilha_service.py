from repositories.armadilha_repository import ArmadilhaRepository
from random import choice

class ArmadilhaService:

    def __init__(self):
        self.armadilha_repository = ArmadilhaRepository()

    def ganhar_recompensa(self, id_personagem) -> str:
        """
            Ganha recompensa em moedas aleatoriamente
        """
        return choice(self.armadilha_repository.obter_lista_recompensas())

       