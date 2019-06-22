import os.path
import time
#Визначення часу останньої зміни файла
t = os.path.getmtime(r"file.txt") #Кількість секунд з початку епохи
print("Час створення file.txt: ", t)

tfor = time.strftime("%d.%m.%Y %H:%M:%S", time.localtime(t))
print("Форматований час модифікації file.txt: ", tfor)
