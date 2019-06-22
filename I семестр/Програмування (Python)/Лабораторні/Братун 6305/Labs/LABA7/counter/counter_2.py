import os

os.chdir('C:\lab7\Bratun')

def get_line():
    with open( r'v5.txt', "r", encoding="cp1251") as f:
        tmp = f.readlines()
        f.close()
        return tmp


def change():
    core = round(len(fileinline) / 2)
    for i in range(core):
        fileinline[i], fileinline[-i - 1] = fileinline[-i - 1], fileinline[i]


    with open( r'v5.txt', "w", encoding="utf-8") as f:
        for i in fileinline:
            f.write(i)
    f.close()


fileinline = get_line()
change()

os.rename( r'v5.txt', r'v51.txt')
