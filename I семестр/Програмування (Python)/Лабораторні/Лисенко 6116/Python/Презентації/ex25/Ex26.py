# Приклад перейменування файлів
import os # Подключаем модуль
try:
    os.rename(r"file3.txt", "renamed_file3.txt")
except OSError:
    print("Фaйл не вдалося перейменувати")
else:
    print("Фaйл успішно перейменований")
