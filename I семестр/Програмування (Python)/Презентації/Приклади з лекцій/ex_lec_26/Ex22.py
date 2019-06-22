#print() підтримує прямий запис у файл
#Застосування параметра file
f = open(r"file.txt", "a")
print("Пишемо рядок4 у файл через print", file = f)
f.close()

f = open(r"file.txt", "r")
print(f.read())
f.close()
