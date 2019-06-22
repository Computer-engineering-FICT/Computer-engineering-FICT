import re
email = "test@ukr.net"
p = re.compile(r"(?P<name>[a-z0-9]+)@(?P<host>[a-z0-9]+\.[a-z]{2,6})", re.I )
z=p.search(email)
print(z. group ("name"))
print(z.group("host"))
