import tokens as t

expression = 'a=c?d:2*a[an];'

def compare_brackets(br_o, br_c):
    if (br_o == t.brackets_open[0]) and (br_c == t.brackets_close[0]):
        return True
    if (br_o == t.brackets_open[1]) and (br_c == t.brackets_close[1]):
        return True
    return False

def common_check(var):
    if len(var) == 0:
        print('Exception: empty')
        return False

    for s in var:
        if s in t.necessary_tokens:
            print('Exception')
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
                print('Exception: wrong statement ' + var)
                return False
            if (i - last_bkt_ind) == 1:
                print('Exception: wrong statement ' + var + ' . Tip : error in brackets.')
                return False

    if not len(balance) == 0:
        print('Exception: wrong statement ' + var)
        return False

    if not is_bracket:
        if var not in t.tokens:
            return True
        else:
            print('Exception: wrong assignment' + var)
            return False

    return True


def check_simple_var(var):
    return True if common_check(var) else False

def check_complex_tokens(var):
    if common_check(var):
        for ind in range(len(var)):
            if var[ind] in t.simple_operations:
                try:
                    if (var[ind-1] in t.tokens) or (var[ind+1] in t.tokens):
                        print('Exception: wrong statement ' + var)
                        return False
                except IndexError:
                    print('Exception: wrong statement ' + var)
                    return False
    else:
        return False
    return True

def main():
    global expression

    print('Expression ' + expression)

    # delete all spaces
    expression = expression.replace(' ', '')

    # check semi_colon
    if expression[-1] != ';':
        print('Exception: SEMI_COLON ";" was not found')
        return

    # check necessary elements of ternary operator

    token_index = 0
    for i in expression:
        if i == t.necessary_tokens[token_index]:
            token_index += 1
            if token_index == len(t.necessary_tokens):

                break
    if token_index != 3:
        print('Exception: not all necessary elements or wrong sequence. Tip : error with "' + t.necessary_tokens[token_index] + '"')
        return

    # check variables
    if check_simple_var(expression[:expression.index(t.necessary_tokens[0])]):
        if check_complex_tokens(expression[expression.index(t.necessary_tokens[0]) + 1: expression.index(t.necessary_tokens[1])]):
            if check_complex_tokens(expression[expression.index(t.necessary_tokens[1]) + 1:expression.index(t.necessary_tokens[2])]):
                if check_complex_tokens(expression[expression.index(t.necessary_tokens[2]) + 1:-1]):
                    print('No exceptions found')

if __name__ == '__main__':
    main()