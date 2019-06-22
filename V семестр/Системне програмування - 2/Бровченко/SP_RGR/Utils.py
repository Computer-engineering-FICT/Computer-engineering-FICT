from re import search
from Stack import Stack

tokens = {":=": "Assign", "-": "Minus", "+": "Plus",
          "+=": "Assign_and_Plus",
          "-=": "Assign_and_Minus",
          "[": "Left bracket", "]": "Right Bracket",
          ";": "Semicolon", "=": "Equals",
          ">": "Greater", "<": "Lower",
          ">=": "Greater or equals", "<=": "Lower or equals",
          "*": "Multiply", "/": "Divide", "%": "Modular"}


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

