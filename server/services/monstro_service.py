from repositories.monstro_repository import MonstroRepository
from repositories.personagem_repository import PersonagemRepository
from repositories.sala_repository import SalaRepository
from services.sala_service import SalaService
import random
from instance.monstro_instance import MonstroInstance
from utils.validation_utils import ValidationUtils

class MonstroService:
    def __init__(self):
        self.monstro_repository = MonstroRepository()
        self.sala_service = SalaService()
        self.validation_utils = ValidationUtils()

    def obter_monstros_por_dificuldade_da_sala(self, id_sala, quantidade_monstros):
        """
        Recebe uma lista de monstros filtrados pela dificuldade da sala e retorna uma lista
        com N monstros escolhidos aleatoriamente
        """
        monstros = self.monstro_repository.obter_monstros_por_dificuldade_sala(id_sala)
        monstros_escolhidos = []
        for i in range(0, quantidade_monstros):
            index = random.randint(0, len(monstros) - 1)
            monstros_escolhidos.append(monstros[index]['nome'])
        
        return monstros_escolhidos
    
    def vez_jogador(self, id_personagem, instancias):
        j = 0

        for i in range(0, len(instancias)):
            if i == 1:
                continue

            print(f"{j} - Monstro: {instancias[i].nome_especie} [Saúde Atual: {instancias[i].saude_atual}]")
            j = j+ 1

        while True:
            opcao = input("\nEscolha um monstro para atacar!\n")
            
            if not self.validation_utils.validate_integer_in_range(opcao, 0, j - 1):
                print("Opção inválida, tente novamente.")
                continue 
            
            opcao = int(opcao)
            break
    
        if opcao != 0:
            opcao = 2

        instancias[opcao].receber_dano(100)
    
    def entrar_em_combate(self, id_sala, id_personagem):
        turno = 1

        info_monstros = self.monstro_repository.informacoes_monstro(id_sala, id_personagem)
        instancias = []
        for monstro in info_monstros:
            instancias.append(MonstroInstance(monstro))
            if len(instancias) == 1:
                instancias.append('jogador') ## sim, isso é gambiarra

        num_instancias = len(instancias)

        while instancias[0].saude_atual or instancias[2].saude_atual:
            if turno%num_instancias == 1:
                self.vez_jogador(id_personagem, instancias)
            else:
                instancias[turno%3].atacar()

            turno = turno + 1
        
        print("todos os monstros estão mortos!")

    def instanciar_monstro(self, id_sala, id_personagem):
        if self.sala_service.verificar_zona_guerra(id_sala):
            existe_instancia = len(self.sala_service.verificar_instancia_zona_guerra(id_personagem, id_sala))
            if not existe_instancia:
                monstros = self.obter_monstros_por_dificuldade_da_sala(id_sala, 2)
                self.monstro_repository.instanciar_monstro(id_sala, id_personagem, monstros)
        
            print("\nOhh, não! Monstros apareceram!")
            
            while True:
                opcao = input('Entrar em combate? S (sim) ou N (não): ').strip().upper()

                if opcao == 'N':
                    print("Você optou por não entrar em combate.")
                    return
                elif opcao == 'S':
                    print("Você optou por entrar em combate!")
                    break 
                else:
                    print("Opção inválida. Por favor, digite 'S' para sim ou 'N' para não.")
            
            self.entrar_em_combate(id_sala, id_personagem)