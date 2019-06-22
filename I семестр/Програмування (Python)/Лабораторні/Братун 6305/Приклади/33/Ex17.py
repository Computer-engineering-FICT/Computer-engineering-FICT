import re
#* - 0 або більше
#? - жодного або одне
s = "<b>Text1\n</b>Text2<b>Text3</b>"
p = re.compile(r"<b>.*?</b>", re.S)
print(p.findall(s))
