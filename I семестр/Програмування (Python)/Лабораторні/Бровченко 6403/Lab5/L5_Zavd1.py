import random

# Генерація словника
sunny_days = {}.fromkeys(['january', 'february', 'march',
                          'april', 'may', 'june',
                          'july', 'august', 'september',
                          'october', 'november', 'december'])
for i in sunny_days:
    sunny_days[i] = random.randint(0, 32)

months = list(sunny_days.keys())
days = list(sunny_days.values())


# Вивід MIN, MAX
def min_sunny(months=months, days=days):
    print('Найменше сонячних днів було в місяці -> {month} -> {days}'
          .format(month=months[days.index(min(days))], days=min(days)))
def max_sunny(months=months, days=days):
    print('Найбільше сонячних днів було в місяці -> {month} -> {days}'
          .format(month=months[days.index(max(days))], days=max(days)))

# Обчислення і вивід середньго значення
def mid_sunny():
    mid = sum(sunny_days.values())/12
    if mid in days:
        print('Середнє значення сонячних днів було в місяці -> {month} -> {days}'
              .format(month=months[days.index(mid)], days=mid))
    else:
        days1 = []
        for v in days:
            v = abs(v - mid)
            days1.append(v)
        for d in days1:
            if d == min(days1):
                print('Середнє значення сонячних днів було в місяці -> {month} -> {days}'
                      .format(month=months[days1.index(min(days1))],days=days[days1.index(min(days1))]))
