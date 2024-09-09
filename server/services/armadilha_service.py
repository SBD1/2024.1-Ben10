from repositories.armadilha_repository import ArmadilhaRepository
from repositories.personagem_repository import PersonagemRepository
from random import choice
from config.config import GLOBAL_SETS
from utils.transform import get_keys_from_dict

class ArmadilhaService:

    def __init__(self):
        self.armadilha_repository = ArmadilhaRepository()
        self.personagem_repository = PersonagemRepository()
    
    def debuff_vida_atual(self, id_personagem : str):
        vida_atual = int(GLOBAL_SETS['vida_atual'])
        nova_vida = vida_atual // 2
        GLOBAL_SETS['vida_atual'] = str(nova_vida)

        if nova_vida <= 0 :
           self.personagem_repository.zerar_vida(id_personagem)
        else:
             self.personagem_repository.reduzir_vida(id_personagem=id_personagem, saude=nova_vida)
    
    def debuff_consumivel(self, key : str):
        GLOBAL_SETS[str(key)] = None
    
    def desativar_debuff_consumivel(self, key : str, value : str):
        GLOBAL_SETS[str(key)] = value
    
    def debuff_arma(self, key : str):
        GLOBAL_SETS[str(key)] = True
    
    def desativar_debuff_arma(self, key : str):
        GLOBAL_SETS[str(key)] = False

    def ganhar_recompensa(self, id_personagem) -> str | bool:
        """
            Ganha recompensa em moedas aleatoriamente
        """
        moedas = choice(self.armadilha_repository.obter_lista_recompensas())
        return moedas if self.armadilha_repository.ganhar_moeda(id_personagem=id_personagem, moedas=moedas) else False
    
    def cair_armadilha(self, id_personagem):
        armadilha = choice(get_keys_from_dict(GLOBAL_SETS))
        print(get_keys_from_dict(GLOBAL_SETS))
        return armadilha