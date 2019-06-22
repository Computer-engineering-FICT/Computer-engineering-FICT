import re
def repl(m):
   """ Функція для заміни. m – об’єкт Match """
   x = int(m.group(0))
   x += 10
   return "{0}".format(x)
p = re.compile(r"[0-9]+")
# Заміняємо всі входження
print(p.sub(repl, "2012, 2013, 2014, 2015"))
# Заміняємо тілько перші два входження
print(p.sub(repl, "2012, 2013, 2014, 2015", 2))
