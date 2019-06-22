a=input()
b=a
for i in ("a","i","o"):
    b=b.partition(i)
    p="".join(b)
    while p not in '':
        b="-".join(b)

# while b not in '':
#     b=b.partition("a")
#     b="-".join(b)
print(b)
q=b.split("-")
print(q)
q1="-".join(q)
# q2=
print(q1)
