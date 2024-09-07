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

    def verificar_missao(self, id_regiao):
        """
        Obtém os NPCs presentes na região, com suas respectivas salas,
        e atribui 0 se o valor da missão for nulo, caso contrário, 1.
        """
        npcs = self.sala_repository.verificar_npc_regiao(id_regiao)
        
        if npcs is None:
            return None
        
        for npc in npcs:
            if npc["idMissaoAssociada"] is None:
                npc["idMissaoAssociada"] = 0  # Atribui 0 se for nulo
            else:
                npc["idMissaoAssociada"] = 1  # Atribui 1 caso não seja nulo
        
        return npcs
        
        return None 