import os.path
import time
#Визначення часу створення файла
t = os.path.getctime(r"file.txt") #Кількість секунд з початку епохи
print("Час створення file.txt: ", t)
tfor = time.strftime("%d.%m.%Y %H:%M:%S", time.localtime(t))
print("Форматований час створенння file.txt: ", tfor)
