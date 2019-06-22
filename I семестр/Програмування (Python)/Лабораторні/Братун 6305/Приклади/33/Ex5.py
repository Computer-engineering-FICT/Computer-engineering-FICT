import re
def check(a):
    if a:
        print(repr(a.group()))
        print(a.span())
    else: print(a)
p = re.compile(r".$")
check(p.search("\n"))

p1 = re.compile(r".$", re.M)

check(p1.search("\n"))

p2 = re.compile(r".$", re.S)
check(p2.search("\n"))
