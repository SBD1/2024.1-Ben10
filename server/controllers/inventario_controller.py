from services.inventario_service import InventarioService

class InventarioController:

    def __init__(self):
        self.inventario_service = InventarioService()

    def listar_consumiveis(self):
        self.inventario_service.listar_consumiveis()
    
   
