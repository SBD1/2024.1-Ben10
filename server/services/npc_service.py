from repositories.npc_repository import NpcRepository
from utils.validation_utils import ValidationUtils
from repositories.personagem_repository import PersonagemRepository

class NpcError(Exception):
    pass

class NpcService:
    def __init__(self):
        self.npc_repository = NpcRepository()
        self.validation_utils = ValidationUtils()
        self.personagem_repository = PersonagemRepository()

    def verificar_npc_na_sala(self, id_sala):
        """
        Verifica se há um NPC na sala com o ID especificado.
        :param id_sala: ID da sala a ser verificada.
        :return: ID do NPC se existir, caso contrário retorna None.
        """
        return self.npc_repository.verificar_npc_na_sala(id_sala)

    def obter_fala_npc(self, id_npc):
        """
        Obtém a fala do NPC com base no ID do NPC.
        :param id_npc: ID do NPC.
        :return: Dicionário com o texto do comércio e o texto da missão.
        """
        return self.npc_repository.obter_fala_npc(id_npc)

    def exibir_fala_npc_na_sala(self, id_sala):
        """
        Verifica se há um NPC na sala com o ID especificado e exibe as falas do NPC.
        :param id_sala: ID da sala a ser verificada.
        """
        npc_id = self.verificar_npc_na_sala(id_sala)
        if npc_id:
            fala_npc = self.obter_fala_npc(npc_id)
            if fala_npc:
                print(f"{fala_npc['nomeNpc']}: {fala_npc['textoComercio']}")
        else:
            print("A sala parece estar vazia.")
        return None

    def obter_npcs_sala(self, id_sala):
        self.validation_utils.validate_integer(id_sala)
        return self.npc_repository.obter_npcs_sala(id_sala)
    
    def npc_roles(self, id_npc, id_sala):
        if not self.validation_utils.validate_integer(id_npc):
            raise NpcError("ID do NPC inválido.")
        
        npc = self.npc_repository.obter_roles_npc(id_npc, id_sala)
        return npc
    
    def listar_estoque_npc(self, id_npc):
        if not self.validation_utils.validate_integer(id_npc):
            raise NpcError("ID do NPC inválido.")
        
        estoque = self.npc_repository.listar_estoque_npc(id_npc)
        return estoque

    def comprar_item(self, id_personagem, item):
        self.npc_repository.inserir_item_inventario(id_personagem, item['nome_item'])
        self.personagem_repository.descontar_moedas_personagem(id_personagem, item['preco'])
        print(f"\nVocê comprou {item['nome_item']}, veja no seu inventário!")


    def close(self):
        """
        Fecha a conexão com o banco de dados no repositório.
        """
        self.npc_repository.close()
