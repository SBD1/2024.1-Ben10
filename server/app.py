from controllers.sala_controller import SalaController

def main():
    sala_controller = SalaController()

    GLOBAL_SETS = {
        'id_personagem': 2
    }

    lista_comandos = {
        'sala trocar': {
            'argumento': 'id_sala',
            'descrição': 'comando para trocar de sala',
            'executar': lambda id_sala: sala_controller.trocar_jogador_de_sala(GLOBAL_SETS['id_personagem'], id_sala)
        },
        'mapa atual': {
            'descrição': 'comando para ver o mapa da região atual',
            'executar': lambda _: sala_controller.desenhar_mapa_regiao('regiao_atual')  # Placeholder
        },
        'mapa regiao': {
            'argumento': 'nome_regiao',
            'descrição': 'comando para ver o mapa de uma determinada região',
            'executar': lambda nome_regiao: sala_controller.desenhar_mapa_regiao(nome_regiao)
        }
    }

    def listar_comandos():
        print("\nComandos disponíveis:")
        for comando, detalhes in lista_comandos.items():
            print(f"{comando} - {detalhes['descrição']}")

    def executar_comando(comando):
        partes_comando = comando.split(' ', 2)
        comando_base = ' '.join(partes_comando[:2])
        argumento = partes_comando[2] if len(partes_comando) > 2 else None  # Pega o argumento, se houver

        if comando_base in lista_comandos:
            detalhes_comando = lista_comandos[comando_base]
            if 'argumento' in detalhes_comando and argumento:
                detalhes_comando['executar'](argumento)
            elif 'argumento' not in detalhes_comando:
                detalhes_comando['executar'](None)
            else:
                print("Erro: Comando requer um argumento.")
        else:
            print("Comando inválido. Tente novamente.")

    print("Bem-vindo ao jogo!------")
    listar_comandos()

    while True:
        comando = input("\nDigite um comando: ")
        executar_comando(comando)

if __name__ == "__main__":
    main()
