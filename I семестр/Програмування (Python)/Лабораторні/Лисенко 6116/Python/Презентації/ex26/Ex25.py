import sys,os
if  sys.stdin.isatty():
    print("We use TTY")
f = open(os.path.abspath("C:/LECTURE26/file.txt"), "r")
tmp_in = sys.stdin # Зберігаємо посилання на sys.stdin
sys.stdin = f  # Перенаправляємо ввід
if  not sys.stdin.isatty():
    print("We use file", f.name)
sys.stdin = tmp_in # Відновлюємо стандартний ввід
f.close() # Закриваємо файл
