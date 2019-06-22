import re
def check(a):
   if a: print("Знайдено")
   else: print("Ні")
p = "[Pp]ython"
check(re.fullmatch (p,"Python"))
check(re.fullmatch (p,"python"))
check(re.search(p, "py"))
check(re.search(p, "thon"))

