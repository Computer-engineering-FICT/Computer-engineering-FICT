import Tokens as t

'if (a>b) then begin end else begin end;'

flag_success = True


def compare_brackets(br_o, br_c):
    if (br_o == t.brackets_open[0]) and (br_c == t.brackets_close[0]):
        return True
    if (br_o == t.brackets_open[1]) and (br_c == t.brackets_close[1]):
        return True
    return False


l = 0


def build_tree_condition(expr):
    print(expr)
    if expr[0] == '(':
        indexes = []
        ind = 0
        part = 0
        for i in range(len(expr)):
            if expr[i] == '(':
                if ind == 0:
                    indexes.append(i)
                ind += 1
            if expr[i] == ')':
                ind -= 1
                if ind == 0:
                    indexes.append(i)
                    build_tree_condition(expr[indexes[part * 2] + 1:indexes[1 + part * 2]])
                    part += 1
        if len(indexes) > 2:
            temp = expr[indexes[1] + 1:indexes[2]]
            if temp not in t.logic_list:
                exc_print('error occurred in condition')
                return
        if len(indexes) > 4:
            exc_print('error occurred in condition')
            return
    else:
        for el in t.tree_sequence:
            if expr.find(el) != -1:
                exc_print('error in condition')
                return

        positions = []
        for el in t.compare_list:
            p = expr.find(el)
            if p != -1:
                positions.append(p)
                positions.append(len(el))
                break
        try:

            if expr[positions[0] - 1] == ')':
                start = expr.find('(')
                build_tree_condition(expr[start:positions[0]])
            elif expr[positions[0] + positions[1] - 1] == '(':
                end_ind = expr.find(')', )
                build_tree_condition(expr[positions[0] + 1:end_ind + 1])
            elif expr[positions[0] - 1] not in 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890' or expr[
                                positions[0] + positions[1] - 1] not in 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890':
                exc_print('error in condition')
                return



        except(Exception):
            exc_print('error in condition')
            return


def parse_condition(condition):
    length = len(condition)
    flag = False
    i = 0
    while (i <= length):
        if flag:
            i -= 1
            flag = False
        if i == length:
            break
        if condition[i] == '':
            condition.pop(i)
            length -= 1
            flag = True
        i += 1

    if (len(condition) == 0):
        exc_print('empty condition statement')
        return
    # concat
    expr = ''
    for i in condition:
        expr += i

    # check brackets
    is_bracket = False
    balance = []
    last_bkt_ind = 0
    for i in range(len(expr)):
        if expr[i] in t.brackets_open:
            balance.append(expr[i])
            is_bracket = True
            last_bkt_ind = i

        if expr[i] in t.brackets_close:
            if len(balance) != 0:
                if compare_brackets(balance[len(balance) - 1], expr[i]):
                    balance.pop(len(balance) - 1)
            else:
                exc_print('wrong statement ' + expr)
                return
            if (i - last_bkt_ind) == 1:
                exc_print('wrong statement ' + expr + 'Tip : error in brackets.')
                return

    if not len(balance) == 0:
        exc_print('wrong statement ' + expr)
        return

    if not is_bracket:
        exc_print('wrong statement ' + expr)
        return

    # my parsing

    if not (expr[0] == '(' and expr[-1] == ')'):
        exc_print('error in structure ' + expr)
        return
    build_tree_condition(expr)


def parse_body(body, type='then'):
    # print('Parse body', body)
    length = len(body)
    flag = False
    i = 0
    while (i <= length):
        if flag:
            i -= 1
            flag = False
        if i == length:
            break
        if body[i] == '':
            body.pop(i)
            length -= 1
            flag = True
        i += 1

    if len(body) != 0:
        if (type == 'then' and body[0] == 'begin' and body[-1] == 'end'):
            body = body[1:-1]
        elif (type == 'else' and body[0] == 'begin' and body[-1] == 'end;'):
            body = body[1:-1]
        else:
            exc_print('error occurred in begin - end statement')
            return

    flag = 0
    for i in range(len(body)):
        if flag == -1:
            exc_print('error with blocks begin-end')
            return
        if body[i] == 'begin':
            flag += 1
        if body[i] == 'end':
            if flag == 1:
                flag -= 2

    if flag > 0:
        exc_print('error occurred in begin - end statement')
        return


def analyze(expression):
    elements = expression.split(' ')

    cond_el_ind = 0
    if (elements[cond_el_ind] != t.condition_list[0]):
        exc_print('it is not condition module, please import another module')
        return
    parts = []

    ind_list = [0, 0, 0]
    flag_list = [0, 0, 0]
    for i in range(len(elements)):
        if elements[i] == t.condition_list[0]:
            flag_list[0] = 1
            if flag_list[0] == 1:
                ind_list[0] = i
        elif elements[i] == t.condition_list[1]:
            if flag_list[0] == 1:
                ind_list[1] = i
            else:
                flag_list[0] -= 1
        elif elements[i] == t.condition_list[2]:
            if flag_list[0] == 1:
                ind_list[2] = i

    if ind_list[1] == 0:
        exc_print('error with "then"')
        return

    parts.append(elements[1:ind_list[1]])
    if ind_list[2] != 0:
        parts.append(elements[ind_list[1] + 1:ind_list[2]])
        parts.append(elements[ind_list[2] + 1:])
    else:
        parts.append(elements[ind_list[1]:])

    parse_condition((parts[0]))
    parse_body(parts[1], type='then')
    if len(parts) > 2:
        parse_body(parts[2], type='else')


def exc_print(text):
    global flag_success
    print('Exception : ', text)
    flag_success = False


i = 0


def print_tree(text):
    global i
    index = -1
    if (text == ''):
        return True
    if (i < len(t.tree_sequence)):
        index = text.find(t.tree_sequence[i])
    if (index != -1):
        current_sign = t.tree_sequence[i]
        i += 1
        print_tree(text[:index])
        print_tree(current_sign)
        print_tree(text[index + len(current_sign):])
    else:
        if text == ' ':
            return
        if text in t.general_list:
            print(text + '   | ' + t.general_list.get(text, text))
        else:
            fl = 1
            for q in range(len(text)):
                if fl == 1:

                    if (q + 2) < len(text):
                        if text[q] + text[q + 1] + text[q + 2] in t.logic_list:
                            print(text[q] + text[q + 1] + text[q + 2] + '   | ' + t.logic_list.get(
                                text[q] + text[q + 1] + text[q + 2]))
                            fl = 3
                            continue

                    if (q + 1) < len(text):
                        if text[q] + text[q + 1] in t.general_list:
                            print(text[q] + text[q + 1] + '   | ' + t.general_list.get(text[q] + text[q + 1]))
                            fl = 2
                            continue

                    if text[q] in t.general_list:
                        print(text[q] + '   | ' + t.general_list.get(text[q]))
                    else:
                        print(text[q] + '   | ' + 'VAR')
                else:
                    fl -= 1


def build_tree(expression):
    length = len(expression)
    flag = False
    i = 0
    while (i <= length):
        if flag:
            i -= 1
            flag = False
        if i == length:
            break
        if expression[i] == ' ':
            expression = expression[:i] + expression[i + 1:]
            length -= 1
            flag = True
        i += 1
    print_tree(expression)
