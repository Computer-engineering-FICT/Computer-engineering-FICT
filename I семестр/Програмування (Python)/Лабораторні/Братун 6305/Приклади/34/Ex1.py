import re
s = "<b>Один</b> Два <I>Три</I> <p>Чотири</p>"
p = re.compile(r"<([a-z]+)>(.*?)</\1>", re.S | re.I)
print(p.findall(s))

