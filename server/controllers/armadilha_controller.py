from services.armadilha_service import ArmadilhaService
from config.config import GLOBAL_SETS
from random import choice, randint

class ArmadilhaController:

    def __init__(self):
        self.armadilha_service = ArmadilhaService()

    def ganhar_recompensa(self, id_personagem):
        nome_personagem = GLOBAL_SETS['transformado']
        recompensa = self.armadilha_service.ganhar_recompensa(id_personagem)
        print('='*10)
        print('Parabéns {}, você ganhou {} moedas por passar pela zona de armadilha com vida :-D'.format(nome_personagem,recompensa))
        print('='*10)

    def cair_armadilha(self, id_personagem : str):
        armadilha = choice(['buff_dano','critico','imunidade','vida_extra','debuff_arma_metade','debuff_dano','vida_atual'])

        if randint(0,1) :
            nome_personagem = GLOBAL_SETS['transformado']
            if armadilha == 'vida_atual':
                self.armadilha_service.debuff_vida_atual(id_personagem)
                print('{} você caiu na zona armadilha de armadilha e acabou por perder metade da sua vida.'.format(nome_personagem))
            elif armadilha == 'buff_dano':
                 self.armadilha_service.debuff_consumivel(armadilha)
                 print('{} você caiu na zona armadilha de armadilha e acabou por perder o seu poder de fogo, agora a sua arma ñ causará danos a nenhum oponente.'.format(nome_personagem))
            elif armadilha == 'critico':
                 self.armadilha_service.debuff_consumivel(armadilha)
                 print('{} você caiu na zona armadilha de armadilha e acabou por perder metade a sua Placa de Armadura.'.format(nome_personagem))
            elif armadilha == 'vida_extra':
                 self.armadilha_service.debuff_consumivel(armadilha)
                 print('{} você caiu na zona armadilha de armadilha e acabou por perder metade a sua vida extra.'.format(nome_personagem))     
            elif armadilha == 'debuff_dano':
                 self.armadilha_service.debuff_consumivel(armadilha)
                 print('{} você caiu na zona armadilha de armadilha e acabou por perder o seu poder de fogo, agora a sua arma ñ causará danos a nenhum oponente.'.format(nome_personagem))
            elif armadilha == 'debuff_arma_metade':
                 self.armadilha_service.debuff_consumivel(armadilha)
                 print('{} você caiu na zona armadilha de armadilha e acabou por perder o seu poder de fogo pela metade, agora a sua arma causará danos pela metade aos oponentes.'.format(nome_personagem))
            else:
                 self.armadilha_service.ganhar_recompensa(GLOBAL_SETS[' id_personagem'])
                 print('{} você caiu na zona armadilha de armadilha e saiu ileso dela. Parrabéns, você ganhou um item novo'.format(nome_personagem))



        

    