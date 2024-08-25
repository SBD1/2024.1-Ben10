from repositories.npc_repository import NpcRepository

class NpcService:
    def __init__(self):
        self.npc_repository = NpcRepository()

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
        Verifica se há um NPC na sala com o ID especificado e exibe a fala do NPC.
        :param id_sala: ID da sala a ser verificada.
        """
        npc_id = self.verificar_npc_na_sala(id_sala)
        if npc_id:
            fala_npc = self.obter_fala_npc(npc_id)
            if fala_npc:
                if fala_npc.get("textoComercio"):
                    print(f"NPC: {fala_npc['textoComercio']}")
                if fala_npc.get("textoMissao"):
                    print(f"NPC: {fala_npc['textoMissao']}")
        else:
            print("A sala parece estar vazia.")

    def close(self):
        """
        Fecha a conexão com o banco de dados no repositório.
        """
        self.npc_repository.close()
