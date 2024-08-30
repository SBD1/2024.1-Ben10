from repositories.missao_repository import MissaoRepository

class MissaoError(Exception):
    pass

class MissaoService:
    def __init__(self):
        self.missao_repository = MissaoRepository()

    def obter_missao_por_npc(self, id_npc):
        return self.missao_repository.obter_missao_por_npc(id_npc)
    
    def obter_id_missao_pre_requisito(self, id_missao):
        return self.missao_repository.obter_id_missao_pre_requisito(id_missao)

    def verificar_registro_missao(self, id_personagem, id_missao):
        registro = self.missao_repository.obter_registro_missao(id_personagem, id_missao)

        if len(registro):
            if registro[0]['status'] == 'completa':
                print("Você já completou a missão!")
                raise MissaoError('Missao completa')     
            return True
        return False
    
    def pode_fazer_missao(self, id_personagem, id_missao):
        id_pre_requisito = self.obter_id_missao_pre_requisito(id_missao)

        if not len(id_pre_requisito):
            return

        id_pre_requisito = id_pre_requisito[0]['id_pre_requisito']
        
        missao = self.missao_repository.verificar_pre_requisito(id_personagem, id_pre_requisito)

        if len(missao):
            return
        
        print("Você não possui o pré-requisito para fazer esta missão!")
        raise MissaoError("Jogador nao tem o pré-requisito para fazer a missão")
            
        
    def instanciar_registro_da_missao(self, id_personagem, id_missao):
        return self.missao_repository.instanciar_registro_da_missao(id_personagem, id_missao)