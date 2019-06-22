import re
p = re.compile(r"(?P<num>[0-9]+)(?P<str>[a-z])?")
m = p.search("123456")
print(m.groupdict())
print(m.groupdict(""))
