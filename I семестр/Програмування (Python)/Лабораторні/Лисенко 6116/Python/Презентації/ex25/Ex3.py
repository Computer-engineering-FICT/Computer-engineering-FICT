# Текстовий режим

f = open(r"file.txt", "w", encoding="cp1251")
f.writelines(["Рядок1\n", "Рядок2"])
f.close()


# Бінарний режим

f = open(r"file.txt", "wb")
arr = [bytes("Рядок1\n", "cp1251"), bytes("Рядок2", "cp1251")]
f.writelines(arr)
f.close()
