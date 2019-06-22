import os
#Перевірка існування файлу за номером
f=open("file.txt")
a=f.fileno()
print("Номер фалу: ", a)
p= os.path.exists(a)
print("Результат перевірки існування file.txt:",p)
f.close

with open(r"file2.txt", "w+") as f:
    b= os.path.exists(f.fileno())
    print("Номер фалу: ", f.fileno())
print("Результат перевірки існування file2.txt", b)
