import res
from ArrayStructure import DataArray
from VarStructure import DataVar

expression = res.expression

memory_bank = []


def gen_exc(exc_text):
    print('Exception : ' + exc_text)


def save_empty_val(data_type, key):
    global memory_bank

    # check key
    for el in memory_bank:
        if el.key == key:
            print('already in memory')
            return False

    if len(key) == 0:
        gen_exc('empty name')
        return False

    if not key[0] in res.liters[0]:
        print('key[0] trouble, key = ', key)
        return False

    for i in range(len(key)):
        if not key[i] in res.liters[0] + res.numbers[0]:
            print('key in array')
            return False

    memory_bank.append(DataVar(data_type=data_type, key=key))
    return True


def save_empty_array(data_type, key, size):
    global memory_bank

    # check key
    for el in memory_bank:
        if el.key == key:
            print('already in memory')
            return False

    if len(key) == 0 or len(size) == 0:
        gen_exc('size or name is empty')
        return False

    if not key[0] in res.liters[0]:
        print('key[0] not in array, key = ', key)
        return False

    for i in range(len(key)):
        if not key[i] in res.liters[0] + res.numbers[0]:
            print('key in array')
            return False

    for i in range(len(size)):
        if not size[i] in res.numbers[0]:
            print('size array error')
            return False

    memory_bank.append(DataArray(data_type=data_type, key=key, size=size))
    return True


def save_var(data_type, key, value):
    global memory_bank
    # check key
    for el in memory_bank:
        if el.key == key:
            gen_exc('already in memory')
            return False

    if len(key) == 0 or len(str(value)) == 0:
        gen_exc('value or name is empty')
        return False

    if not key[0] in res.liters[0]:
        gen_exc('key[0] not in var, key = ', key)
        return False

    for i in range(len(key)):
        if not key[i] in res.liters[0] + res.numbers[0]:
            gen_exc('key in var')
            return False
    # depends on type
    if data_type == 'int' or data_type == 'short' or data_type == 'long':
        start = 1 if value[0] == '-' else 0
        for i in range(start, len(value)):
            if not value[i] in res.numbers[0]:
                gen_exc('value error')
                return False
    elif data_type == 'double' or data_type == 'float':
        start = 1 if value[0] == '-' else 0
        dot_ind = value.find('.')

        if dot_ind == -1 or dot_ind == start or dot_ind == len(value) - 1:
            gen_exc('error with dot')
            return False
        for i in range(start, dot_ind):
            if not value[i] in res.numbers[0]:
                gen_exc('value error')
                return False
        for i in range(dot_ind+1, len(value)):
            if not value[i] in res.numbers[0]:
                gen_exc('value error')
                return False
    elif data_type == 'char':
        if not (len(value) == 3 and value[0] == "'" and value[-1] == "'"):
            gen_exc('value error')
            return False

    memory_bank.append(DataVar(data_type=data_type, key=key, value=value))
    return True


def save_elem_array(el_ind, index, value):
    data_type = memory_bank[el_ind].data_type

    # depends on type
    if data_type == 'int' or data_type == 'short' or data_type == 'long':
        start = 1 if value[0] == '-' else 0
        for i in range(start, len(value)):
            if not value[i] in res.numbers[0]:
                gen_exc('value error')
                return False
    elif data_type == 'double' or data_type == 'float':
        start = 1 if value[0] == '-' else 0
        dot_ind = value.find('.')

        if dot_ind == -1 or dot_ind == start or dot_ind == len(value) - 1:
            gen_exc('error with dot')
            return False
        for i in range(start, dot_ind):
            if not value[i] in res.numbers[0]:
                gen_exc('value error')
                return False
        for i in range(dot_ind + 1, len(value)):
            if not value[i] in res.numbers[0]:
                gen_exc('value error')
                return False
    elif data_type == 'char':
        if not (len(value) == 3 and value[0] == "'" and value[-1] == "'"):
            gen_exc('value error')
            return False

    if index > memory_bank[el_ind].size:
        gen_exc('value error')
        return False

    memory_bank[el_ind].set_element(ind=index, value=value)

    return True


