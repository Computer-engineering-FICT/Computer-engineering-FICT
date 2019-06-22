f = open(r"file.txt", "r")
a = f.writable()
print(a)

f = open(r"file.txt", "w")
b = f.writable()
print(b)
