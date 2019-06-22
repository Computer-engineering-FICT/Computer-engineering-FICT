f = open (r"file.txt", "w", encoding="cp1251")
f.write("Рядок1\nрядок2")
f.close()

f = open (r"file.txt", "r", encoding="cp1251")
p = f.readline(2); print(p)
p = f.readline(2); print(p)
p = f.readline(100); print(p)
