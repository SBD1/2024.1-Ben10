from repositories.missao_repository import MissaoRepository

class MissaoError(Exception):
    pass

class MissaoService:
    def __init__(self):
        self.missao_repository = MissaoRepository()

    def obter_missao_por_npc(self, id_npc):
        return self.missao_repository.obter_missao_por_npc(id_npc)

    def verificar_registro_missao(self, id_personagem, id_missao):
        registro = self.missao_repository.obter_registro_missao(id_personagem, id_missao)

        if len(registro):
            if registro[0]['status'] == 'completa':
                print("Você já completou a missão!")
                raise MissaoError('Missao completa')     
            return True
        return False
    
    # def verificar_pre_requisito_missao(self, id_personagem, id_missao):
