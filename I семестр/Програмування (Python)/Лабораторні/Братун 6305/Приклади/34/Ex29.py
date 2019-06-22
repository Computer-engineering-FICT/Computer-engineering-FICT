import re
p = re.compile(r"<(?P<tag1>[a-z]+)><(?P<tag2>[a-z]+)>")
print(p.sub(r"<\1><\2>", "<br><hr>")) # \номер
print(p.sub(r"<\g<2>><\g<1>>", "<br><hr>"))# \g<номер>
print(p.sub(r"<\g<tag2>><\g<tag1>>", "<br><hr>")) # \g<назва>

