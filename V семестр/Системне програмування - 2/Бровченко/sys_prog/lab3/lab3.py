import re
from termcolor import colored


def is_kirill(text: str):
    search = re.search("""[а-яА-ЯёЁ]+""", text) or re.search("""[^0-9][._][0-9]+""", text)
    return bool(search)


def find_symbol(text: str):
    _symb_var = []
    symbols = ['…', ',', '!=', '?', '<>', '>', '<',
               '[', ']', '(', ')', '*', '+', '-',
               '=', '{', '}', ':', ';', '.', '&',
               '--', '++', ':=']
    for i in symbols:
        if i in text:
            j = text.count(i)
            while j:
                _symb_var.append(i)
                j -= 1
    return _symb_var


def is_service(text: str):
    service_words = ['int', 'void', 'float', 'while', 'do',
                     'if', 'then', 'else', 'switch', 'case',
                     'break', 'default', 'repeat', 'begin',
                     'end', 'until', 'sin', 'cos']

    if text in service_words:
        return True


def compile_text(text: str):
    copy_text = text
    _text_serv = []
    if is_kirill(text):
        return print(colored('\nYour input = {t}\n\n'
                             'Something wrong in your input. Check it.'.format(t=text), 'red'))
    else:
        try:
            _text_num = re.findall('[+-]?[0-9]+.?[0-9]+?', text)
            for i in _text_num:
                text = text.replace(i, '')
        except: _text_num = ['']

        _text_symb = find_symbol(text)
        for i in _text_symb:
            text = text.replace(i, ' ')

        text = text.split(' ')

        for i in text:
            if is_service(i):
                _text_serv.append(i)

        for i in _text_serv:
            text.remove(i)

        while (' ' in text) | ('' in text):
            try:
                text.remove('')
            except: pass

            try:
                text.remove(' ')
            except: pass

        _text_var = set(text)
        _text_symb = set(_text_symb)

        for i in _text_var:
            if re.findall('[0-9]', i) or re.findall('[.,!@#$%^&*(+=]', i):
                return print(colored('\nYour input = {t}\n\n'
                                     'Something wrong in your input. Check it.'.format(t=copy_text), 'red'))

        return print('Your input = {inp}\n\n'
                     'Into tour input:\n'
                     'Service words = {serv}\n'
                     'Variables = {var}\n'
                     'Nums = {nums}\n'
                     'Symbols = {symb}'
                     .format(inp=copy_text, serv=', '.join(_text_serv), var=', '.join(_text_var),
                             nums=', '.join(_text_num), symb=' '.join(_text_symb)))


if __name__ == '__main__':

    string = 'int main (void) {float b, a[13]; int n;…}'
    #string = 'repeat begin И:=b+a[n]; n:=n-1 end until n=0;'
    #string = 'switch(c){case 0: b=2*a[n]; break; default: b=d;}'
    #string = 'if c then b:=sin(2*a) else b:=a;'
    compile_text(string)

