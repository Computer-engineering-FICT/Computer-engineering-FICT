import os
for (p, d, f) in os.walk("C:\\LECTURE27\\folder1\\", False):
    for file_name in f: # Видаляємо всі файли
        print(file_name)
        print(os.path.join(p, file_name))
        os.remove(os.path.join(p, file_name))
    for dir_name in d: # Видаляємо всі каталоги
        os.rmdir(os.path.join(p, dir_name))
