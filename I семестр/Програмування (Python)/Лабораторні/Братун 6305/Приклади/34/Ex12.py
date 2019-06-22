import re
def check(a):
   if a: print("Знайдено")
   else: print("Ні")

tamp = re.compile(r"[0-9]+")
check(tamp.match("str123"))
check(tamp.match("str123",3))
check(tamp.match("123str"))
