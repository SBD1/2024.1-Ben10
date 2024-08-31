from controllers.sala_controller import SalaController
from controllers.personagem_controller import PersonagemController
import os
from utils.validation_utils import ValidationUtils
from controllers.npc_controller import NpcController

def main():
    global GLOBAL_SETS 
    sala_controller = SalaController()
    personagem_controller = PersonagemController()
    npc_controller = NpcController()
    validation_utils = ValidationUtils()

    GLOBAL_SETS = {
        'id_personagem': None
    }

    lista_comandos = {
        'personagem': {
            'exibir': {
                'descrição': 'comando para exibir informações sobre o seu personagem no jogo',
                'executar': lambda _: personagem_controller.exibir_personagem(GLOBAL_SETS['id_personagem'], 'S')
            },
            'inventario': {
                'descrição': 'comando para exibir informações sobre os itens do seu personagem no jogo',
                'executar': lambda _: personagem_controller.exibir_inventario(GLOBAL_SETS['id_personagem'])
            }
        },
        'sala': {
            'trocar': {
                'argumento': 'id_sala',
                'descrição': 'comando para trocar de sala',
                'executar': lambda id_sala: sala_controller.trocar_jogador_de_sala(GLOBAL_SETS['id_personagem'], id_sala)
            },
            'npc': {
                'descrição': 'comando para listar os npcs na sala atual com sua role',
                'executar': lambda _: sala_controller.mostrar_npcs_na_sala(GLOBAL_SETS['id_personagem'])
            }
        },
        'mapa': {
            'atual': {
                'descrição': 'comando para ver o mapa da região atual',
                'executar': lambda _: sala_controller.desenhar_mapa_regiao_atual()
            },
            'regiao': {
                'argumento': 'id_regiao',
                'descrição': 'comando para ver o mapa de uma determinada região. Selecione o ID da região, execute o comando \"mapa listar\" para conhecer todas as regiões',
                'executar': lambda id_regiao: sala_controller.desenhar_mapa_regiao(id_regiao)
            },
            'listar': {
                'descrição': 'comando para listar todas as regiões.',
                'executar': lambda _: sala_controller.listar()
            }
        },
        'npc': {
            'falar': {
                'argumento': 'id_npc',
                'descrição': 'comando para falar com um npc',
                'executar': lambda id_npc: npc_controller.interagir_com_npc(GLOBAL_SETS['id_personagem'], id_npc)
            }
        },
        'help': {
            'comandos': {
                'descrição': 'lista todos os comandos disponíveis no jogo',
                'executar': lambda _: listar_comandos()
            }
        }
    }

    def criar_personagem():
        global GLOBAL_SETS
        id_personagem_atual = 0
        verificacao = False
        personagem = 0
        alien = 0

        aliens = {
        1: 'Quatro Braços',
        2: 'XLR8',
        3: 'Chama',
        4: 'Diamante',
        5: 'Besta',
        6: 'Insectóide',
        7: 'Fantasmático',
        8: 'Ultra T',
        9: 'Massa Cinzenta',
        10: 'Aquático',
        11: 'Vilgax'}

        print('Digite o nome que deseja ser chamado no jogo:')

        while verificacao == False:

            personagem = input('')
            if len(personagem) <= 2:
                personagem = ''
                os.system('clear')
                print('Por favor insira um nome válido')
            else:
                verificacao = True

        verificacao = False

        print('\nAgora esses são nossos Aliens disponíveis! Escolha um deles de forma sábia! (Digite o numero)')

        while verificacao == False:
            for key, value in aliens.items():
                print(f"{key} - {value}")

            alien = input('')

            if not alien.isdigit():
                print('Por favor, digite um número válido!')
            else:
                alien = int(alien)
                if alien <= 0 or alien > 10:
                    alien = 0
                    os.system('clear')
                    print('Por favor insira um número válido')
                else:
                    verificacao = True

        GLOBAL_SETS['id_personagem'] = personagem_controller.criar_personagem(personagem, aliens[alien])

    def personagem():
        global GLOBAL_SETS
        id_personagem_atual = 0
        condicao = 0
        
        while condicao == False:

            confirmacao = input("Você já possui um personagem? (S / N):\n")

            if confirmacao == 'S' or confirmacao == 's':
                    id_personagem_atual = input("Digite o ID do seu personagem para que possamos achá-lo no nosso sistema:")

                    if not id_personagem_atual.isdigit():
                        print('Por favor, digite um número válido!')

                    else:
                        if personagem_controller.exibir_personagem(id_personagem_atual, 'N') == None:
                            condicao = False
                            print('ID não encontrado, por favor, digite novamente!')
                        else:
                            personagem_controller.exibir_personagem(id_personagem_atual, 'S')
                            GLOBAL_SETS['id_personagem'] = id_personagem_atual
                            condicao = True

            elif confirmacao == 'N' or confirmacao == 'n':
                os.system('clear')
                print('Ok, não se preocupe!\nVamos criar seu personagem...\n')
                criar_personagem()
                condicao = True
            
            else:
                os.system('clear')
                print('Digite um valor válido!')

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

    os.system('clear')

    print("Bem-vindo ao jogo!")

    personagem()

    # Exibe comandos do jogo ao iniciar
    listar_comandos()

    while True:
        comando = input("\nDigite um comando: ")
        executar_comando(comando)

if __name__ == "__main__":
    main()