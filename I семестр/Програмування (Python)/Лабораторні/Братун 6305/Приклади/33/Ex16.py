import re
#* - 0 або більше
s = "<b>Text1</b> Text2\n <b>Text3</b>"
p = re.compile(r"<b>.*</b>", re.S)
print(p.findall(s))
