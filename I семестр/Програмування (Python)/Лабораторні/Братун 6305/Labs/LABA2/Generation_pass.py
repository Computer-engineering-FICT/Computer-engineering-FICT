import random # Підключаємо модуль randorn
def passw_generator(count_char=8):
    arr = ['а', 'b', 'с', 'd', 'е', 'f', 'g',
    'h', 'i', 'j ', 'k', '1', 'm', 'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
    'y', 'z', 'А', 'В', 'С', 'D', 'Е', 'F', 'G',
    'Н', 'I', 'J', 'К', 'L','М', 'N', 'О', 'Р',
    'Q', 'R', 'S', 'Т', 'U', 'V', 'W', 'Х',
    'У','Z', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', '0']
    passw = []
    for i in range(count_char):
        passw.append(random.choice(arr))
    return "".join(passw)
    # Викликаємо функцію
print(passw_generator(10))
    # Виведе щось на кшталт ngodhebjbx
print(passw_generator())
# Виведе щось на кшталт Zxcpkfso
