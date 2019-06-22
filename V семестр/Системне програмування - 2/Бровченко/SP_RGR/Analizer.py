from re import search
from Stack import Stack
from Utils import is_var, brackets_checker, is_num, tokens
from copy import deepcopy


class Var(object):
    def __init__(self, var_type, name, value=None):
        self.var_type = var_type
        self.name = name
        self.value = value

    def __repr__(self):
        return "{0} {1} ({2})".format(self.var_type, self.name, self.value)

    def __str__(self):
        return "{0} {1} ({2})".format(self.var_type, self.name, self.value)


class Array(object):
    def __init__(self, var_type, name, length=0, values=[]):
        self.var_type = var_type
        self.name = name
        self.length = length
        self.values = values[:]

    def __repr__(self):
        return "{0} {1} ({2})".format(self.var_type, self.name, self.values)

    def __str__(self):
        return "{0} {1} ({2})".format(self.var_type, self.name, self.values)


def is_valid_var_name(s):
    if search(r'\W[^,]]', s):
    #    print(s, "symb")
        return False

    if search(r'[^A-Za-z]', s[0]):
    #    print(s, "first")
        return False

    return True


#def is_num(s):
#    return not search(r'[^0-9]*', s)


def count_value(expr, type):

    #print("infix to postfix:\n", infix_to_postfix(expr))
    value = postfix_eval(infix_to_postfix(expr))

    if type == "float":
        value = float(value)
    elif type == "int":
        value_try = float(value)
        value = int(value)
        if value_try != value:
            print('Error: Type Error '+expr)
            raise TypeError
    #print("res:\n", value)
    return value


def infix_to_postfix(infixexpr):
    prec = {}
    prec["*"] = 3
    prec["/"] = 3
    prec["+"] = 2
    prec["-"] = 2
    prec["("] = 1
    op_stack = Stack()
    postfix_list = []
    token_list = infixexpr.split()

    for token in token_list:
        if search(r"[A-Za-z0-9]", token):
            postfix_list.append(token)
        elif token == '(':
            op_stack.push(token)
        elif token == ')':
            top_token = op_stack.pop()
            while top_token != '(':
                postfix_list.append(top_token)
                top_token = op_stack.pop()
        else:
            while (not op_stack.isEmpty()) and \
                    (prec[op_stack.peek()] >= prec[token]):
                postfix_list.append(op_stack.pop())
            op_stack.push(token)

    while not op_stack.isEmpty():
        postfix_list.append(op_stack.pop())
    return " ".join(postfix_list)


def postfix_eval(postfix_expr):
    operand_stack = Stack()
    token_list = postfix_expr.split()

    for token in token_list:
        if bool(search('[0-9]+', token)) or bool(search('[0-9]+[.]?[0-9]+', token)):
            operand_stack.push(float(token))
        elif token in "+-*/":
            operand2 = operand_stack.pop()
            operand1 = operand_stack.pop()
            result = do_math(token, operand1, operand2)
            operand_stack.push(result)
        else:
            if token.find("[") != -1:
                arr_name = token[:token.index("[")]
                ind = token[token.find("[") + 1:token.find(']')]
                if ind not in var_dict.keys():
                    print('Undefind ' + ind)
                    raise IndexError
                if ind in var_dict.keys():
                    if var_dict[ind].value == None:
                        print('Undefind ' + ind)
                        raise IndexError
                    ind = var_dict[ind].value
                try:
                    ind = int(ind)
                except:
                    print('Error: IndexError\n' + token)
                    raise IndexError
                if ind >= var_dict[arr_name].length:
                    print("Error: Index out of bounds")
                operand_stack.push(float(var_dict[arr_name].values[ind]))
            else:
                operand_stack.push(float(var_dict[token].value))
    return operand_stack.pop()


