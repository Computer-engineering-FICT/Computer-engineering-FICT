# Атрибут кодування
f = open(r"file.txt", "a", encoding="cp1251")
print("Кодування: ",f.encoding) # Доступний тільки для читання
f.close()
