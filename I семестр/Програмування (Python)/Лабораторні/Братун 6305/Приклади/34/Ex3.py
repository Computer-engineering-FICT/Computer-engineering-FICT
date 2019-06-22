import re
s = "<b>Text1</b>Text2<I>Text3</I>"
p = re.compile(r"<(?P<tag>[a-z]+)>(.*?)</(?P=tag)>", re.S | re.I)
print(p.findall(s))
