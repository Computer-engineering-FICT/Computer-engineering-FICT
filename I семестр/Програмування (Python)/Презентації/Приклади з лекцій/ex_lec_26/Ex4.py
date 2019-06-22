import os.path
import time
#Визначення часу останнього доступу до файла
t = os.path.getatime(r"file.txt") #Кількість секунд з початку епохи
print("Час останнього доступу file.txt: ", t)

tfor = time.strftime("%d.%m.%Y %H:%M:%S",time.localtime(t))
print("Форматований час доступу до file.txt: ", tfor)
