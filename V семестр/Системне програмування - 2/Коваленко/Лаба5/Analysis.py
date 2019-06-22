import Tokens as t

expression = ''

tree = []

main_sequence = []

condition_token_list = []


def print_token_list(new_token_list):
    for token in new_token_list:
        print(token, '     |', t.general_list.get(token, 'Variable'))
    pass


def check_condition(condition_list):
    # print('Check condition ', condition_list)

    if len(condition_list) == 0:
        exc_print('empty condition')
        return False

    token_list = []

    for token in condition_list:
        indexes = []
        for i in range(len(token)):
            if token[i] in t.brackets_list:
                indexes.append(i)
        if len(indexes) > 0:
            last = 0
            for i in range(len(indexes)):
                token_list.append(token[last:indexes[i]])
                token_list.append(token[indexes[i]])
                if i != len(indexes) - 1:
                    last = indexes[i] + 1
                else:
                    token_list.append(token[indexes[i] + 1:])
        else:
            token_list.append(token)
    token_list = [x for x in token_list if x != '']

    if token_list[0] == '(' and token_list[-1] == ')':
        token_list.pop(-1)
        token_list.pop(0)
    else:
        exc_print('error occurred in condition')
        return False

    new_token_list = []

    # separate elements with */ < <= >=
    for token in token_list:
        has_sequence = False
        if len(token) > 1:
            start = 0
            for i in range(len(token)):
                if i >= start:
                    is_double = False
                    try:
                        # check i and i+1
                        if token[i] + token[i + 1] in t.compare_list[:4]:
                            new_token_list.append(token[start:i])
                            new_token_list.append(token[i] + token[i + 1])
                            has_sequence = True
                            start = i + 2
                            is_double = True
                    except (IndexError):
                        pass
                    if not is_double:
                        if token[i] in t.compare_list[4:]:
                            new_token_list.append(token[start:i])
                            new_token_list.append(token[i])
                            start = i + 1
                            has_sequence = True

            if not has_sequence:
                new_token_list.append(token)
            else:
                new_token_list.append(token[start:])
        else:
            new_token_list.append(token)

    new_token_list = [x for x in new_token_list if x != '']

    # check if there are or then end if ...
    for el in new_token_list:
        if el in t.tree_sequence:
            exc_print('undefined token')
            return False

    # check quantity of brackets
    bracket_list = []
    for el in new_token_list:
        if el in t.brackets_open:
            bracket_list.append(el)
        elif el in t.brackets_close:
            if len(bracket_list) != 0:
                if el == ')' and bracket_list[len(bracket_list) - 1] == '(':
                    bracket_list.pop(len(bracket_list) - 1)
                elif el == ']' and bracket_list[len(bracket_list) - 1] == '[':
                    bracket_list.pop(len(bracket_list) - 1)
            else:
                bracket_list.append(el)

    if len(bracket_list) != 0:
        exc_print('error occurred in brackets')
        return False

    for i in new_token_list:
        if i == '=':
            exc_print('wrong condition statement')
            return False

    if len(token_list) == 0:
        exc_print('wrong condition statement')
        return False

    # check symbols between operators
    # --------------------------------------------------------------------------------------------
    global main_sequence
    main_sequence.append('(')
    main_sequence.extend(new_token_list)
    main_sequence.append(')')
    condition_token_list = new_token_list[:]
    # print_token_list(new_token_list)

    has_comparison_operator = False
    has_operation_operator = False
    for token in new_token_list:
        if token in t.condition_body:
            has_comparison_operator = True
        if token in t.operation_list:
            has_operation_operator = True

    if has_comparison_operator:
        if has_operation_operator:

            # quantity of compare symbols <> <= >...
            index = 0
            count = 0
            for i in range(len(new_token_list)):
                if new_token_list[i] in t.condition_body:
                    count += 1
                    if count == 2:
                        break
                    else:
                        index = i

            if count > 1:
                exc_print('wrong condition statement')
                return False

            if index == 0 or index == len(new_token_list) - 1 or index == len(new_token_list) + 1:
                exc_print('wrong condition statement')
                return False
            # go left
            new_ind = 1
            while (True):
                if new_token_list[index - new_ind] not in t.general_list:
                    if index - new_ind == 0:
                        break
                    else:
                        if new_token_list[index - new_ind - 1] in t.operation_list:
                            if index - new_ind - 1 == 0:
                                exc_print('wrong condition statement')
                                return False
                            else:
                                new_ind += 2
                        else:
                            exc_print('wrong condition statement')
                            return False
                else:
                    exc_print('wrong condition statement')
                    return False
            # go right
            new_ind = 1
            while (True):
                if new_token_list[index + new_ind] not in t.general_list:
                    if index + new_ind == len(new_token_list)-1:
                        break
                    else:
                        if new_token_list[index + new_ind + 1] in t.operation_list:
                            if index + new_ind + 1 == len(new_token_list)-1:
                                exc_print('wrong condition statement')
                                return False
                            else:
                                new_ind += 2
                        else:
                            exc_print('wrong condition statement')
                            return False
                else:
                    exc_print('wrong condition statement')
                    return False
        else:
            if len(new_token_list) > 3:
                exc_print('wrong condition statement')
                return False
            else:
                try:
                    if (new_token_list[0] not in t.condition_body) and (new_token_list[1] in t.condition_body) and (
                        new_token_list[2] not in t.condition_body):
                        return True
                    else:
                        exc_print('wrong condition statement')
                        return False
                except IndexError:
                    exc_print('wrong condition statement')
                    return False
    else:
        if has_operation_operator:
            exc_print('wrong condition statement')
            return False
        else:
            if len(new_token_list) > 1:
                exc_print('wrong condition statement')
                return False
            elif new_token_list[0] in t.general_list:
                exc_print('wrong condition statement')
                return False

    return True


