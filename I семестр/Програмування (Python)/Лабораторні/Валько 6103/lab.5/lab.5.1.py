""" Задайте словник, вказуючи як ключ місяць року, а як значення – кількість сонячних днів,
які задані випадковим чином. Виведіть місяць, який має середню кількість сонячних днів, місяць,
що має найбільшу кількість сонячних днів, та місяць з найменшою кількістю сонячних днів. """

import random

months = ["Січень", 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень', 'Липень',
          'Серпень', 'Вересень', 'Жовтень', 'Листопад', 'Грудень']
days_sun = {}.fromkeys(months)
for j in days_sun:
    days_sun[j] = random.randint(1, 31)
print('\nСформований словник:\n', days_sun)
months = list(days_sun.keys())
days = list(days_sun.values())
median = sum(days_sun.values())/12

print('\n{m} - Середньостатистична кількість сонячних днів усіх місяців.'.format(m=round(median)))
if median in days:
    print('\n{m} ({d} сонячних днів) - місяць, який має середню кількість сонячних'
          ' днів.'.format(m=months[days.index(median)], d=median))
else:
    days1 = []
    for k in days:
        k = abs(k-median)
        days1.append(k)
    print('\n{m} ({d} сонячних днів) - '
          'місяць, який має середню кількість сонячних'
          ' днів.'.format(m=months[days1.index(min(days1))], d=days[days1.index(min(days1))]))

print('{m} ({d} сонячних днів) - місяць, який має найбільшу кількість сонячних'
      ' днів.'.format(m=months[days.index(max(days))], d=max(days)))
print('{m} ({d} сонячних днів) - місяць, який має найменшу кількість сонячних'
      ' днів.'.format(m=months[days.index(min(days))], d=min(days)))
