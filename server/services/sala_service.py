from repositories.sala_repository import SalaRepository

class SalaService:
    def __init__(self):
        self.sala_repository = SalaRepository()

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