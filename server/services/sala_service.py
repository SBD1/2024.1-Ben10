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