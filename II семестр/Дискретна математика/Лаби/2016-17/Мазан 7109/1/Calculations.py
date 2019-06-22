def calculate_simplified(set_A, set_B, set_C, Universal):
    return set_B.copy().inversion(Universal.copy()).intersection(set_A.copy()).union(set_C.copy())

def calculate_Z(set_B,set_C):
    set_X = set_C.copy()
    set_Y = set_B.copy()
    return set_X.difference(set_Y)

def calculate_full(set_A, set_B, set_C, Universal):
    return set_A.copy().intersection(set_B.copy().inversion(Universal.copy()).union(set_C.copy())).union(set_A.copy().inversion(Universal.copy()).intersection(set_C.copy()))


#Покрокове виконання спрощеного

def operation_short1(set_A, set_B, set_C, Universal):
    return ["¬B",set_B.inversion(Universal)]

def operation_short2(set_A, set_B, set_C, Universal):
    return ["(¬B)∩A", operation_short1(set_A, set_B, set_C, Universal)[1].intersection(set_A)]

def operation_short3(set_A, set_B, set_C, Universal):
    return ["D = [(¬B)∩A]∪C",operation_short2(set_A, set_B, set_C, Universal)[1].union(set_C)]



#Покрокове виконання довгого

def operation_long1(set_A, set_B,set_C, Universal):
    return ["¬B",set_B.copy().inversion(Universal.copy())]

def operation_long2(set_A, set_B,set_C, Universal):
    return ["¬A", set_A.copy().inversion(Universal.copy())]

def operation_long3(set_A, set_B,set_C, Universal):
    return ["¬B∪C", operation_long1(set_A.copy(), set_B.copy(),set_C.copy(), Universal.copy())[1].union(set_C.copy())]

def operation_long4(set_A, set_B,set_C, Universal):
    return ["(¬A)∩C", operation_long2(set_A.copy(), set_B.copy(),set_C.copy(), Universal.copy())[1].intersection(set_C.copy())]

def operation_long5(set_A, set_B, set_C, Universal):
    return ["A∩(¬B∪C)", set_A.copy().intersection(operation_long3(set_A.copy(), set_B.copy(),set_C.copy(), Universal.copy())[1])]

def operation_long6(set_A, set_B, set_C, Universal):
    return ["D = [A∩(¬B∪C)]∪[(¬A)∩C]", operation_long5(set_A.copy(), set_B.copy(), set_C.copy(), Universal.copy())[1].union(operation_long4(set_A.copy(), set_B.copy(),set_C.copy(), Universal.copy())[1])]
