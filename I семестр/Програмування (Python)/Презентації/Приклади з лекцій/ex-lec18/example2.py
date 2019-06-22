import testex2 as t
d = getattr(t,"s")
for i in d:
    print(i, end = " ")
print("\n")
c = getattr(t, "f", [11,12,13,14])
for i in c:
    print(i, end = " ")
