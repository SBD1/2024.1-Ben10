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
        Valida se o valor pode ser convertido para um inteiro.

        :param value: O valor a ser validado.
        :return: True se o valor for um inteiro ou puder ser convertido para um inteiro, False caso contrário.
        """
        try:
            value = int(value)
        except ValueError:
            print("Entrada inválida: digite um número inteiro!")
            return False

        return True

    @staticmethod
    def validate_integer_in_range(value, min_value: int, max_value: int) -> bool:
        """
        Valida se o valor é um inteiro e se está dentro de um intervalo especificado.

        :param value: O valor a ser validado.
        :param min_value: O valor mínimo aceitável (inclusive).
        :param max_value: O valor máximo aceitável (inclusive).
        :return: True se o valor for um inteiro e estiver dentro do intervalo, False caso contrário.
        """
        try:
            # Tenta converter o valor para um inteiro
            value = int(value)
        except ValueError:
            # Se não for possível converter, imprime uma mensagem de erro e retorna False
            print("Entrada inválida: digite um número inteiro!")
            return False

        # Verifica se o valor está dentro do intervalo
        if value < min_value or value > max_value:
            print(f"Entrada inválida: o valor deve estar entre {min_value} e {max_value}.")
            return False

        return True
