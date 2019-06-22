from re import search
from Lab5_SP2.Stack import Stack
from termcolor import colored

tokens = {":=": "Assign", "-": "Minus", "+": "Plus",
          "[": "Left bracket", "]": "Right Bracket",
          ";": "Semicolon", "=": "Equals",
          ">": "Greater", "<": "Lower",
          ">=": "Greater or equals", "<=": "Lower or equals",
          "*": "Multiply", "/": "Divide", "%": "Modular",
          "for": "For", "to": "To", "do": "Do", "begin": "Begin",
          "end;": "End"}


def begin_end_checker(sss):
    st = Stack()
    balanced = True
    for t in sss:
        if t == "begin":
            st.push(t)
        elif t == "end;":
            if st.isEmpty():
                balanced = False
            else:
                st.pop()
        elif t == "end":
            print(colored('Exception: forget semicolon after "end"', 'red'))
            return False
    return balanced and st.isEmpty()


def for_loop_checker(inp):
    try:
        for_ind = inp.index("for")
    except ValueError:
        return True
    try:
        try:
            do_ind = inp.index("do;")
        except: do_ind = inp.index("do")
    except ValueError:
        print(colored('Exception: missing "do"', 'red'))
        return False

    try:
        to_ind = inp.index("to")
    except ValueError:
        print(colored('Exception: missing "to"', 'red'))
        return False



    if do_ind + 1 == "end;" or do_ind + 1 == "end":
        print(colored('Exception: wrong statement after "do"', 'red'))

    if for_ind > to_ind \
            or to_ind > do_ind \
            or to_ind == for_ind + 1 \
            or do_ind == to_ind + 1:
        return False

    if not is_var(inp[for_ind + 1]):
        return False

    if inp[for_ind + 2] != ":=":
        print(colored('Exception: wrong statement after "for"', 'red'))
        return False

    if not is_var(inp[for_ind + 3]) \
            and not is_num(inp[for_ind + 3]):
        return False

    if not is_var(inp[to_ind + 1]) \
            and not is_num(inp[to_ind + 1]):
        print(colored('Exception: wrong statement after "to"', 'red'))
        return False
    return True


def if_else_checker(inp):
    try:
        if_ind = inp.index("if")
        then_ind = inp.index("then")

    except ValueError:
        return False

    try:
        else_ind = inp.index("else")
    except ValueError:
        else_ind = 1000

    if if_ind > then_ind or else_ind < then_ind or then_ind == if_ind + 1:
        return False

    try:
        if inp[if_ind + 1][0] != "(" \
                or inp[then_ind - 1][-1] != ")":
            print(colored('Exception: statement after "if" expected', 'red'))
            return False
    except: return False

    if not is_var(inp[if_ind + 1][1:]) \
            and not is_num(inp[if_ind + 1][1:]) \
            or not is_var(inp[then_ind - 1][:-1]) \
                    and not is_num(inp[then_ind - 1][:-1]):
        print(colored('Exception: wrong statement after "if"', 'red'))
        return False

    if inp[then_ind + 1] != "begin" \
            and not is_var(inp[then_ind + 1]) \
            or else_ind != 1000 \
            and inp[else_ind + 1] != "begin" \
            and not is_var(inp[else_ind + 1]):
        return False

    return True


def check_semicol(inp_list):
    for i in range(len(inp_list)):
        if inp_list[i] == "end;" or inp_list[i] == "else":
            if inp_list[i - 1] != "else" and not search(";", inp_list[i - 1]) and inp_list[i-1] != "begin":
                return False
    return True


def is_var(ss):
    res = False
    if len(ss) == 0:
        res = False
    elif search("[A-Za-z]", ss[0]):
        res = True
    elif not search("[A-Za-z0-9_]*", ss[1:]):
        res = False
    return res


def is_num(ss):
    res = False
    if len(ss) == 0:
        res = False
    elif search("[0-9]", ss[0]) and not search("[A-Za-z]", ss):
        res = True
    return res


def brackets_checker(sss):
    st = Stack()
    balanced = True
    index = 0
    while index < len(sss) and balanced:
        symbol = sss[index]
        if symbol == "[":
            st.push(symbol)
        elif symbol == "]":
            if st.isEmpty():
                balanced = False
            else:
                st.pop()
        index += 1
    return balanced and st.isEmpty()


def print_table(inp_list):
    for string in inp_list:
        if string[0] == "(":
            string = string[1:]
            print("( is a token '('")
        if string[-1] == ")":
            string = string[:-1]
            print(") is a token ')'")
        if string[0] == "(" and string[-1] == ")":
            string = string[1:-1]
            print("( is a token '('")
            print(") is a token ')'")
        if string[-1] == ";":
            string = string[:-1]
            print("; is a token 'Semicolon'")
        if string in tokens:
            print(string + " is a token '%s'" % tokens[string])
        else:
            has_tokens = False
            has_numbers = False
            for c in string:
                if c in tokens:
                    has_tokens = True
                if search(r"[0-9]", c):
                    has_numbers = True
            if has_tokens:
                for c in string:
                    if c in tokens:
                        print(c + " is a token '%s'" % tokens[c])
                    elif search(r"[A-Za-z]", c):
                        print(c + " is a var '%s'" % c)
                    elif search(r"[0-9]", c):
                        print(c + " is a const '%s'" % c)
            elif has_numbers:
                print(string + " is a const '%s'" % string)
            else:
                print(string + " is a var '%s'" % string)
