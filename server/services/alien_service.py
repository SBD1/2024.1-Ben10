from repositories.alien_repository import AlienRepository

class AlienService:

    def __init__(self):
        self.alien_repository = AlienRepository()

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