import io
f = open(r"file.txt", "rb")
print("Зсунути на ",f.seek(9, io.SEEK_CUR)) # 9 байт від покажчика
print("Поточна позиція:",f.tell())
print("На початок: ",f.seek(0,io.SEEK_SET)) # Зсуваємо на початок
print("Поточна позиція:",f.tell())
print("-9 від кінця",f .seek(-9, io. SEEK_END)) # -9 байтов від кінця
print("Поточна позиція:",f.tell())
f .close ()
