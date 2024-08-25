from controllers.sala_controller import SalaController

def main():
    sala_controller = SalaController()

    GLOBAL_SETS = {
        'id_personagem': 2
    }


    lista_comandos = {
        'sala': {
            'trocar': {
                'argumento': 'id_sala',
                'descrição': 'comando para trocar de sala',
                'executar': lambda id_sala: sala_controller.trocar_jogador_de_sala(GLOBAL_SETS['id_personagem'], id_sala)
            }
        },
        'mapa': {
            'atual': {
                'descrição': 'comando para ver o mapa da região atual',
                'executar': lambda _: sala_controller.desenhar_mapa_regiao('regiao_atual')  # Placeholder
            },
            'regiao': {
                'argumento': 'nome_regiao',
                'descrição': 'comando para ver o mapa de uma determinada região',
                'executar': lambda nome_regiao: sala_controller.desenhar_mapa_regiao(nome_regiao)
            },
            'listar': {
                'argumento': 'regiao',
                'descrição': 'comando para listar os nomes da região. Argumentos permitidos: regiao',
                'executar': lambda regiao: sala_controller.listar(regiao)
            }
        }
    }

    def listar_comandos():
        print("\nComandos disponíveis:")
        for grupo, comandos in lista_comandos.items():
            print(f"\n[{grupo}] Comandos:")
            for comando, detalhes in comandos.items():
                descricao = detalhes.get('descrição', 'Sem descrição')
                print(f"  {grupo} {comando} - {descricao}")

    def listar_comandos_grupo(grupo):
        if grupo in lista_comandos:
            print(f"\nComandos disponíveis para '{grupo}':")
            for comando, detalhes in lista_comandos[grupo].items():
                descricao = detalhes.get('descrição', 'Sem descrição')
                print(f"  {grupo} {comando} - {descricao}")
        else:
            print(f"Grupo '{grupo}' não encontrado.")

    def executar_comando(comando):
        partes_comando = comando.split(' ', 2)
        grupo = partes_comando[0]
        subcomando = partes_comando[1] if len(partes_comando) > 1 else None
        argumento = partes_comando[2] if len(partes_comando) > 2 else None

        if grupo in lista_comandos:
            if subcomando == '-h':
                listar_comandos_grupo(grupo)
            elif subcomando in lista_comandos[grupo]:
                detalhes_comando = lista_comandos[grupo][subcomando]
                if 'argumento' in detalhes_comando and argumento:
                    detalhes_comando['executar'](argumento)
                elif 'argumento' not in detalhes_comando:
                    detalhes_comando['executar'](None)
                else:
                    print("Erro: Comando requer um argumento.")
            else:
                print("Subcomando inválido. Use '-h' para ver os comandos disponíveis.")
        else:
            print("Comando inválido. Tente novamente.")

    print("Bem-vindo ao jogo!")
    listar_comandos()

    while True:
        comando = input("\nDigite um comando: ")
        executar_comando(comando)

if __name__ == "__main__":
    main()