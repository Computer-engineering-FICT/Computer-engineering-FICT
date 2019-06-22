import re
p = re.compile(r"<b>(.+?)</b>", re.I | re.S)
s = "<b>Text1</b>Text2<b>Text3</b>"
for m in re.finditer(p, s):
    print(m.group(1))
