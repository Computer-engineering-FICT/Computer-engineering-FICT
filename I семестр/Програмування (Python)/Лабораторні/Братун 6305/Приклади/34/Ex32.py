import re
p = re.compile(r"[0-9]+")
print(p.subn("0", "2014, 2015, 2016, 2017"))

