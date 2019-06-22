import re
def check(a):
   if a: print("Знайдено", end=' ')
   else: print("Ні", end=' ')

tamp = re.compile("[Pp]ython")
check(tamp.fullmatch("Python"))
check(tamp.fullmatch("python"))
check(tamp.fullmatch("py"))
check(tamp.fullmatch("nothpy"))
check(tamp.fullmatch("Pythonware",0,6))
