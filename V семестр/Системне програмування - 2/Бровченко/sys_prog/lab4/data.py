import lab4.tokens as t
import re
from termcolor import colored

expression = 'b+=2n;'


def compare_brackets(br_o, br_c):
    if (br_o == t.brackets_open[0]) and (br_c == t.brackets_close[0]):
        return True
    elif (br_o == t.brackets_open[1]) and (br_c == t.brackets_close[1]):
        return True
    else: return False


def common_check(var):
    if len(var) == 0:
        print(colored('Exception: empty statement', 'red'))
        return False

    # check brackets
    is_bracket = False
    balance = []
    last_bkt_ind = 0
    for i in range(len(var)):
        if var[i] in t.brackets_open:
            balance.append(var[i])
            is_bracket = True
            last_bkt_ind = i

        if var[i] in t.brackets_close:
            if len(balance) != 0:
                if compare_brackets(balance[len(balance) - 1], var[i]):
                    balance.pop(len(balance) - 1)
            else:
                print(colored('Exception: wrong statement ' + var, 'red'))
                return False
            if (i - last_bkt_ind) == 1:
                print(colored('Exception: wrong statement ' + var + '\n Tip : empty brackets.', 'red'))
                return False

    if not len(balance) == 0:
        print(colored('Exception: wrong statement ' + var, 'red'))
        return False

    if bool(re.search('[^A-Za-z0-9]?[0-9]+[A-Za-z]+', var))or bool(re.search('^[0-9]+[A-Za-z]+', var)):
        print(colored('Exception: wrong statement ' + var, 'red'))
        return False

    if var[-1] in t.simple_operations:
        print(colored('Exception: wrong statement ' + var, 'red'))
        return False

    if is_bracket:
        try:
            in_brackets = re.search('(?<=\[).*?(?=\])', var).group()
            if bool(re.search('[^A-Za-z0-9]', in_brackets)):
                print(colored('Exception: wrong statement in brackets ' + in_brackets, 'red'))
                return False
        except:pass

    if bool(re.search('[^ 0-9=+-]+[0-9]+?[.]?[0-9]+', var)):
        print(colored('Exception: wrong statement ' + var, 'red'))
        return False

    if not is_bracket:
        if var not in t.tokens:
            return True
        else:
            print(colored('Exception: wrong statement ' + var, 'red'))
            return False

    return True


def check_simple_var(var):
    return True if common_check(var) else False


def check_complex_tokens(var):
    if common_check(var):
        for ind in range(len(var)):
            if var[ind] in t.simple_operations:
                try:
                    if (var[ind+1] == '=') or (var[ind:ind+2] or var[ind-1:ind+1] in t.inc_dec_tokens):
                        pass
                    elif (var[ind-1] in t.tokens) or (var[ind+1] in t.tokens):
                        print(colored('Exception: wrong statement ' + var, 'red'))
                        return False
                except IndexError:
                    print(colored('Exception: wrong statement ' + var, 'red'))
                    return False
    else:
        return False
    return True


def main():
    global expression

    print('Expression ', colored(expression, 'magenta'))

    # delete all spaces
    expression = expression.replace(' ', '')

    # check semi_colon
    if expression[-1] != ';':
        print(colored('Exception: SEMI_COLON ";" was not found', 'red'))
        return

    # check necessary elements
    assign_token = []
    for i in t.assignment_tokens:
        if i in expression:
            assign_token = [i, expression.index(i)]
            break

    if assign_token[0] == '=':
        if check_simple_var(expression[:assign_token[1]]):
            if check_complex_tokens(expression[assign_token[1]+1:]):
                print(colored('No exceptions found', 'green'))
    elif assign_token[0] == '+=' or assign_token[0] == '-=':
        if check_simple_var(expression[:assign_token[1]]):
            if check_complex_tokens(expression[assign_token[1]+2:]):
                print(colored('No exceptions found', 'green'))
    else: print(colored('Exception: Assignment error.', 'red'))


if __name__ == '__main__':
    main()
