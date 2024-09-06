from repositories.monstro_repository import MonstroRepository
from repositories.personagem_repository import PersonagemRepository
from repositories.sala_repository import SalaRepository
from services.sala_service import SalaService
from services.habilidade_service import HabilidadeService
import random
from instance.monstro_instance import MonstroInstance
from utils.validation_utils import ValidationUtils
from random import randint
import math
from config.config import GLOBAL_SETS
from tabulate import tabulate

class MonstroService:
    def __init__(self):
        self.monstro_repository = MonstroRepository()
        self.sala_service = SalaService()
        self.validation_utils = ValidationUtils()
        self.habilidade_service = HabilidadeService()

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
    
    def calcular_dano(self, dano_base):
        if dano_base == 0:
            return 0

        dano_final = dano_base

        if GLOBAL_SETS['consumivel']['buff_dano']:
            dano_final = dano_final + GLOBAL_SETS['consumivel']['buff_dano']
        
        if GLOBAL_SETS['consumivel']['critico']:
            critico = (GLOBAL_SETS['consumivel']['critico'] / 100) + 1
            acertou_critico = randint(0, 1)
            if acertou_critico:
                dano_final = dano_final * critico

        return math.ceil(dano_final)
    
    def escolher_habilidade(self):
        habilidades = self.habilidade_service.obter_habilidades_especie(GLOBAL_SETS['transformado'])

        headers = ["Opção", "Nome da Habilidade", "Quantidade", "Efeito"]

        tabela = [[j, habilidade['nome_habilidade'], habilidade['quantidade'], habilidade['efeito']] 
                for j, habilidade in enumerate(habilidades)]

        print(tabulate(tabela, headers=headers, tablefmt="grid"))

            
        while True:
            opcao = input("\nEscolha uma habilidade para usar\n")
            
            if not self.validation_utils.validate_integer_in_range(opcao, 0, len(habilidades) - 1):
                print("Opção inválida, tente novamente.")
                continue 
            
            opcao = int(opcao)
            break

        dano = self.habilidade_service.usar_habilidade(habilidades[opcao])
        return dano

    def vez_jogador(self, id_personagem, instancias):
        j = 0

        for i in range(0, len(instancias)):
            if i == 1 or i == 3:
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

        dano_habilidade = self.escolher_habilidade()

        dano = self.calcular_dano(dano_habilidade) # falta somar o dano da arma que o personagem ta usando, além dele poder escolher a habilidade do alien ou ataque básico
        print(f"\nVocê deu aplicou {dano} de dano!\n")

        instancias[opcao].receber_dano(dano, instancias, opcao)
    
    def entrar_em_combate(self, id_sala, id_personagem):
        turno = 1

        info_monstros = self.monstro_repository.informacoes_monstro(id_sala, id_personagem)
        instancias = []
        for monstro in info_monstros:
            instancias.append(MonstroInstance(monstro))
            instancias.append('jogador') ## sim, isso é gambiarra


        while len(instancias):
            if turno%len(instancias) == 1 or turno%len(instancias) == 3:
                self.vez_jogador(id_personagem, instancias)
            else:
                instancias[turno%len(instancias)].atacar()

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