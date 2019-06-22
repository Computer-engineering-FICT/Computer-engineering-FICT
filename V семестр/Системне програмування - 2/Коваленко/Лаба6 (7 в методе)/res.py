
expression = "float b, d=1.0, a[5]; a[2]=2.2; int c=1, n=2; b=c?d:2.0*a[n];"

common_list = {'>': 'MORE',
               '<': 'LESS',
               '<=': 'LESS_EQUALS',
               '>=': 'MORE_EQUALS',
               '<>': 'NOT_EQUALS',
               '==': 'EQUALS',
               ';': 'SEMI_COLON',
               '(': 'LEFT_BKT',
               ')': 'RIGHT_BKT',
               '+': 'ADD',
               '-': 'SUB',
               '*': 'MUL',
               '/': 'DIVIDE',
               '=': 'EQUAL',
               '[': 'LEFT_SQUARE_BKT',
               ']': 'RIGHT_SQUARE_BKT',
               'if': 'IF',
               'then': 'THEN',
               'else': 'ELSE',
               'begin': 'START_STATEMENT',
               'end': 'END_STATEMENT',
               'int': 'INTEGER',
               'short': 'SHORT',
               'long': 'LONG',
               'float': 'FLOAT',
               'double': 'DOUBLE',
               'char': 'CHAR'}

undefined = ['<=', '(', '+', '>', '*', '<>', '<', ')', ';', '-', '/', '==', '>=']

data_type = ['int', 'short', 'long', 'char', 'float', 'double']

operation_list = ['*', '/', '+', '-', '%']

special_list = ['*', '/', '+', '-', '%', '[', ']']

liters = ['qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM']
numbers = ['1234567890']
numbers_str = ['1234567890']
