""" В заданому рядку замінити кожну кириличну літеру символом «*». """

text = input('Введіть текст:\n')

for i in text:
    if ord(i) in range(1040, 1106):
        text = text.replace(i, '*')
    else:
        continue

print("Результат:", "%20s" % text)
