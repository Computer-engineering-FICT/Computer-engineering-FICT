import re
# Крапка не відповідає \n
p = re.compile(r"^.+$")
print(p.findall("str1\nstr2\nstr3"))

# Теперь крапка відповідає \n
p = re.compile(r"^.+$",re.S)
print(p.findall("str1\nstr2\nstr3"))

# Багаторядковий режим
p = re.compile(r"^.+$",re.M)
print(p.findall("str1\nstr2\nstr3"))


