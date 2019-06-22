import os
def creating_file():
    file = open(r"C:\Andrew\asd\file.txt", "w")
    file.close()

def add_line(name, valu):
    file = open(r"C:\Andrew\asd\file.txt", "a")
    file.write("{:^10} {:^10}\n".format(name, str(valu)))
    file.close()

def del_line(name):
    file = open(r"C:\Andrew\asd\file.txt", "r")
    file1 = open(r"C:\Andrew\asd\file1.txt", "w")
    for line in file:
        if "{:^10}".format(name) in line:
            pass
        else:
            file1.write(line)
    file.close()
    os.remove(r"C:\Andrew\asd\file.txt")
    file1.close()
    os.rename(r"C:\Andrew\asd\file1.txt" , r"C:\Andrew\asd\file.txt")

string = str()
valu = int()
creating_file()
while string != "stop":
    string = str(input("Введіть назву для добавляння рядка або stop для зупинки: "))
    if string != "stop":
        valu = int(input("Введіть число: "))
        add_line(string, valu)
while string != "break":
    string = str(input("Введіть назву для видалення рядка або break для зупинки: "))
    if string != "break":
        del_line(string)





















































