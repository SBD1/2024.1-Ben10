import time
import threading

GLOBAL_SETS = {
    'id_personagem': None,
    'vida_maxima': None,
    'vida_atual': None,
    'consumivel': {
        'buff_dano': None,
        'critico': None,
        'imunidade': None,
        'vida_extra': None
    },
    'alien': {
        'vida_maxima': None,
        'vida_atual': None
    },
}