def check_syntax(input_string):
    input_list = input_string.split(" ")
    has_errors = False

    for s in input_list:
        if s not in tokens.keys() and not search("[A-Za-z0-9]", s):
            print("Error: Unexpected '%s'" % s)
            has_errors = True

    for i in range(len(input_list)):
        if input_list[i] == ":=":
            if not is_var(input_list[i - 1]):
                print("Error: Incorrect usage of 'assign' operator")
                has_errors = True

        if input_list[i] in ["+", "-", "/", "*", ">", "<", ">=", "<="]:
            if not is_var(input_list[i - 1]) and not is_num(input_list[i - 1]):
                print("Error: Incorrect usage of '%s' operator" % input_list[i])
                has_errors = True
            elif not is_num(input_list[i + 1]) and not is_var(input_list[i + 1]):
                print("Error: Incorrect usage of '%s' operator" % input_list[i])
                has_errors = True

            # if not search(";", input_list[i + 1]):
            #     print("Error: Semicolon expected")
            #     has_errors = True

        """if input_list[i] == "+":
            if not is_var(input_list[i - 1]) and not is_num(input_list[i - 1]):
                print("Error: Incorrect usage of '+' operator")
                has_errors = True
            elif not is_num(input_list[i + 1]) and not is_var(input_list[i + 1]):
                print("Error: Incorrect usage of '+' operator")
                has_errors = True

            if not search(";", input_list[i + 1]):
                print("Error: Semicolon expected")
                has_errors = True
        """
        if search("\[", input_list[i]):
            for j in range(len(input_list[i])):
                if input_list[i][j] == "[" and (not is_var(input_list[i][j - 1]) or (not is_var(input_list[i][j + 1])\
                                                and not is_num(input_list[i][j + 1]))):
                    print("Error: Incorrect usage of array indexing")
                    has_errors = True

    if not brackets_checker(input_string):
        print("Error: Unbalanced brackets")
        has_errors = True

    return has_errors


def do_math(op, op1, op2):
    if op == "*":
        return op1 * op2
    elif op == "/":
        return op1 / op2
    elif op == "+":
        return op1 + op2
    else:
        return op1 - op2


