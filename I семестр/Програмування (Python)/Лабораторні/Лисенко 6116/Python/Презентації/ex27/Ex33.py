try:
   open(r"C:\temp\new\file.txt")
except FileNotFoundError:
    print("Фaйл відсутній")
except IsADirectoryError:
    print("Це не файл, а папка")
except PermissionError:
    print("Відсутні права на доступ до файлу")
except OSError:
    print("Невизначена помилка відкриття файлу")
