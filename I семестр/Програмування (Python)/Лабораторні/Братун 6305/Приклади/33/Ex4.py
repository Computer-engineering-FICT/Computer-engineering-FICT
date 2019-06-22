import re
# без врахування регістру (re.I)
# Юнікод (re.U)
p=re.compile(r"[а-яё]", re.I | re.U)
p1=re.compile(r"[а-яё]+", re.I | re.U)
s = p.search("АБВГДЕ")
s1 = p1.search("ЕАВБГД")
s2 = p1.search("вабАгдБГДЕВ")

if s:
    print(s.span())
    print(s.group(0))
if s1:
    print(s1.span())
    print(s1.group(0))
if s2:
    print(s2.span())
    print(s2.group(0))
