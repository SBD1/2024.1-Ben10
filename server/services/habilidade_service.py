from repositories.habilidade_repository import HabilidadeRepository
from repositories.item_repository import ItemRepository
from config.config import GLOBAL_SETS


item_repository = ItemRepository()

class HabilidadeService:
    def __init__(self):
        self.habilidade_repository = HabilidadeRepository()

    def obter_habilidades_especie(self, nome_especie):
        return self.habilidade_repository.obter_habilidades_especie(nome_especie)
    
    def habilidade_cura(self, habilidade):
        item_repository.curar_vida_alien(GLOBAL_SETS['id_personagem'], habilidade['nome_especie'], habilidade['quantidade'])
        if GLOBAL_SETS['alien']['vida_atual'] + habilidade['quantidade'] > GLOBAL_SETS['alien']['vida_maxima']:
            GLOBAL_SETS['alien']['vida_atual'] = GLOBAL_SETS['alien']['vida_maxima']
        else:
            GLOBAL_SETS['alien']['vida_atual'] = GLOBAL_SETS['alien']['vida_atual'] + habilidade['quantidade']
        print(f"\nVocê curou {habilidade['quantidade']} de vida!")
    
    def usar_habilidade(self, habilidade):
        if habilidade['efeito'] == 'cura':
            self.habilidade_cura(habilidade)
            return 0
        dano = habilidade['quantidade']
        return dano