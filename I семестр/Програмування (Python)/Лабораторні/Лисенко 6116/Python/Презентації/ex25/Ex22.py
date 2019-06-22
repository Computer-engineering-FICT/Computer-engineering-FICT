# Копіювання файлів без копіювання прав доступу
import shutil # Підключаємо модуль
my_path=shutil.copyfile(r"file.txt", r"file2.txt")
print(my_path) #Шлях копіювання