def parse_declaration(sequence):
    # print('parse declaration - ', sequence)

    for ind in reversed(range(len(sequence))):
        sequence = sequence[:]
        if sequence[ind][-1] == ',':
            sequence[ind] = sequence[ind][:-1]
            sequence.insert(ind + 1, ',')

    sequence = [x for x in sequence if x != '']

    type = sequence.pop(0)
    # print('sequence ', sequence)
    cur_ind = 0
    is_next = True if len(sequence) > 0 else False

    if not is_next:
        return False

    is_wrong = False

    while(is_next):
        if not sequence[cur_ind] in res.common_list:

            for el in res.undefined:
                if el in sequence[cur_ind]:
                    is_wrong = True
                    gen_exc('undefined symbol')
                    return False

            if is_wrong:
                is_next = False
                return False
            else:
                # check is array
                if '[' in sequence[cur_ind]:
                    bkt_st_ind = sequence[cur_ind].find('[')
                    if bkt_st_ind != 0 and bkt_st_ind < len(sequence[cur_ind]) - 2:
                        bkt_end_ind = sequence[cur_ind].find(']')

                        if bkt_end_ind == -1 or bkt_end_ind < bkt_st_ind or bkt_end_ind != len(sequence[cur_ind]) - 1:
                            gen_exc('error with brackets in array declaration')
                            is_wrong = True
                            return False
                        else:
                            #print(sequence[cur_ind])
                            if save_empty_array(type, sequence[cur_ind][:bkt_st_ind],
                                                sequence[cur_ind][bkt_st_ind + 1:bkt_end_ind]):
                                # check next element

                                if len(sequence)-1 == cur_ind:
                                    return True

                                if len(sequence) - 1 - cur_ind == 1:
                                    gen_exc("cannot exist next element")
                                    is_wrong = True
                                    return False
                                if len(sequence) - 1 - cur_ind >= 2:
                                    if sequence[cur_ind + 1] == ',' and sequence[cur_ind + 2] != ',':
                                        cur_ind += 2
                                        continue
                                    else:
                                        gen_exc('next or next+1 is wrong')
                                        is_wrong = True
                                        return False
                            else:
                                gen_exc('error occurred in storing array')
                                is_wrong = True
                                return False
                    else:
                        gen_exc('error with "["')
                        is_wrong = True
                        return False
                # check if is assignment
                elif '=' in sequence[cur_ind]:
                    eq_ind = sequence[cur_ind].find('=')

                    if eq_ind == 0 or eq_ind == len(sequence[cur_ind]) - 1:
                        gen_exc('error with "="')
                        is_wrong = True
                        return False

                    # check brackets if '=' is in expression
                    for i in sequence[cur_ind]:
                        if i == '[' or i == ']':
                            gen_exc("don't support square brackets in assignment")
                            is_wrong = True
                            return False
                    if not is_wrong:
                        if save_var(type, sequence[cur_ind][:eq_ind], sequence[cur_ind][eq_ind + 1:]):
                            # check next element

                            if len(sequence) - 1 == cur_ind:
                                return True

                            if len(sequence) - 1 - cur_ind == 1:
                                gen_exc('cannot exist next element')
                                is_wrong = True
                                return False
                            if len(sequence) - 1 - cur_ind >= 2:
                                if sequence[cur_ind + 1] == ',' and sequence[cur_ind + 2] != ',':
                                    cur_ind += 2
                                    continue
                                else:
                                    gen_exc('next or next+1 is wrong')
                                    is_wrong = True
                                    return False
                        else:
                            gen_exc('error occurred in storing var')
                            is_wrong = True
                            return False
                else:
                    # simple initializing without value and not array
                    if save_empty_val(type, sequence[cur_ind]):
                        # check next element

                        if len(sequence) - 1 == cur_ind:
                            return True

                        if len(sequence) - 1 - cur_ind == 1:
                            gen_exc('cannot exist next element')
                            is_wrong = True
                            return False
                        if len(sequence) - 1 - cur_ind >= 2:
                            if sequence[cur_ind + 1] == ',' and sequence[cur_ind + 2] != ',':
                                cur_ind += 2
                                continue
                            else:
                                gen_exc('next or next+1 is wrong')
                                is_wrong = True
                                return False
                    else:
                        gen_exc('error occurred in storing var without value')
                        is_wrong = True
                        return False
        else:
            gen_exc('wrong symbol in variable')
            return False

    if is_wrong:
        gen_exc('wrong symbol in variable')
        return False


