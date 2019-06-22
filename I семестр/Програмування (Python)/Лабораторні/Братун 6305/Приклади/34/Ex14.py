import re
def check(a):
   if a: print("Знайдено", end=' ')
   else: print("Ні", end=' ')

tamp = re.compile(r"[0-9]+")
check(tamp.search("str123"))
check(tamp.search("123str",3))
check(tamp.search("123str"))

