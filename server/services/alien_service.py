from repositories.alien_repository import alien_repository
from config.config import GLOBAL_SETS
import time
import threading

class AlienService:

    def __init__(self):
        self.alien_repository = alien_repository

    def exibir_aliens(self, id_personagem, trocar):
        dados = self.alien_repository.exibir_aliens(id_personagem)

        i = 1 
        validate = False
        aliens = []

        print(f"\n-------------------------------\n")
        for alien, vida in dados:
            aliens.append(alien)
            print(f"{i} - Alien: {alien} | Vida: {vida}\n")
            i += 1
        print(f"-------------------------------")

        while validate == False:
            if(trocar == 'S'):
            
                num_alien = input("Digite o número do alien que deseja escolher: ")
                
                if not num_alien.isdigit() or int(num_alien) < 1 or int(num_alien) >= i:
                    print("Digite um valor inválido!")
                else:
                    validate = True

                if validate == True:

                    num_alien = int(num_alien)

                    if self.alien_repository.trocar_alien(id_personagem, aliens[num_alien-1]):

                        print(f"\n{aliens[num_alien-1]} agora é seu alien atual!")

                    return None
                
            if trocar == "N":
                validate = True
                
    def exibir_alien_atual(self, id_personagem):
        dados = self.alien_repository.exibir_alien_atual(id_personagem)

        print(f"\n-------------------------------\n")
        print(f"{dados[0]} é o seu alien atual e possui {dados[1]} de saúde!")
        print(f"\n-------------------------------\n")

        return None
    
    def receber_dano_alien(self, id_personagem, fator, nome_alien):
        if not GLOBAL_SETS['alien']['vida_atual']:
            GLOBAL_SETS['transformado'] = None
            GLOBAL_SETS['alien']['vida_maxima'] = None
            GLOBAL_SETS['alien']['vida_atual'] = None
            GLOBAL_SETS['alien']['dano'] = None

        return self.alien_repository.receber_dano_alien(id_personagem, fator, nome_alien)
    
    def ativar_cura_gradativa(self, duration):
        while True:
            self.alien_repository.curar_alien_gradativamente(GLOBAL_SETS['id_personagem'])
            time.sleep(duration)

    def curar_alien_gradativamente(self):
        """Coloca para curar o alien gradativamente em uma thread"""

        thread = threading.Thread(target=self.ativar_cura_gradativa, args=(15,))
        thread.start()