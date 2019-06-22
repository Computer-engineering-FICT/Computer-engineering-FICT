f = open(r"file.txt", "r",encoding="cp1251")
for line in f:print(line.rstrip("\n"),end=" ")
f.close ()
