import re
p = re.compile(r"<(?P<tag1>[a-z]+)><(?P<tag2>[a-z]+)>")
m = p.search("<br><hr>")
print(m.expand(r"<\2><\1>"))  #\номер
print(m.expand(r"<\g<2>><\g<1>>"))# \g<номер>
print(m.expand(r"<\g<tag2>><\g<tag1>>")) # \g<назва>
