from services.armadilha_service import ArmadilhaService
from config.config import GLOBAL_SETS

class ArmadilhaController:

    def __init__(self):
        self.armadilha_service = ArmadilhaService()

    def ganhar_recompensa(self, id_personagem):
        nome_personagem = GLOBAL_SETS['transformado']
        recompensa = self.armadilha_service.ganhar_recompensa(id_personagem)
        print('='*10)
        print('Parabéns {}, você ganhou {} moedas por passar pela zona de armadilha com vida :-D'.format(nome_personagem,recompensa))
        print('='*10)

        

    