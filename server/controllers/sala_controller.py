from services.sala_service import SalaService

class SalaController:
    def __init__(self):
        self.sala_service = SalaService()

    def desenhar_mapa_regiao(self, nome_regiao):
        salas = self.sala_service.obter_salas_por_regiao(nome_regiao)

        if not salas:
            print("Nenhuma sala encontrada.")
            return

        largura_quadrado = 10
        quantidade_salas = len(salas)
        colunas = 3

        print()
        # Divide as salas em grupos de 3
        for i in range(0, quantidade_salas, colunas):
            salas_parte = salas[i:i + colunas]

            # Desenhar a linha superior de cada grupo
            if (i == 0):
                for sala in salas_parte:
                    print(f"+{'-' * (largura_quadrado - 2)}+", end=' ')
            print()

            # Desenhar o conteúdo de cada grupo (ID da sala)
            for sala in salas_parte:
                id_sala = sala[0]
                print(f"| {id_sala:^6} |", end=' ')
            print()

            # Desenhar a linha inferior de cada grupo
            for sala in salas_parte:
                print(f"+{'-' * (largura_quadrado - 2)}+", end=' ')

        print(f"\n\nRegião: {nome_regiao}")
        