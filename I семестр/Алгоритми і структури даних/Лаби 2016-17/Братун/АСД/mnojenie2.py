from random import randint

a = []
b = []
s = []

# Введення розміру
while 1:
    size = input('Enter size - ')
    if size.isdigit():
        size = int(size)
        break


for i in range(size):
    a.append([])
    b.append([])
    for j in range(size):
        a[i].append(randint(1, 3))
        b[i].append(randint(1, 3))
# Заповнення матриць випадково

# for k in range(size*size):
#     cls()
#     for i in range(size):
#         for j in range(size):


# Виводимо a
for i in range(size):
    for j in range(size):
        print('{0:^5}'.format(a[i][j]), end='')
    print('\n')
print('\n' * 2)

# Виводимо b
for i in range(size):
    for j in range(size):
        print('{0:^5}'.format(b[i][j]), end='')
    print('\n')
print('\n' * 2)

# множим а * b
for i in range(size):
    for j in range(size):
        s.append([])
        res = 0
        for k in range(size):
            res += a[i][k] * b[k][j]
        s[i].append(res)

# Виводимо c
for i in range(size):
    for j in range(size):
        print('{0:^5}'.format(s[i][j]), end='')
    print('\n')
