import re
p = re.compile(r"(?P<num>[0-9]+)(?P<str>[a-z]+)")
m = p.search("123456string 67890text")
print("Повна відповідність:",m.group(),m.group(0))
print("Доступ по індексу:",m.group(1), m.group(2)) #
print("Доступ по назві:",m.group('num'), m.group('str'))
print("Декілька параметрів:",m.group(1,2), m.group('num','str'))

