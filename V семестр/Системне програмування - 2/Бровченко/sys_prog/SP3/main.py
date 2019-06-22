from SP3.clang import c_lexem

code_example = "int main (void) {float b, a[13]; int n;}"
#Enter example of code  using console

#code_example = input("Enter example of code: \n")
tokens = c_lexem(code_example)

for i in tokens:
    print( "| " + i[0] + " " * (7 - len(i[0])) + "| " + i[1] + " " *(20 - len(i[1])) + " |")
