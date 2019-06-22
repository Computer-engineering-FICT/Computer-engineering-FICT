import re
def check(a):
   if a: print("Знайдено")
   else: print("Ні")
p1 = r"[0-9]+"
check(re.search(p1, "str123"))
p2 = re.compile(r"[0-9]+")
check(re.search(p2, "str123"))
check(re.search(p2, "123str"))