def calc_operation(text, data_type):
    operands = []
    for i in range(len(text)):
        if text[i] in res.operation_list:
            operands.append(text[:i])
            operands.append(text[i])
            operands.append(text[i+1:])

    if (operands[0] is None) or (operands[2] is None):
        gen_exc('None object')
        return False

    index = ''

    if '[' in operands[0]:
        bkt_st_ind = operands[0].find('[')
        if bkt_st_ind != 0 and bkt_st_ind < len(operands[0]) - 2:
            bkt_end_ind = operands[0].find(']')

            if bkt_end_ind == -1 or bkt_end_ind < bkt_st_ind or bkt_end_ind != len(operands[0]) - 1:
                gen_exc('error with brackets in array declaration')
                return False
            else:
                name = operands[0][:bkt_st_ind]
                index = operands[0][bkt_st_ind+1:bkt_end_ind]
        else:
            gen_exc('error in statement')
            return False
    else:
        name = operands[0]

    is_in_memory = False
    ind = -1
    for i in range(len(memory_bank)):
        if memory_bank[i].key == name:
            ind = i
            is_in_memory = True

    if is_in_memory:

        # PASTE HERE
        if index != '':
            is_number = True
            for i in index:
                if i not in res.numbers:
                    is_number = False
                    break

                    # array index not number
            if not is_number:
                try:
                    for el in memory_bank:
                        if el.key == index:
                            index = el.value
                except Exception:
                    gen_exc('wrong array_index')
                    return False

            is_number = True
            for i in index:
                if i not in res.numbers[0]:
                    gen_exc('wrong array_index')
                    return False

        prost = True
        try:
            operands[0] = (memory_bank[ind].get_value(int(index)))
            prost = False
        except Exception:
            if prost:
                operands[0] = (memory_bank[ind].get_value())
    #print('Operands, after - ', operands)

    if operands[0] is None:
        gen_exc('not initialized')
        return False

    ind = ''
    name = ''

    if '[' in operands[2]:
        bkt_st_ind = operands[2].find('[')
        if bkt_st_ind != 0 and bkt_st_ind < len(operands[2]) - 2:
            bkt_end_ind = operands[2].find(']')

            if bkt_end_ind == -1 or bkt_end_ind < bkt_st_ind or bkt_end_ind != len(operands[2]) - 1:
                gen_exc('error with brackets in array declaration')
                return False
            else:
                name = operands[2][:bkt_st_ind]
                index = operands[2][bkt_st_ind+1:bkt_end_ind]
        else:
            gen_exc('error in statement')
            return False
    else:
        name = operands[2]

    is_in_memory = False
    ind = -1
    for i in range(len(memory_bank)):
        if memory_bank[i].key == name:
            ind = i
            is_in_memory = True

    if is_in_memory:

        # PASTE HERE 2
        if index != '':
            is_number = True
            for i in index:
                if i not in res.numbers:
                    is_number = False
                    break

                    # array index not number
            if not is_number :
                try:
                    for el in memory_bank:
                        if el.key == index:
                            index = el.value
                except Exception:
                    gen_exc('wrong array_index')
                    return False

            is_number = True
            for i in index:
                if i not in res.numbers[0]:
                    gen_exc('wrong array_index')
                    return False


        prost = True
        try:
            operands[2] = (memory_bank[ind].get_value(int(index)))
            prost = False
        except Exception:
            if prost:
              operands[2] = (memory_bank[ind].get_value())

    if operands[2] is None:
        gen_exc('not initialized')
        return False

    #print('Operands, after - ', operands)
    #print('data_type should be - ', data_type)

    if data_type in ['short', 'int', 'long']:
        start = 1 if operands[0][0] == '-' else 0
        #check first operand
        for i in range(start, len(operands[0])):
            if operands[0][i] not in res.numbers[0]:
                gen_exc('error occurred. Tip(wrong types)')
                return False
        #second
        start = 1 if operands[2][0] == '-' else 0
        # check first operand
        for i in range(start, len(operands[2])):
            if operands[2][i] not in res.numbers[2]:
                gen_exc('error occurred. Tip(wrong types)')
                return False

        if operands[1] == '*':
            return int(operands[0]) * int(operands[2])
        elif operands[1] == '/':
            int(operands[0]) / int(operands[2])
        elif operands[1] == '+':
            int(operands[0]) + int(operands[2])
        elif operands[1] == '-':
            int(operands[0]) - int(operands[2])

    elif data_type in ['float', 'double']:
        start = 1 if operands[0][0] == '-' else 0
        dot_ind = operands[0].find('.')

        if dot_ind == -1 or dot_ind == start or dot_ind == len(operands[0]) - 1:
            gen_exc('error with dot')
            return False
        for i in range(start, dot_ind):
            if not operands[0][i] in res.numbers[0]:
                gen_exc('value error')
                return False
        for i in range(dot_ind + 1, len(operands[0])):
            if not operands[0][i] in res.numbers[0]:
                gen_exc('value error')
                return False

        start = 1 if operands[2][0] == '-' else 0
        dot_ind = operands[0].find('.')

        if dot_ind == -1 or dot_ind == start or dot_ind == len(operands[2]) - 1:
            gen_exc('error with dot')
            return False
        for i in range(start, dot_ind):
            if not operands[2][i] in res.numbers[0]:
                gen_exc('value error')
                return False
        for i in range(dot_ind + 1, len(operands[2])):
            if not operands[2][i] in res.numbers[0]:
                gen_exc('value error')
                return False

        if operands[1] == '*':
            return float(operands[0]) * float(operands[2])
        elif operands[1] == '/':
            return float(operands[0]) / float(operands[2])
        elif operands[1] == '+':
            return float(operands[0]) + float(operands[2])
        elif operands[1] == '-':
            return float(operands[0]) - float(operands[2])

    #print('Operands = ', operands)
    pass

