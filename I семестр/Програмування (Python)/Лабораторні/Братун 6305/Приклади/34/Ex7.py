import re
s = "text1, text2, text3 text4"
p = re.compile(r"(?<![,])([ ][a-z]+[0-9])", re.S | re.I)
print(p.findall(s))
