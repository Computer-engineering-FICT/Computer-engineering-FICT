""" Створити клас, який описує місяць року і містить назву місяця, список днів даного місяця, довжина якого формується
в залежності від номеру місяця. Кожен день може бути сонячним, хмарним або дощовим. Кожен день також характеризується
середньодобовою температурою. Клас має містити методи визначення середньої кількості сонячних хмарних та дощових днів,
методи визначення мінімальної, максимальної та середньої температури. Створити об’єкти даного класу, для кожного місяця
року, задати кількості сонячних, хмарних, дощових днів та середньодобову температуру кожного дня випадковим чином з
урахуванням пори року та номеру місяця. Програма повинна виводити за запитом середні кількості сонячних, хмарних,
дощових днів та середню температуру для кожного місяця за запитом. """

import random
import sys


class Month:
    """Детальний опис місяця"""
    def __init__(self, n, month, m_list):
        self.month = month
        # Список діапазонів t(11-12); Форм. t для кожного дня в місяці(13); Форм. погоди дяк кожного дня(14).
        temp = [range(-30, 0), range(-25, 5), range(-5, 15), range(0, 15), range(5, 20), range(10, 25),
                range(20, 35), range(15, 35),  range(10, 25), range(5, 20), range(-5, 15), range(-25, 5)]
        self.temp_list = [random.choice(temp[n-1]) for i in list(range(1, m_list))]
        self.desc_list = [random.choice(['сонце', 'хмари', 'дощ']) for k in list(range(1, m_list+1))]

    def sunny_days(self):
        """Повертає кількість сонячних днів в місяці"""
        return '\nСонячні дні: {d}'.format(d=self.desc_list.count('сонце'))

    def cloudy_days(self):
        """Повертає кількість хмарних днів в місяці"""
        return '\nХмарні дні: {d}'.format(d=self.desc_list.count('хмари'))

    def rainy_days(self):
        """Повертає кількість дощових днів в місяці"""
        return '\nДощові дні: {d}'.format(d=self.desc_list.count('дощ'))

    def min_t(self):
        """Повертає мінімальну температуру протягом місяця"""
        return '\nМінімальна температура: {t}'.format(t=min(self.temp_list))

    def max_t(self):
        """Повертає максимальну температуру протягом місяця"""
        return '\nМаксимальна температура: {t}'.format(t=max(self.temp_list))

    def average_t(self):
        """Повертає середню температуру протягом місяця"""
        return '\nСередня температура: {t}'.format(t=round(sum(self.temp_list)/len(self.temp_list), 2))

    def full_description(self):
        """Повертає повний опис місяця (К-сть сонячних, хмарних, дощових днів, середню, мінімальну та максимальну t"""
        return '{s}{c}{r}{a}{min}{max}\n'\
            .format(s=self.sunny_days(), c=self.cloudy_days(), r=self.rainy_days(),
                    a=self.average_t(), min=self.min_t(), max=self.max_t())

# Створення об'єктів класу кожного місяця
month1 = Month(1, 'Січень', 31)
month2 = Month(2, 'Лютий', 28)
month3 = Month(3, 'Березень', 31)
month4 = Month(4, 'Квітень', 30)
month5 = Month(5, 'Травень', 31)
month6 = Month(6, 'Червень', 30)
month7 = Month(7, 'Липень', 31)
month8 = Month(8, 'Серпень', 31)
month9 = Month(9, 'Вересень', 30)
month10 = Month(10, 'Жовтень', 31)
month11 = Month(11, 'Листопад', 30)
month12 = Month(12, 'Грудень', 31)


def first_dialog_text():
    """Інтерфейс програми. Повертає перше повідомлення (Вибір місяця)"""
    return '\n-----------------------------------------------------------------------------------\n' \
           '   [1]   Січень   |   [4]  Квітень  |   [7]    Липень    |   [10]   Жовтень  \n' \
           '   [2]   Лютий    |   [5]  Травень  |   [8]   Серпень    |   [11]   Листопад \n' \
           '   [3]  Березень  |   [6]  Червень  |   [9]   Вересень   |   [12]   Грудень  \n' \
           '-----------------------------------------------------------------------------------\n' \
           '   [0]   Вихід\n' \
           '-------------------\n' \
           'Виберіть опцію:'


def second_dialog_text():
    """Інтерфейс програми. Повертає друге повідомлення (Вибір опції опису місяця)"""
    return '----------------------\n' \
           '[1] Повний опис місяця\n[2] Середня температура\n[3] Сонячні дні\n' \
           '[4] Хмарні дні\n[5] Дощові дні\n[9] Назад\n[0] Завершення роботи\n'\
           '----------------------\nВиберіть опцію:'


def last_dialog(number, month):
    """Інтерфейс програми. Повертає опис місяця за вибраною опцією"""
    if number == '1':
        return month.full_description()
    elif number == '2':
        return month.average_t()
    elif number == '3':
        return month.sunny_days()
    elif number == '4':
        return month.cloudy_days()
    elif number == '5':
        return month.rainy_days()
    elif number == '0':
        sys.exit('Робота програми завершена')
    else:
        return 'Невідома команда ( {} )'.format(number)


while True:
    """Тіло програми"""

    print(first_dialog_text())
    user_input = input()

    if user_input == '1':
        print('\nВи вибрали Січень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month1))

    elif user_input == '2':
        print('\nВи вибрали Лютий\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month2))

    elif user_input == '3':
        print('\nВи вибрали Березень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month3))

    elif user_input == '4':
        print('\nВи вибрали Квітень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month4))

    elif user_input == '5':
        print('\nВи вибрали Травень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month5))

    elif user_input == '6':
        print('\nВи вибрали Червень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month6))

    elif user_input == '7':
        print('\nВи вибрали Липень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month7))

    elif user_input == '8':
        print('\nВи вибрали Серпень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month8))

    elif user_input == '9':
        print('\nВи вибрали Вересень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month9))

    elif user_input == '10':
        print('\nВи вибрали Жовтень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month10))

    elif user_input == '11':
        print('\nВи вибрали Листопад\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month11))

    elif user_input == '12':
        print('\nВи вибрали Грудень\n')
        while True:
            print(second_dialog_text())
            user_input = input()
            if user_input == '9':
                break
            print(last_dialog(user_input, month12))

    elif user_input == '0':
        sys.exit('Робота програми завершена')

    else:
        print('Невідома команда ( {} )'.format(user_input))
