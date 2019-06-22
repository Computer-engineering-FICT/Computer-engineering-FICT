from random import randint


def is_int(x):
    if x[0] == "-":
        return x[1:].isdigit()
    else:
        return x.isdigit()

m = input("Введіть розмір матриці A(m×m), m > 1\nm = ")
down_num, up_num = input("Введіть мінімальне ціле значення числа у матриці: "), input("та максимальне ціле значення: ")

if m.isdigit() and int(m) > 1 and is_int(down_num) and is_int(up_num):
    m = int(m)
    s = ("{:"+str(max(len(down_num), len(up_num))+3)+"}")*m
    down_num, up_num = int(down_num), int(up_num)
    if up_num > down_num:
        A = [[randint(down_num, up_num) for i in range(m)] for k in range(m)]
        print("Згенерована матриця:")
        for i in A:
            print(s.format(*i))

        B = zip(*(sorted(A[i], reverse=True) for i in range(m)))
        print("Сформована нова матриця:")
        for i in B:
            print(s.format(*i))
    else:
        print("Максимальне значення повине бути більше мінімального")
else:
    print("m повина бути цілим числом більше 1, а числа - цілими")
