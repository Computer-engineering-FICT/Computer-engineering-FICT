import os, time, shutil

# виконання індивідуального завдання, згідно з номером варіанту
print('Змінюємо поточну директорію на «С:\lab7\Brovchenko»')
os.chdir(r'C:\lab7\Brovchenko')
time.sleep(0.5)

option1 = int(input('---------------------------------------------------------------------------\n'
                    'Оберіть файл, який необхідно розбити на 2 файли «3part1.txt», «3part2.txt»,\n'
                    'які містять непарні та парні за номером символи початкового файлу\n'
                    'і зберегти їх у кодуванні «cp1251»\n\n'
                    '1 -> Створити новий файл\n'
                    '2 -> Відкрити файл 3.txt\n'
                    '0 -> Завершити роботу\n'
                    '---------------------------------------------------------------------------\n'
                    'Ваш вибір: '))
if option1 == 1:
    path_nf = input('Введіть назву файлу: ')
    file = open(path_nf, 'w+')
    print('Створено файл {name}.'.format(name=path_nf))
    option2 = int(input('---------------------------------------------------------------------------\n'
                        'Додати записи в файл {name} ?\n'
                        '1 -> Так\n'
                        '0 -> Ні\n'
                        '---------------------------------------------------------------------------\n'
                        'Ваш вибір: '.format(name=path_nf)))
    if option2 == 1:
        line = input('Додаємо запис у файл:\n')
        file.writelines(line)

    elif option2 == 0: pass
    else: raise ValueError

elif option1 == 2:
    file = open('3.txt', 'r+')

elif option1 == 0: raise SystemExit

else: raise ValueError

p1 = open('3part1.txt', 'w+', encoding='cp1251')
p2 = open('3part2.txt', 'w+', encoding='cp1251')

print('Рахуємо кількість символів у файлі.', end='')
symbols = len(file.read())
print(' -> ', symbols, '\n')
time.sleep(0.5)

print('Сортуємо символи у файли «3part1.txt», «3part2.txt».\n')
for n in list(range(symbols)):
    file.seek(n)
    if n % 2 == 1:
        p1.writelines(file.read(1))     # парні
    else:
        p2.writelines(file.read(1))     # непарні
time.sleep(0.5)

print('Зберігаємо створені файли в кодуванні «cp1251».\n')
time.sleep(0.5)
p1.close()
p2.close()

option3 = int(input('---------------------------------------------------------------------------\n'
                    'Зчитати створені файли та відновити з них початковий файл?\n'
                    '1 -> Так\n'
                    '0 -> Ні\n'
                    '---------------------------------------------------------------------------\n'
                    'Ваш вибір: '))
if option3 == 1:
    restored_file = open('3(restored)', 'w', encoding='utf-8-sig')
    p1 = open('3part1.txt', 'r', encoding='cp1251').read()
    p2 = open('3part2.txt', 'r', encoding='cp1251').read()
    n1 = 0; n2 = 0
    for i in range(len(p1)+len(p2)):
        if i % 2 == 1:
            restored_file.writelines(p1[n1])
            n1 += 1
        elif i % 2 == 0:
            restored_file.writelines(p2[n2])
            n2 += 1
    restored_file.close()

elif option3 == 0:
    pass

else: raise ValueError

print('Роботу завершено.')