def parseOperation(token):
    text = ''
    for el in token:
        text += el

    #print('PARSE OPERATION - ', text)

    eq_ind = text.find('=')
    if eq_ind == -1 or eq_ind == 0 or eq_ind == len(text)-1:
        gen_exc('error with "=" in operation')
        return False

    if '?' in text[eq_ind+1:] and ':' in text[eq_ind+1:]:

        real_key = ''
        real_index = -1
        real_position = -1

        # check var in memory
        if '[' in text[:eq_ind]:
            end = -1
            if ']' in text[:eq_ind]:
                for i in range(len(text[:eq_ind])):
                    if text[i] == ']':
                        end = i
                        break
            else:
                gen_exc('no "]"')
                return False
            real_key = text[:end]
            real_index = text[text[0:eq_ind].find('['):text[0:eq_ind].find(']')]

        else:
            real_key = text[:eq_ind]

        index_in_memory = -1
        for i in range(len(memory_bank)):
            if memory_bank[i].key == real_key:
                index_in_memory = i

        if index_in_memory == -1:
            gen_exc('mot in memory')
            return False

        #print('Real key - ', real_key, '  Real ind - ', real_index)

        # parse ternary operator
        quest_ind = text.find('?')
        colon_ind = text.find(':')

        if (quest_ind < eq_ind) or (quest_ind-eq_ind == 1) or (quest_ind>colon_ind) or (colon_ind-quest_ind==1) or (colon_ind == len(text)-1):
            gen_exc('error in ternary statement')
            return False

        condition = text[eq_ind+1:quest_ind]
        if_true = text[quest_ind+1:colon_ind]
        if_false = text[colon_ind+1:]

        if len(condition) == 0 or len(if_true) == 0 or len(if_false) == 0:
            gen_exc('empty condition for ternary operator')
            return False

        # check condition
        #print('Condition - ', condition)
        el_ind = -1
        for i in range(len(memory_bank)):
            if memory_bank[i].key == condition:
                el_ind = i

        result = True

        if(el_ind != -1):
            # is in memory
            if memory_bank[el_ind].data_type == 'int' or memory_bank[el_ind].data_type == 'short' or memory_bank[el_ind].data_type == 'long':
                if memory_bank[el_ind].value is None:
                    gen_exc('Null Value')
                    return False
                elif memory_bank[el_ind].value == '0':
                    result = False
                else:
                    result = True
            elif memory_bank[el_ind].data_type == 'float' or memory_bank[el_ind].data_type == 'double':
                if memory_bank[el_ind].value is None:
                    gen_exc('Null Value')
                    return False
                elif memory_bank[el_ind].value != '0.0':
                    result = True
                else:
                    result = False
        else:
            if condition == '0' or condition == '0.0' or condition == 'false':
                result = False
            else:
                if condition == 'true':
                    result = True
                else:
                    for i in condition:
                        if not i in res.numbers[0]:
                            gen_exc('undefined condition')
                            return False

        #print('Ternary result = ', result)

        tex = if_true if result else if_false
        has_operation = False
        for oper in res.operation_list:
            if oper in tex:
                has_operation = True
                break

        if has_operation:
            calc_result = calc_operation(tex, memory_bank[index_in_memory].data_type)
            temp_obj = memory_bank.pop(index_in_memory)
            save_var(data_type = temp_obj.data_type, key=temp_obj.key, value=str(calc_result))
        else:
            temp_ind = -1
            for i in range(len(memory_bank)):
                if memory_bank[i].key == tex:
                    temp_ind = i

            name =''
            typ = ''
            if index_in_memory != -1:
                typ = memory_bank[index_in_memory].data_type
                name = memory_bank[index_in_memory].key

            if temp_ind == -1:
                # is not in list
                memory_bank.pop(index_in_memory)
                save_var(data_type=typ, key=name, value=tex)
                pass
            else:
                memory_bank.pop(index_in_memory)
                save_var(data_type=typ, key=name, value=str(memory_bank[temp_ind-1].value))

    else:
        # parse simple operation
        #very dangerous
        key = text[0]
        #print('Key = ', key)
        data_type = ''
        el_ind = -1
        for i in range(len(memory_bank)):
            if memory_bank[i].key == key:
                el_ind = i

        if el_ind == -1:
            gen_exc('not in memory')
            return False
        else:
            data_type = memory_bank[el_ind].data_type

        is_operation = False
        operation = text[eq_ind + 1:]
        for op in res.operation_list:
            if op in operation:
                is_operation = True
                break
        if is_operation:
            gen_exc('unsupported')
            return False
        else:
            if '[' in text[0:eq_ind]:
                bkt_st_ind = text[0:eq_ind].find('[')
                if bkt_st_ind != 0 and bkt_st_ind < len(text[0:eq_ind]) - 2:
                    bkt_end_ind = text[0:eq_ind].find(']')

                    if bkt_end_ind == -1 or bkt_end_ind < bkt_st_ind or bkt_end_ind != len(text[0:eq_ind])-1:
                        gen_exc('error with brackets in array declaration')
                        return False
                    else:
                        if save_elem_array(el_ind=el_ind, index=text[bkt_st_ind+1:bkt_end_ind], value=text[eq_ind+1:]):
                           # print('okay')
                            pass
                        else:
                            gen_exc('error occurred in saving')
                            return False
                else:
                    pass
            else:
                memory_bank.pop(el_ind)
                save_var(data_type=data_type, key=key, value=text[eq_ind+1:])

    #print('parse operation - ', text)
    return True


def recognize_operation(token):
    # print('Token - ', token)

    elements_list = token.split(' ')
    elements_list = [el for el in elements_list if el != '' and el != ' ']

    if len(elements_list) > 0:
        # if first element is data type, else otherwise
        if elements_list[0] in res.data_type:
            return parse_declaration(elements_list)
        else:
            return parseOperation(elements_list)


def parse(expression):
    token_list = expression.split(';')
    token_list = [token for token in token_list if token != '']

    for token in token_list:
        if not recognize_operation(token):
            break

    print('\nMemory bank:')
    for el in memory_bank:
        print(el)


def main():
    print(expression)
    parse(expression)

    pass


if __name__ == '__main__':
    main()
