import re
re.findall(r"[0-9]+", "1 2 3 4 5 6")
p = re.compile(r"[0-9]+")
print(re.findall(p, "1 2 3 4 5 6"))
