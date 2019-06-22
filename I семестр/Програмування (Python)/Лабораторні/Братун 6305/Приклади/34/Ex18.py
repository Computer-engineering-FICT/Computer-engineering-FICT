import re
p = re.compile(r"(?P<num>[0-9]+)(?P<str>[a-z]+)")
m = p.search("123456string 67890text")
print("Об'єкт:",m)
print("groups, groupindex:",m.re.groups, m.re.groupindex)
print("pattern:",m.re.pattern)
print(m.string)
print(m.lastindex, m.lastgroup)
print(m.pos, m.endpos)

