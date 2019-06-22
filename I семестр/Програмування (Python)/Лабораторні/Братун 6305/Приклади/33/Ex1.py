import re
result = re.match(r'Мій', 'Мій перший пошук')
result1 = re.match(r'перший', 'Мій перший пошук')
if result:
    print(type(result))
    print ("Знайдено:",result.group(0))
    print ("Початковий індекс:",result.start())
    print ("Кінцевий індекс:",result.end())
else: print ("Результат:",result)
if result1: print (result1.group(0))
else: print ("Результат:",result1)
