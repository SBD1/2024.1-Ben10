from repositories.inventario_repository import InventarioRepository

class InventarioService:

    def __init__(self):
        self.inventario_repository = InventarioRepository()

    def listar_consumiveis(self) -> None:
        """
        Lista todos os consumíveis
        """
        consumiveis = self.inventario_repository.obter_consumiveis()
        
        for a in range(len(consumiveis)):
            consumivel = consumiveis[a]
            print("{} - {} custa {} moedas".format(a+1,consumivel.get('nome_item'),consumivel.get('preco')))
