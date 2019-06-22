f = open(r"file.txt", "rb+")
print("Им’я файлу:",f.name)
print("Режим відкривания:",f.mode)
print("До закриття",f.closed)
f.close()
print("Після закриття",f.closed)

