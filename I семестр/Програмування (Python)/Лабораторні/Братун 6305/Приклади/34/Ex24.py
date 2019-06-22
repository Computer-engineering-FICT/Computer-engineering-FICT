import re
email = input("Введіть e-mail: ")
pe = r"^([a-z0-9_.-]+)@(([a-z0-9-]+\.)+[a-z]{2,6})$"
p = re.compile(pe, re.I | re.S)
m = p.search(email)
if not m:
    print("E-mail не відповідає шаблону")
else:
    print("E-mail", m.group(0), "відповідає шаблону")
    print ("ящик:", m.group(1), "домен:", m.group(2))

