import sys
#Перенаправлення stdout
tmp_out = sys.stdout # Зберігаємо посилання на sys.stdout
f = open(r"file.txt", "w") # Відкриваємо файл на дозапис
sys.stdout = f #Перенапраляємо
print("Пишемо рядок1 у файл") # Перенаправляємо вивід у файл
print("Пишемо рядок2 у файл") # Перенаправляємо вивід у файл
print("Пишемо рядок3 у файл") # Перенаправляємо вивід у файл
sys.stdout = tmp_out # Відновлюємо стандартний вивод
print("Пишемо рядок в стандартний вивід")
f.close() # Закрываємо файл
#Прочитаємо файл
f = open(r"file.txt", "r") # Відкриваємо файл на читання
p = f.read()
print(p)
f.close() # Закриваємо файл
