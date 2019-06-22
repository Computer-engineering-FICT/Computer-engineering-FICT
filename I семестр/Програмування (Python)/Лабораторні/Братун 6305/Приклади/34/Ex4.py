import re
s = "Перша_кома, Друга_кома, Без_коми"
p = re.compile(r"\w+(?=[,])", re.S | re.I)
print(p.findall(s))
