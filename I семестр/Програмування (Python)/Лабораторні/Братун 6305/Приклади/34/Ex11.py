import re
def check(a):
   if a: print("Знайдено")
   else: print("Ні")

p1 = r"[0-9]+"
check(re.match(p1, "str123"))
check(re .match(p1, "123str"))
p2 = re.compile(r"[0-9]+")
check(re.match(p2, "123str"))
