from Lab5_SP2.Stack import Stack
import Lab5_SP2.Utils as ut
from termcolor import colored


def parse_to_tree(string):
    string += " "
    output = ""
    i = 0
    tabs = ""
    st = Stack()
    st1 = Stack()
    while len(string) > 0:

        root = string[:string.index(" ")]
        if root == "for":
            root = string[:string.index("do") + 2]
            string = string[len(root) + 1:]
            output += "\t" * i + "for_loop statement\n"
            i += 1
        elif root == "if":
            root = string[:string.index("then") + 4]
            string = string[len(root) + 1:]
            st1.push(i)
            output += "\t" * i + "if_node\n" + "\t" * i +" bool_expression\n" + "\t" * i + "  then_node\n"
            i += 1
        elif root == "begin":
            string = string[len(root) + 1:]
            st.push(i)
            #output += "\t" * i + "begin_node" + "\n"
        elif root == "end;":
            string = string[len(root) + 1:]

            #output += "\t" * st.pop() + "end_node" + "\n"
        elif root == "else":
            string = string[len(root) + 1:]
            i = st1.pop()
            output += "\t" * i + "else_node" + "\n"
            i += 1
        else:
            root = string[:string.index("end;")]
            output += "\t" * i + "expression" + "\n"
            string = string[len(root):]
            i += 1

    print(output)
    # print(string)


def check_syntax(string):
    check = True
    tokens = ["for", "to", "do", "begin", "if", "then", "else",
              "begin", "end", ":=", ">", "<", ">=", "<=", "=",
              "(", ")", ";", "[", "]"]
    inp = string.split(" ")

    if not ut.begin_end_checker(inp):
        print(colored('Exception: wrong number of "begin" and "end" words', 'red'))
        return False

    if not ut.brackets_checker(string):
        print(colored('Exception: wrong number of brackets', 'red'))
        return False

    if not ut.for_loop_checker(inp):
        print(colored('Exception: wrong loop', 'red'))
        return False

    if not ut.if_else_checker(inp):
        print(colored('Exception: if-then-else checker', 'red'))
        return False

    if not ut.check_semicol(inp):
        print(colored('Exception: missing ";"', 'red'))
        return False

    return True


if __name__ == '__main__':
    input_str = "if (a > b) then begin for i := 1 to do k:=5; end;"

    print(colored(input_str, 'green'))

    if check_syntax(input_str):
        print("Syntax is correct")
        print("Tree:")
        parse_to_tree(input_str)
        print("Table:")
        ut.print_table(input_str.split(" "))
    else:
        print("Syntax error")
