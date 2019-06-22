x = float(input('Введіть основу степеня: '))
y = int(input('Введіть показник степеня: '))

res = 1

if x == 0:
    if y == 0:
        print('0 ^ 0 не існує')
    elif y < 0:
        print('На нуль ділити не можна')
    else: print('{} ^ {} = 0'.format(x, y))
else:
    if y > 0:
        for i in range(0, y):
            res *= x
        print('{} ^ {} = {}'.format(x, y, res))
    elif y < 0:
        for i in range(0, y, -1):
            res /= x
        print('{} ^ ({}) = {}'.format(x, y, res))
    else: print('{} ^ {} = 1'.format(x, y))
