def dict_to_list(lista_dicts : list, key : str) -> list:
    return [item[str(key)] for item in lista_dicts]

def get_keys_from_dict(dictionary : dict) -> list:
    chaves = []
    chaves.extend(dictionary['consumivel'].keys())
    chaves.extend(dictionary['debuff'].keys())
    return chaves