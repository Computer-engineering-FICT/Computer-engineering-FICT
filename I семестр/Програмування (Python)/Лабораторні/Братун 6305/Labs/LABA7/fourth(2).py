import pickle
import os

try:
    f = open(r'C:/lab5/lab5.txt', 'rb')
    obj = pickle.load(f)
    obj.update({'TestAndrewBratun' : "Bratun"})
    f.close()

    f = open(r'C:/lab5/lab5.txt', 'wb')
    pickle.dump(obj, f)
    f.close()

    os.rename(r'C:/lab5/lab5.txt', r'C:/lab5/new_lab5.txt')
    print("Файл створено і перейменовано")
except:
    print("Файл уже створений!!!")
