tokens = {'=': 'ASSIGN',
          ':': 'COLON',
          '?': 'QUESTION_MARK',
          '*': 'MUL',
          '[': 'LEFT_SQUARE_BRACKET',
          ']': 'RIGHT_SQUARE_BRACKET',
          ';': 'SEMI_COLON',
          '/': 'DIVIDE',
          '%': 'DIVIDE',
          '-': 'SUBTRACT',
          '+': 'ADD',
          '+=': 'SUM_ASSIGN',
          '-=': 'SUB_ASSIGN',
          '&': 'LOGIC_AND',
          '|': 'LOGIC_OR',
          '^': 'LOGIC_EXCLUSIVE_OR',
          '++': 'INC',
          '--': 'DEC'}

assignment_tokens = ['+=', '-=', '=']

brackets_open = ['(', '[']
brackets_close = [')', ']']

inc_dec_tokens = ['++', '--']

simple_operations = ['*', '+', '-', '/', '&', '|', '^']
