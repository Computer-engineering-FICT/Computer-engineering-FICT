import re
p = re.compile(r"[0-9]+")
for m in p.finditer("2012, 2013, 2014, 2015, 2016"):
    print(m.group(0), "start:", m.start(), "end:", m.end())
