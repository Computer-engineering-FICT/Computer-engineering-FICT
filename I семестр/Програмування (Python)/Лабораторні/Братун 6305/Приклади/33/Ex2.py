import re
result = re.search(r'другий', 'Мій другий пошук')
result1 = re.search(r'перший', 'Мій другий пошук')
if result:
    print(type(result))
    print ("Знайдено:",result.group(0))
    print ("Початковий індекс:",result.start())
    print ("Кінцевий індекс:",result.end())
else: print ("Результат:",result)
if result1: print (result1.group(0))
else: print ("Результат:",result1)
