from repositories.item_repository import ItemRepository
from config.config import GLOBAL_SETS
import threading
import time

class ItemError(Exception):
    pass

class ItemService:
    def __init__(self):
        self.item_repository = ItemRepository()
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
        print(f"\n{buff_name} expirou!")

    def usar_consumivel(self):
        return