import func

def see_set_X(event):
    print('Set X = ' , func.A)

def see_set_Y(event):
    print('Set Y = ' , func.C)


Z = set()

def step(event):
    global Z
    Z = func.A - func.C
    print('X \ Y = ' , Z)


def see_set_Z(event):
    print('Z =  ' , Z)

def save_set_Z(event):
    with open(r"Set Z(calc about my func).txt", "w") as f:
        f.write('Z = ' + str(Z))

