class ValidationUtils:
    @staticmethod
    def validate_string(value) -> bool:
        """
        Valida se o valor é uma string com comprimento entre 1 e 30 caracteres.

        :param value: A string a ser validada.
        :return: True se a string for válida, False caso contrário.
        """
        if not isinstance(value, str):
            print("Entrada inválida: digite uma string!")
            return False
        if len(value) < 1 or len(value) > 30:
            print("Entrada muito grande ou nula, digite uma string de até 30 caracteres!")
            return False
        return True


    @staticmethod
    def validate_integer(value) -> bool:
        """
        Valida se o valor é um inteiro.

        :param value: O valor a ser validado.
        :return: True se o valor for um inteiro, False caso contrário.
        """
        if not isinstance(value, int):
            print("Entrada inválida: digite um número inteiro!")
            return False
        # if value <= 0 or value > 100:
        #     print("DIGITE DENTRO DO LIMITE // EXEMPLO")
        #     return False
        return True