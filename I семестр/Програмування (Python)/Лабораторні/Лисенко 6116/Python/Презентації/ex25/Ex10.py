#Текстовий режим
f = open(r"file.txt", "r", encoding="cp1251")
print(f.__next__())
print(f.__next__())
print(f.__next__())
f.close()

