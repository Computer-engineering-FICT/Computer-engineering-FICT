import os

with open(r"C:\lab7\Andriuchuk\v1.txt") as f:
    for line in f:
        print(line, end="")

with open(r"C:\lab7\Andriuchuk\v1part1.txt", "w", encoding="utf-8") as w1:
    with open(r"C:\lab7\Andriuchuk\v1part2.txt", "w", encoding="utf-8") as w2:
        with open(r"C:\lab7\Andriuchuk\v1part3.txt", "w", encoding="utf-8") as w3:
            size = os.path.getsize(r"C:\lab7\Andriuchuk\v1.txt")
            with open(r"C:\lab7\Andriuchuk\v1.txt") as fd:
                w1.write(fd.read(size//3))
                w2.write(fd.read(size//3))
                w3.write(fd.read(size))
print("Розмір файлу v1.txt: %s" % os.path.getsize(r"C:\lab7\Andriuchuk\v1.txt"))
print("Розмір файлу v1part1.txt: %s" % os.path.getsize(r"C:\lab7\Andriuchuk\v1part1.txt"))
print("Розмір файлу v1part2.txt: %s" % os.path.getsize(r"C:\lab7\Andriuchuk\v1part2.txt"))
print("Розмір файлу v1part3.txt: %s" % os.path.getsize(r"C:\lab7\Andriuchuk\v1part3.txt"))

number_of_strings = int(input("Введіть номер рядка для зчитування: "))
with open(r"C:\lab7\Andriuchuk\v1.txt", "r") as f:
    f = f.read()
f = f.split(".")
f = "!".join(f)
f = f.split("!")
f = "?".join(f)
f = f.split("?")
with open(r"C:\lab7\Andriuchuk\%s priklad.txt" % number_of_strings, "w+") as w:
    for i in range(number_of_strings):
        w.write(f[number_of_strings+i])

