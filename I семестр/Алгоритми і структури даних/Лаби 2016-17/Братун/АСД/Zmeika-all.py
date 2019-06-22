n = int(input('Введите число строк(n) ')) 
m = int(input('Введите число столбцов(m) ')) 
for j in range(n): 
    print(' '.join([str(i + 1 + m * j) for i in range(m)][::pow(-1, j)]))
