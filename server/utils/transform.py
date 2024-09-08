def dict_to_list(lista_dicts : list, key : str) -> list:
    return [item[str(key)] for item in lista_dicts]