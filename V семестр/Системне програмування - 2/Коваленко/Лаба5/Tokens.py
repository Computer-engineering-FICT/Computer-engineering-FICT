general_list = {'if': 'IF',
                '>': 'MORE',
                '<': 'LESS',
                '<=': 'LESS_EQUALS',
                '>=': 'MORE_EQUALS',
                '<>': 'NOT_EQUALS',
                '==': 'EQUALS',
                '=': 'EQUAL',
                'then': 'THEN',
                'else': 'ELSE',
                'begin': 'START_STATEMENT',
                'end': 'END_STATEMENT',
                ';': 'SEMI_COLON',
                '(': 'LEFT_BKT',
                ')': 'RIGHT_BKT',
                '[': 'LEFT_SQUARE_BKT',
                ']': 'RIGHT_SQUARE_BKT',
                '+': 'ADD',
                '-': 'SUB',
                '*': 'MUL',
                '/': 'DIVIDE'}

operation_list = ['+', '-', '*', '/', '%', '=']

brackets_list = ['(', ')', '[', ']']

condition_list = ['if', 'then', 'else']

body_list = ['begin', 'end;']

logic_list = {'or': 'OR',
              'and': 'AND'}

condition_body = ['<=', '=>', '==', '<>', '<', '>']

uncompare_list = condition_list + body_list
compare_list = condition_body + operation_list

brackets_open = ['(', '[']
brackets_close = [')', ']']

tree_sequence = ['if', 'then', 'begin', 'end', 'else', 'begin', 'end;', ';']