def full_check_body(body_list):
    # print('Full_check body ', body_list)
    # CASE 3, 4 ELSE,  CASE 2, then

    if len(body_list) == 0:
        return True

    is_begin = False

    for el in body_list:
        indx = el.find('begin')
        if indx != -1:
            if indx == 0 and len(el) == 5:
                is_begin = True
            try:
                if indx == 0 and el[5] == ';':
                    exc_print('error occurred')
                    return False
            except IndexError:
                pass

    if is_begin:
        if body_list[0] == 'begin':
            # find end
            if body_list[-1] == 'end;':

                # check other words like end; end
                for el in t.tree_sequence:
                    if el in body_list[1:-1]:
                        exc_print('error in body. Tip (token)')
                        return False

                return True
            else:
                exc_print('error occurred with end')
                return False
        else:
            exc_print('error occurred with begin')
            return False
    else:
        # check other words like end; end
        for el in t.tree_sequence:
            if el in body_list:
                exc_print('error in body. Tip (token)')
                return False
    return True


def check_body(body_list, b_e=False, semi_colon=False):
    # print('Check body ', body_list)

    if b_e:
        if len(body_list) == 0:
            exc_print('error in begin-end block')
            return False

        if body_list[0] == 'begin':
            if semi_colon:
                if body_list[-1] == 'end;':
                    if len(body_list) > 2:
                        for el in body_list[1:-1]:
                            if el in t.general_list:
                                exc_print('error in statement')
                                return False

                    return True

                else:
                    exc_print('error in end. Tip (semi_colon)')
            else:
                if body_list[-1] == 'end':
                    if len(body_list) > 2:
                        for el in body_list[1:-1]:
                            if el in t.general_list:
                                exc_print('error in statement')
                                return False
                    return True

                else:
                    exc_print('error in end. Tip (semi_colon)')
        else:
            exc_print('error in begin-end block')
            return False

    return True


def choose_type(token_list):
    # print(token_list)
    if token_list[0] != 'if':
        exc_print('not if-then-else expression')
        return False

    tree.append('If_Node')
    main_sequence.append('if')

    then_index = -1
    if 'then' in token_list:
        then_index = token_list.index('then')

        # cut if-condition
        condition_list = token_list[1:then_index]
        if check_condition(condition_list):
            # print condition in tree
            tree.append('Boolean_Expression')
        else:
            return

        if 'else' in token_list:
            else_index = token_list.index('else')
            if then_index > else_index:
                exc_print('error in block then-else')
                return False

            # print 'then' in tree
            tree.append(['Then_Node'])

            if check_body(token_list[then_index + 1:else_index], b_e=True, semi_colon=False):
                # print then-body in tree
                tree[2].append('Then_Body')
            else:
                return False

            tree.append(['Else_Node'])

            if full_check_body(token_list[else_index + 1:]):
                # print else-body in tree
                tree[3].append('Else_Body')
                print()
            else:
                return False
        else:
            print('Warning : no else statement')
            tree.append(['Then_Node'])
            if full_check_body(token_list[then_index + 1:]):
                tree[2].append('Then_Body')
            else:
                return False
    else:
        exc_print('"then" block not found')
        return False


def print_tree(arg, tr):
    indent = arg
    if len(tr) > 0:
        for i in tr:
            if isinstance(i, list):
                print_tree(2, i)
            else:
                print('   ' * indent, i)
                indent += 1


def parse(text, b=False):
    global expression
    expression = text

    token_list = expression.split()
    temp = token_list[:]

    choose_type(token_list)

    if b:
        then_ind = temp.index('then')
        if then_ind != -1:
            for i in range(then_ind, len(token_list)):
                main_sequence.append(token_list[i])
        for el in temp:
            print(el, '   |   ', t.general_list.get(el, 'Variable'))

    print('\nTree:')
    print_tree(0, tree)


def exc_print(text):
    print('Exception : ', text)
