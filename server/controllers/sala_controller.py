from services.sala_service import SalaService
from services.personagem_service import PersonagemService

# Constante para definir que uma determinada variável não possui valor definido
UNSET = -1

class SalaController:
    def __init__(self):
        self.sala_service = SalaService()
        self.id_regiao_selecionada = UNSET
        self.personagem_service = PersonagemService()
    
    def set_regiao(self, id_regiao : int) -> None:
        self.id_regiao_selecionada = id_regiao
     
    def get_regiao(self) -> int:
        return self.id_regiao_selecionada

    # Listar a região
    def listar(self):
        print("Eis as regiões existentes:")
        lista_regioes = self.sala_service.obter_todas_regioes()

        if isinstance(lista_regioes,list):
            for counter in range(len(lista_regioes)):
                nome_regiao = lista_regioes[counter].get('nome_regiao')
                descricao = lista_regioes[counter].get('descricao')

                print(f"ID: {counter + 1}\nNome: {nome_regiao}\nDescrição: {descricao}")
                print("=")
       
    def desenhar_mapa_regiao_atual(self) -> None:
        if self.get_regiao() == UNSET:
            print("Não existe nenhum mapa selecionado. Escreva \"mapa listar\" para listar as regiões.")
        else:
            self.desenhar_mapa_regiao(str(self.get_regiao()))

    # apresentar todas as regiões
    def desenhar_mapa_regiao(self, id_regiao : str):
        
        if self.get_regiao() == UNSET or self.get_regiao() != int(id_regiao):
             self.set_regiao(int(id_regiao))

        lista_regioes = self.sala_service.obter_todas_regioes()
        size = len(lista_regioes)
        indice = int(id_regiao)
        if indice > size:
            print("ID inexistente.")
        else:
            nome_regiao= lista_regioes[indice - 1].get('nome_regiao')
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
                    id_sala = sala['id_sala']
                    print(f"| {id_sala:^6} |", end=' ')
                print()

                # Desenhar a linha inferior de cada grupo
                for sala in salas_parte:
                    print(f"+{'-' * (largura_quadrado - 2)}+", end=' ')

            print(f"\n\nRegião: {nome_regiao}")

    def trocar_jogador_de_sala(self, id_personagem, id_sala):
        return self.personagem_service.trocar_jogador_de_sala(id_personagem, id_sala)
