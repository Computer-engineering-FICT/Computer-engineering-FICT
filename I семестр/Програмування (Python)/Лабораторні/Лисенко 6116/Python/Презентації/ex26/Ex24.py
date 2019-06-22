import sys
#Перенаправлення stdin
tmp_in = sys.stdin # Зберігаємо посилання на sys.stdin
f = open(r"file.txt", "r")# Відкриваємо файл на читання
sys.stdin = f # Перенаправляємо ввід
while True:
    try:
        line = input()# Читаємо рядок з файлу
        print(line) # Виводимо рядок
    except EOFError: # Якщо досягнутий кінець файлу,
        break  # виходимо з циклу
sys.stdin = tmp_in # Відновлюємо стандартний ввід
f. close ()# Закриваємо файл
