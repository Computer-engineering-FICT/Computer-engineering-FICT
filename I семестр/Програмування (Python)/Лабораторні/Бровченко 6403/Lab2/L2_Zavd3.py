A = float(input('A = '))
N = int(input('Степінь числа А = '))
a = A
if N <= 0:
        print('Степінь числа має бути натуральним числом. Перевірте введені дані.')
deg = 1
while deg <= N:
    print(A)
    A = A*a
    deg += 1
