#Приклад застосування атрибута buffer
f = open(r"file.txt", "w", encoding="cp1251")
print(f.buffer.write(bytes("Рядок","cp1251"))) #Повертає кількість символів
f.close()


