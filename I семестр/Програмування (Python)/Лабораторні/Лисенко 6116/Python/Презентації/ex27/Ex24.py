import os
for (p, d, f) in os.walk("C:\\LECTURE27\\"):
    print("Поточний каталог")
    print(p)
    print("Список каталогів")
    print(d)
    print("Список файлів у каталозі")
    print(f,"\n")

