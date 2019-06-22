import  func


Z = set()
def see_dont_simplified_D(event):
    with open(r"Set D(don`t simplified).txt", "r") as f:
        p = f.read()
        print(p)
def see_simplified_D(event):
    with open(r"Set D(simplified).txt", "r") as f:
        p = f.read()
        print(p)
def see_calc_about_my_func_C(event):
    with open(r"Set Z(calc about my func).txt", "r") as f:
        p = f.read()
        print(p)

def step(event):
    global Z
    Z = func.A - func.C
    print('Z = X \ Y = ' , Z)
    with open(r"Set Z(calc about Python func).txt", "w") as f:
        f.write('Z = ' + str(Z))

def comparison_D_sets(event):
    f1 = open(r"Set D(don`t simplified).txt", "r")
    p1 = f1.read()
    f2 = open(r"Set D(simplified).txt", "r")
    p2 = f2.read()
    if p1 == p2:
        print("True")
    else:
        print("False")

def comparison_Z_sets(event):
    f1 = open(r"Set Z(calc about my func).txt", "r")
    p1 = f1.read()
    f2 = open(r"Set Z(calc about Python func).txt", "r")
    p2 = f2.read()
    if p1 == p2:
        print("True")
    else:
        print("False")

