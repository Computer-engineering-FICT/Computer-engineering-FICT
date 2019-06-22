import re, os


def safeSplit(t):
    s = []
    r = re.compile('([.!?\\n])+[")\\n]*')
    f = r.search(t)
    while f:
        s.append(t[:f.end()].strip())
        t = t[f.end():]
        f = r.search(t)
    return s


def ch_letter(l, letters, n):
    return letters[n-1-letters.index(l)]

os.chdir(os.path.abspath("lab7/Лисенко"))
f = input("Введіть назву текстового файла без розширення: ")
with open(f+".txt", encoding="cp1251") as file:
    text = file.read()
sentences = safeSplit(text)
a = []
for i in sentences:
    a.append(len(i.split(" ")))
average = sum(a)/len(a)

with open(f+"1.txt", "w", encoding="cp1251") as file:
    for i in sentences:
        if (average + 3) > len(i.split(" ")) > (average - 3):
            file.write(i + "\n")
print("Файл {:>5}1.txt з реченнями з кількістю слів у діапазоні {:.1F} ± 2 успішно створенний".format(f, average))

with open("alpha.txt", encoding="cp1251") as file:
    n = int(file.readline())
    letters_upper = file.readline().rstrip()
    letters_lower = file.readline().rstrip()

with open(f+"2.txt", "w", encoding="cp1251") as file:
    for i in text:
        if i in letters_upper:
            file.write(letters_upper[n-1-letters_upper.index(i)])
        elif i in letters_lower:
            file.write(letters_lower[n-1-letters_lower.index(i)])
        else:
            file.write(i)
print("Файл {:>5}2.txt з реверсними українськими буквами успішно створенний".format(f))
