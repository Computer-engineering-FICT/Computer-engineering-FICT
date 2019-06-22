import re
p = re.compile(r"(?P<num>[0-9]+)(?P<str>[ a-z]+)")
s = "str123456str"
m = p.search(s)
print(m.start(), m.end(), m.span())
print(m.start(1), m.end(1), m.start("num"), m.end("num"))
print(m.start(2), m.end(2), m.start("str"), m.end("str"))
print(m.span(1), m.span("num"), m.span(2), m. span("str"))
print(s[m.start(1):m.end(1)], s[m.start(2):m.end(2)])
