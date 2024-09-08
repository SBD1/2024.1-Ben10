from repositories.armadilha_repository import ArmadilhaRepository
from random import choice

class ArmadilhaService:

    def __init__(self):
        self.armadilha_repository = ArmadilhaRepository()

    def ganhar_recompensa(self, id_personagem) -> str | bool:
        """
            Ganha recompensa em moedas aleatoriamente
        """
        moedas = choice(self.armadilha_repository.obter_lista_recompensas())
        return moedas if self.armadilha_repository.ganhar_moeda(id_personagem=id_personagem, moedas=moedas) else False

       