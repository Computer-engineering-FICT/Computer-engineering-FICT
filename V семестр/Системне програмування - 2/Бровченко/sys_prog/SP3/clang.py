import sys
import re

c_dictionary = [
    (r'[ \n\t]+',         None),
    (r'#[^\n]*',          None),

    (r'[0-9_]+[A-Za-z]+',         'ERROR'),

    
    
    (r'auto',             'STORAGE_CLASSES'),
    (r'extern',           'STORAGE_CLASSES'),
    (r'register',         'STORAGE_CLASSES'),
    (r'static',           'STORAGE_CLASSES'),

    (r'char',             'DATA_TYPE'),
    (r'double',           'DATA_TYPE'),
    (r'enum',             'DATA_TYPE'),
    (r'float',            'DATA_TYPE'),
    (r'int',              'DATA_TYPE'),

    (r'long',             'DATA_TYPE_MODIFIERS'),
    (r'short',            'DATA_TYPE_MODIFIERS'),
    (r'signed',           'DATA_TYPE_MODIFIERS'),
    (r'unsigned',         'DATA_TYPE_MODIFIERS'),

    (r'const',            'QUALIFIERS'),
    (r'volatile',         'QUALIFIERS'),

    (r'break',            'KEY_WORD'),
    (r'case',             'KEY_WORD'),    
    (r'continue',         'KEY_WORD'),
    (r'default',          'KEY_WORD'),
    (r'do',               'KEY_WORD'),
    (r'else',             'KEY_WORD'),    
    (r'for',              'KEY_WORD'),
    (r'goto',             'KEY_WORD'),
    (r'if',               'KEY_WORD'),   
    (r'return',           'KEY_WORD'),
    (r'sizeof',           'KEY_WORD'),
    (r'struct',           'KEY_WORD'),
    (r'switch',           'KEY_WORD'),
    (r'typedef',          'KEY_WORD'),
    (r'union',            'KEY_WORD'),
    (r'void',             'KEY_WORD'),
    (r'while',            'KEY_WORD'),

    (r'\+\+',   'ARITHMETIC_OPERATOR'),
    (r'\+',     'ARITHMETIC_OPERATOR'),
    (r'\*',     'ARITHMETIC_OPERATOR'),
    (r'--',     'ARITHMETIC_OPERATOR'),
    (r'-',      'ARITHMETIC_OPERATOR'),
    (r'/',      'ARITHMETIC_OPERATOR'),
    (r'%',      'ARITHMETIC_OPERATOR'),
    
    (r'[A-Za-z][A-Za-z0-9_]*', 'IDENTIFIER'),
    (r'[0-9]+',                'NUMBER'),    

    (r'==',     'LOGICAL_OPERATOR'),
    (r'!=',     'LOGICAL_OPERATOR'),
    (r'>',      'LOGICAL_OPERATOR'),
    (r'<',      'LOGICAL_OPERATOR'),
    (r'>=',     'LOGICAL_OPERATOR'),
    (r'<=',     'LOGICAL_OPERATOR'),
    (r'&&',     'LOGICAL_OPERATOR'),
    (r'\|\|',   'LOGICAL_OPERATOR'),
    (r'!',      'LOGICAL_OPERATOR'),

    (r'\&',     'BINARY_OPERATOR'),
    (r'\|',     'BINARY_OPERATOR'),
    (r'\^',     'BINARY_OPERATOR'),
    (r'\~',     'BINARY_OPERATOR'),
    (r'\<\<',   'BINARY_OPERATOR'),
    (r'\>\>',   'BINARY_OPERATOR'),

    (r'=',      'ASSIGMENTS_OPERATOR'),
    (r'\+=',    'ASSIGMENTS_OPERATOR'),
    (r'-=',     'ASSIGMENTS_OPERATOR'),
    (r'\*=',    'ASSIGMENTS_OPERATOR'),
    
    

    (r'\(',     'LB_BRACKETS'),
    (r'\)',     'RB_BRACKETS'),
    (r'\[',     'LB_BRACKETS'),
    (r'\]',     'RB_BRACKETS'),
    (r'\{',     'LB_BRACKETS'),
    (r'\}',     'RB_BRACKETS'),

    (r';',      'SEPARATOR'),
    (r':',      'SEPARATOR'),
    (r',',      'SEPARATOR'),
    
]


def find_lexem(characters, token_exprs):
    position = 0
    tokens = []

    while position < len(characters):
        match = None
        for token_expr in token_exprs:
            pattern, tag = token_expr
            regex = re.compile(pattern)
            match = regex.match(characters, position)
            if match:
                text = match.group(0)
                if tag:
                    token = (text, tag)
                    tokens.append(token)
                break
        if not match:
            print("ERROR: NOT FOUND %s" % characters[position])
            break
        else:
            position = match.end(0)

    return tokens

def c_lexem(data):
    return find_lexem(data, c_dictionary)

