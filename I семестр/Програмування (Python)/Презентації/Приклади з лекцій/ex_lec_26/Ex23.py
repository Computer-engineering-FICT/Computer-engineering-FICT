import io
#Застосування параметра flash
f = open(r"file.txt", "a+")
print("Пишемо рядок5 у файл", file = f, flush = True)
print("Пишeмо рядок6 у файл", file = f, flush = True)
f.seek(0,io.SEEK_SET)
print(f.read())
f.close()
