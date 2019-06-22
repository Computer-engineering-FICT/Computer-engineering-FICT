f = open("D:\\\\1.txt")
l = ""
for line in f:
    if line[:5] == "title":
        l += line
print(l)
