from repositories.item_repository import item_repository
from repositories.missao_repository import missao_repository
from config.config import GLOBAL_SETS
import threading
import time

class ItemError(Exception):
    pass

class ItemService:
    def __init__(self):
        self.item_repository = item_repository
        self.missao_repository = missao_repository
        self.BUFF_DURATION = 90 # 1 minuto e 30 segundos

    def ativar_buff(self, buff_name, fator: int):
        """Ativa o buff e inicia uma thread para desativá-lo após o tempo especificado."""
        if GLOBAL_SETS['consumivel'][buff_name]:
            print("\nBuff já está ativo!")
            return
        
        GLOBAL_SETS['consumivel'][buff_name] = fator
        print(f"\n{buff_name} ativado!")

        thread = threading.Thread(target=self.desativar_buff, args=(buff_name, self.BUFF_DURATION))
        thread.start()

    def desativar_buff(self, buff_name, duration):
        """Desativa o buff após o tempo de duração especificado."""
        time.sleep(duration)
        GLOBAL_SETS['consumivel'][buff_name] = None
        print(f"\n\n{buff_name} expirou!\n")

    def consumivel_cura(self, id_personagem, item):
        if GLOBAL_SETS['transformado']:
            self.item_repository.curar_vida_alien(id_personagem, GLOBAL_SETS['transformado'], item['valor_consumivel'])
            if GLOBAL_SETS['alien']['vida_atual'] + item['valor_consumivel'] > GLOBAL_SETS['alien']['vida_maxima']:
                GLOBAL_SETS['alien']['vida_atual'] = GLOBAL_SETS['alien']['vida_maxima']
            else:
                GLOBAL_SETS['alien']['vida_atual'] = GLOBAL_SETS['alien']['vida_atual'] + item['valor_consumivel']
        else:
            self.item_repository.curar_vida_personagem(id_personagem, item['valor_consumivel'])
            if GLOBAL_SETS['vida_atual'] + item['valor_consumivel'] > GLOBAL_SETS['vida_maxima']:
                GLOBAL_SETS['vida_atual'] = GLOBAL_SETS['vida_maxima']            
            else:
                GLOBAL_SETS['vida_atual'] = GLOBAL_SETS['vida_atual'] + item['valor_consumivel']
            
        print(f"\nVocê curou {item['valor_consumivel']} de vida!\n")
        return

    def usar_consumivel(self, id_personagem, item):
        self.missao_repository.tirar_item_inventario(id_personagem, item['id_item'])

        if item['status'] == 'cura':
            self.consumivel_cura(id_personagem, item)
        else:
            self.ativar_buff(item['status'], item['valor_consumivel'])
        return