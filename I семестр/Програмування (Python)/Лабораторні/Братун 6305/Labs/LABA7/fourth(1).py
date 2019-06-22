import pickle
import LABA5.Ex1
import shutil

f = open('lab5.txt', 'wb')
pickle.dump(LABA5.Ex1.a, f)
f.close()
try:
    shutil.move('lab5.txt', r'C:\\lab5\\')
    print("Файл переміщено")
except:
    print('Файл уже існує!!!!!')
