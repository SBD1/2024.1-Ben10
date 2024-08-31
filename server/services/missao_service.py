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
    

    def verificar_item_inventario(self, id_personagem, id_missao):
        item = self.missao_repository.verificar_item_inventario(id_personagem, id_missao)

        if len(item):
            return item[0]
        
        return None
    
    def entregar_recompensa(self, id_personagem, missao):
        return self.missao_repository.entregar_recompensa(id_personagem, missao['experiencia'], missao['recompensa_em_moedas'])

    def entregar_missao(self, id_personagem, missao):
        if missao['tipo_missao'] == 'ENTREGA':
            item = self.verificar_item_inventario(id_personagem, missao['id_missao'])

            if not item:
                print("Você ainda não possui o item para ser entregue!")
                raise MissaoError("Jogador não possui o item")
                        
            self.missao_repository.concluir_missao(id_personagem, missao['id_missao'])
            self.missao_repository.tirar_item_inventario(id_personagem, item['id_item'])
            print('\nMissão concluída com sucesso, parabéns!')
        
        print("Por favor, aceite a recompensa de bom grado!")
        self.entregar_recompensa(id_personagem, missao)