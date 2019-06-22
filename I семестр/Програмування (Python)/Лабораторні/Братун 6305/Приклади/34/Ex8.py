import re
s = "-word1 -word2 -word3 -word4 -word5"
p=re.compile(r"\s\-([a-z0-9]+)\s",re.S | re.I)
print(p.findall(s))
