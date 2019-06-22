import re
p1 = re.compile(r"[0-9]+")
print(p1.findall("2012, 2013, 2014, 2015, 2016"))
p2 = re.compile(r"[a-z]+")
print(p2.findall("2012, 2013, 2014, 2015, 2016"))
t = r"[0-9]{3}-[0-9]{2}-[0-9]{2}"
p = re.compile(t)
print(p.findall("322-55-98"))
print(p.findall("322-55-98, 678-56-12"))
