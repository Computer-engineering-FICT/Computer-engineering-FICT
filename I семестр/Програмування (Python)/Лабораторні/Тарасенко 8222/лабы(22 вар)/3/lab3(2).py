a = bytearray(str(input()),"utf-8")
b = bytearray()
for i in a:
    if i in a[a.index(i)+1:]:
        b.append(i)
print("{}".format(b.decode('utf-8')))
