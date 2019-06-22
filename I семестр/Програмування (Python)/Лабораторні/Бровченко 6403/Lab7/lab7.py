import os
import pickle
import shelve
import shutil
import time

import Lab5.L5_Zavd1 as l5
import Lab6.lab6 as l6


def sort_file(f, f1, f2):
    file = open(f, 'r+')
    p1 = open(f1, 'w+', encoding='cp1251')
    p2 = open(f2, 'w+', encoding='cp1251')
    print('Рахуємо кількість символів у файлі.', end='')
    symbols = len(file.read())
    print(' -> ', symbols, '\n')
    time.sleep(0.3)

    print('Сортуємо символи у файли «3part1.txt», «3part2.txt».')
    for n in list(range(symbols)):
        file.seek(n)
        if n % 2 == 1:
            p1.writelines(file.read(1))     # парні
        else:
            p2.writelines(file.read(1))     # непарні
    time.sleep(0.3)
    print('>> Файл відсортованно.')
    time.sleep(0.3)

    print('Зберігаємо створені файли в кодуванні «cp1251».')
    time.sleep(0.3)
    p1.close()
    p2.close()
    print('>> Файли збережено.\n')
    time.sleep(0.3)


def restore_file(file1, file2):
    print('Починаємо відновлення файлу.')
    time.sleep(0.3)
    restored_file = open('f(restored).txt', 'w', encoding='utf-8-sig')
    p1 = open(file1, 'r', encoding='cp1251').read()
    p2 = open(file2, 'r', encoding='cp1251').read()
    n1 = 0; n2 = 0
    for i in range(len(p1)+len(p2)):
        if i % 2 == 1:
            restored_file.writelines(p1[n1])
            n1 += 1
        elif i % 2 == 0:
            restored_file.writelines(p2[n2])
            n2 += 1
    restored_file.close()
    print('>> Файл відновлено з назвою {}.\n'.format(restored_file.name))


def create_catalog(path):
    if os.path.isabs(path):
        print('Створюємо каталог «{}».'.format(path))
        try:
            os.makedirs(r'{}'.format(path))
        except FileExistsError:
            print('***Каталог вже існує***\n')
        finally:
            print('Змінюємо поточну директорію на «{}»'.format(path))
            os.chdir(path)
        time.sleep(0.3)
    else:
        raise NameError

# створення каталогу зі шляхом та назвою: «С:\lab7\» та підкаталогу «С:\lab7\Brovchenko»
print('Створюємо каталог зі шляхом та назвою: «С:\lab7» та підкаталог «С:\lab7\Brovchenko».')
create_catalog('C:\lab7\Brovchenko')

# завантаження файлу 3.txt у створений підкаталог
print('Завантажуємо файл 3.txt у створений підкаталог')
shutil.copy(r'C:\Users\Nastya\Downloads\lab7\for_lab_7\3.txt', r'C:\lab7\Brovchenko')
time.sleep(0.3)

# виконання індивідуального завдання, згідно з номером варіанту
time.sleep(0.3)
sort_file(r'C:\lab7\Brovchenko\3.txt', f1='3part1.txt', f2='3part2.txt')
restore_file(file1='3part1.txt', file2='3part2.txt')
time.sleep(0.3)
print('ЗВЕРШЕНО ВИКОНАННЯ ІНДИВІДУАЛЬНОГО ЗАВДАНЯ ЗГІДНО З ВАРІАНТОМ.\n\n')
time.sleep(1)

# створення каталогу з шляхом «С:\lab5» та переміщення туди файлів,
# створених під час виконання лабораторної №5
create_catalog('C:\lab5')

print("Зберігаємо об'єкти з «Lab5.L5_Zavd1» в файл «L5.txt»")
f = open('L5.txt', 'ab')
pickle.dump(l5.sunny_days, f)
pickle.dump(l5.months, f)
pickle.dump(l5.days, f)

f = open('L5.txt', 'rb')
a = pickle.load(f)
b = pickle.load(f)
c = pickle.load(f)
time.sleep(0.3)

print('Створений файл:\n'
      '-----start-----')
time.sleep(0.3)
for i in [a, b, c]:
    print(i)
print('------end------\n\n')
f.close()
time.sleep(0.3)

# Завдання 5 "Завантаження даних з laba6.py та вивід модифікованого файлу."
create_catalog('C:\lab6')

print("Створюємо файл «lab6_shelve.txt» і зберігаємо в нього об'єкти, створенні при виконанні лабораторної №6.\n")
z5 = shelve.open(r'C:\lab6\lab6_shelve.txt')
z5['obj1'] = l6.jan
z5['obj2'] = l6.feb
z5['obj3'] = l6.mar
time.sleep(0.3)

print('Застосовуємо методи keys(), values(), items() до файлу «lab6_shelve.txt»:\n'
      '-----start-----')
time.sleep(0.3)
print('z5.keys() = {}\nz5.values() = {}\nz5.items = {} \n'
      '------end------\n\n'
      .format(list(z5.keys()), list(z5.values()), list(z5.items())))
z5.close()
time.sleep(0.3)

print('***ВСІ ЗАВДАННЯ ЛАБОРАТОРНОЇ ВИКОНАНО***')
