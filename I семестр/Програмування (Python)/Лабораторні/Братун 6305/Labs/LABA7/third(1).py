import os

os.chdir('C:\lab7\Bratun')
try:
    def get_line():
        with open(r'5.txt', "r", encoding="cp1251") as f:
            tmp = f.readlines()
            f.close()
            return tmp


    def change():
        core = round(len(fileinline) / 2)
        for i in range(core):
            fileinline[i], fileinline[-i - 1] = fileinline[-i - 1], fileinline[i]


        with open(r'5.txt', "w", encoding="utf-8") as f:
            for i in fileinline:
                f.write(i)
        f.close()



    fileinline = get_line()
    change()

    os.rename(r'5.txt', r'51.txt')
except FileNotFoundError:
    print("Файла немає")
