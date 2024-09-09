from repositories.sala_repository import SalaRepository
from utils.database_helpers import fetch_as_dict
from repositories.regiao_repository import RegiaoRepository

class SalaService:
    def __init__(self):
        self.sala_repository = SalaRepository()
        self.regiao_repository = RegiaoRepository()

    def obter_salas_por_tipo(self, tipo_sala):
        """
        Retorna todas as salas de um determinado tipo.
        :param tipo_sala: Tipo da sala a ser filtrada.
        :return: Lista de salas do tipo especificado.
        """
        return self.sala_repository.obter_salas_por_tipo(tipo_sala)

    def obter_salas_por_regiao(self, nome_regiao):
        """
        Retorna todas as salas de uma determinada região.
        :param nome_regiao: Tipo de região a ser filtrada.
        :return: Lista de salas da região especificada.
        """
        return self.sala_repository.obter_salas_por_regiao(nome_regiao)
    
    def verificar_permissao_sala(self, id_personagem, id_sala):
        """
        Retorna se o jogador pode entrar em uma sala específica.
        :return: Retorna 1 se o jogador puder entrar na sala, caso contrário retorna 0
        """
        return self.sala_repository.verificar_permissao_sala(id_personagem, id_sala)
    
    def verificar_zona_armadilha(self, id_sala):
        """
        Retorna se a sala que o jogador está entrando é zona de armadilha.
        """
        return self.sala_repository.verificar_zona_armadilha(id_sala)[0]['count']

    def verificar_zona_guerra(self, id_sala):
        """
        Retorna se a sala que o jogador está entrando é zona de guerra.
        """
        return self.sala_repository.verificar_zona_guerra(id_sala)[0]['count']

    def verificar_instancia_zona_guerra(self, id_personagem, id_zona_guerra):
        """
        Retorna a tupla do personagem em uma zona de guerra específica
        """
        return self.sala_repository.verificar_instancia_zona_guerra(id_personagem, id_zona_guerra)
    
    def obter_todas_regioes(self):
        """
        Retorna todas as salas de uma determinada região
        """
        return self.regiao_repository.obter_todas_regioes()
        
    def obter_regiao_por_nome(self, indice_regiao : int) -> dict:
        """
        Retorna as informações de uma determinada região
        """
        lista_regiao = self.obter_todas_regioes()
        try:
            return lista_regiao[indice_regiao -1]
        except IndexError:
            print("Não existe esta região.")
        
        return None 