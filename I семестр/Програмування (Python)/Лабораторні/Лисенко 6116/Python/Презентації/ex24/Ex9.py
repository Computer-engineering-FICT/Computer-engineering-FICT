f = open(r"file.txt","w")# Відкриваємо файл на запис
a=f.write("String1\nstring2")# Записуємо два рядки у файл
print(a)
f.close()# Закриваємо файл