def to_asm(inp: str):
    global var_dict
    if not check_syntax(inp):
        try:
            inp = inp[:-1]
            var_dict = dict()
            types = ["float", "int", "char"]
            inp_arr = inp.split("; ")
            #print(inp_arr)

            file = open("assm.txt", "w+")
            counter = 0

            for line in inp_arr:
                line_tokens = line.split(" ")
                line_tokens1 = line.split(" ")
                if "+=" in line_tokens:
                    line_tokens = [line_tokens1[0], ":=", line_tokens1[0], "+", line_tokens1[2]]
                    line = line_tokens1[0] + " := " + line_tokens1[0] + " + " + line_tokens1[2]
                if "-=" in line_tokens:
                    line_tokens = [line_tokens1[0], ":=", line_tokens1[0], "-", line_tokens1[2]]
                    line = line_tokens1[0] + " := " + line_tokens1[0] + " - " + line_tokens1[2]
                if line_tokens[0] in types and line.find(":=") == -1:
                    for i in range(1, len(line_tokens)):
                        if is_valid_var_name(line_tokens[i]):
                            if line_tokens[i][len(line_tokens[i]) - 1] == ",":
                                name = line_tokens[i][:-1]
                            else:
                                name = line_tokens[i]
                                if name in var_dict.keys():
                                    print('Error: Double defind ' + name)
                                    raise IndexError
                            var_dict[name] = Var(line_tokens[0], name)
                        elif line_tokens[i].find("[") != -1:
                            if is_valid_var_name(line_tokens[i][:line_tokens[i].index("[")]):
                                if line_tokens[i][len(line_tokens[i]) - 1] == ",":
                                    name = line_tokens[i][:line_tokens[i].index("[") + 1]
                                else:
                                    name = line_tokens[i][:line_tokens[i].index("[")]
                                #if is_num(str(line_tokens[i].index("[") + 1)):
                                length = line_tokens[i][line_tokens[i].index("[") + 1]
                                var_dict[name] = Array(line_tokens[0], name, int(length))
                                var_dict[name].values = [None for i in range(int(length))]

                elif line_tokens[0] in types and line.find(":=") != -1:
                    var_dict[line_tokens[1]] = Var(line_tokens[0], line_tokens[1], count_value(line[line.index(":=") + 3:], line_tokens[0]))
                elif line_tokens[0] not in types and line.find(":=") != -1and line_tokens[0] in var_dict.keys():
                    var_dict[line_tokens[0]].value = count_value(line[line.index(":=") + 3:], var_dict[line_tokens[0]].var_type)
                    if '+' in line:
                        file.writelines('; {} \n'.format(line))
                        file.writelines('mov eax, {}\n'.format(line_tokens[2]))
                        if line_tokens[-1][line_tokens[-1].index('[')+1].isdigit():
                            file.writelines('add eax, dword ptr[{}+{}]\n'.format(line_tokens[-1][0], line_tokens[-1][
                                line_tokens[-1].index('[')+1]))
                            file.writelines('mov {}, eax\n'.format(line_tokens[0]))
                        else:
                            arg2 = str(var_dict[line_tokens[-1].replace(';', '')[-2]]).split(' ')[-1][-2]
                            file.writelines('add eax, dword ptr[{}+{}]\n'.format(line_tokens[-1][0], str(int(arg2)*4)))
                            file.writelines('mov {}, eax\n'.format(line_tokens[0]))

                    elif '-' in line:
                        file.writelines('; {} \n'.format(line))
                        file.writelines('mov eax, {}\n'.format(line_tokens[2]))
                        if line_tokens[-1][line_tokens[-1].index('[')+1].isdigit():
                            file.writelines('add eax, dword ptr[{}+{}]\n'.format(line_tokens[-1][0], line_tokens[-1][
                                line_tokens[-1].index('[')+1]))
                            file.writelines('mov {}, eax\n'.format(line_tokens[0]))
                        else:
                            arg2 = str(var_dict[line_tokens[-1].replace(';', '')[-2]]).split(' ')[-1][-2]
                            file.writelines('sub eax, dword ptr[{}+{}]\n'.format(line_tokens[-1][0], str(int(arg2)*4)))
                            file.writelines('mov {}, eax\n'.format(line_tokens[0]))

                    else:
                        file.writelines('; {} \n'.format(line))
                        file.writelines('mov eax, {}\n'.format(line_tokens[-1]))
                        file.writelines('mov {}, eax\n'.format(line_tokens[0]))

                elif line_tokens[0].find("[") and line_tokens[0][:line_tokens[0].find('[')] in var_dict.keys():
                    arr_name = line_tokens[0][:line_tokens[0].index("[")]
                    ind = line_tokens[0][line_tokens[0].index("[") + 1]
                    if search('[0-9]+[.][0-9]+', ind):
                        print('Error: Index must be int')
                        raise IndexError
                    if ind in var_dict.keys():
                        ind = var_dict[ind].value
                    ind = int(ind)
                    if ind >= var_dict[arr_name].length:
                        print("Error: Index out of bounds")
                        raise IndexError
                    var_dict[arr_name].values[ind] = count_value(line[line.index(":=") + 3:], var_dict[arr_name].var_type)
                    file.writelines('; {} \n'.format(line))
                    file.writelines('mov eax, {}\n'.format(line_tokens[-1]))
                    file.writelines('mov dword ptr[{}+{}], eax\n'.format(line_tokens[0][0], str(4*counter)))
                    counter += 1

            print('file generated successfully')
            file.close()
            return var_dict
        except (TypeError, IndexError, ValueError):
            print("Error")
            print(line)
        except KeyError:
            print(line)
            print('Error')
    else:
        print("Syntax error")


if __name__ == '__main__':

    inp = "float b, a[3];" \
          " int n;" \
          " a[0] := 9;" \
          " a[1] := -1;" \
          " a[2] := 2;"\
          " b := 3;" \
          " n := 1;" \
          " b += a[n];" \

    res = to_asm(inp)


