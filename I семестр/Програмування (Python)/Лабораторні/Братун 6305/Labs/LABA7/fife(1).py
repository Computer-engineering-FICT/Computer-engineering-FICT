import shelve
from LABA6.Town import cities

mytesss = shelve.open(r'C:/lab6/lab6.txt')

mytesss['dict'] = cities

a = mytesss.setdefault('first', {'a': 1})
mytesss.update({'second': '123'})
mytesss['third'] = 'test'
del mytesss['third']
mytesss['four'] = 'test2'


print(mytesss['dict'])
print(mytesss['first'])
print(mytesss['second'])
try:
    print(mytesss['third'])
except KeyError:
    print("об'єкту немає!")
print(mytesss['four'])
mytesss.close()

