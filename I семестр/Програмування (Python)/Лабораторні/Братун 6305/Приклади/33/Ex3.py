import re
result = re.findall(r'ш', 'Я шукаю перший раз')
result1 = re.findall(r'перший', 'Мій другий пошук')
if result:
    print(type(result))
    print ("Знайдено:",result)
else: print ("Результат:",result)
if result1: print (result1)
else: print ("Результат:",result1)
