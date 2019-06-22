#Копіювання з правами доступу
import shutil # Підключаємо модуль
my_path = shutil.copy(r"file.txt", r"file3.txt")
print(my_path) #Шлях копіювання
