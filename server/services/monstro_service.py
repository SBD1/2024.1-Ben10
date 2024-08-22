from repositories.monstro_repository import MonstroRepository
from repositories.personagem_repository import PersonagemRepository
from repositories.sala_repository import SalaRepository
from services.sala_service import SalaService
import random

class MonstroService:
    def __init__(self):
        self.monstro_repository = MonstroRepository()
        self.sala_service = SalaService()

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

    def instanciar_monstro(self, id_sala, id_personagem):
        if self.sala_service.verificar_zona_guerra(id_sala):
            existe_instancia = len(self.sala_service.verificar_instancia_zona_guerra(id_personagem, id_sala))
            if not existe_instancia:
                monstros = self.obter_monstros_por_dificuldade_da_sala(id_sala, 2)
                self.monstro_repository.instanciar_monstro(id_sala, id_personagem, monstros)
                print("\nOhh, não! Monstros apareceram!")