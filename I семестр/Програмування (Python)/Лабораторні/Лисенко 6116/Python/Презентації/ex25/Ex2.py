# Текстовий режим
f = open(r"file.txt", "w", encoding="cp1251")
f.write("Рядок1\nрядок2") # Записуємо рядок у файл
f.close()
f = open(r"file.txt", "wb")
#f.write("Рядок1\nрядок2") # не пишіть рядки в бінарний файл
f.write(bytes("Рядок1\nрядок2", "cp1251"))
f.write(bytearray("\nрядок3", "cp1251"))
f.close()

