from tkinter import *
import random
from tkinter import filedialog as fd

def generate_array():
    outputA.delete(0, END)
    outputB.delete(0,END)
    outputC.delete(0, END)
    size_A = int(entr_A.get())
    size_B = int(entr_B.get())
    size_C = int(entr_C.get())
    start_rand = int(range_array1.get())
    end_rand = int(range_array2.get())
    arrayA = {random.randint(start_rand, end_rand) for i in range(size_A)}
    while (len(arrayA)< size_A):
        arrayA.add(random.randint(start_rand,end_rand))
    arrayB = {random.randint(start_rand, end_rand) for i in range(size_B)}
    while (len(arrayB) < size_B):
        arrayB.add(random.randint(start_rand,end_rand))
    arrayC = {random.randint(start_rand, end_rand) for i in range(size_C)}
    while (len(arrayC) < size_C):
        arrayC.add(random.randint(start_rand,end_rand))
    outputA.insert(0, arrayA)
    outputB.insert(0, arrayB)
    outputC.insert(0, arrayC)
    print(str(arrayA))
    print(arrayB)
    print(arrayC)

def manual_input():
    outputA.delete(0, END)
    outputB.delete(0,END)
    outputC.delete(0, END)
    arrayA_man = entr_A1.get()
    arrayB_man = entr_B1.get()
    arrayC_man = entr_C1.get()
    arrayA_man = {int(i) for i in arrayA_man.split(', ')}
    arrayB_man = {int(i) for i in arrayB_man.split(', ')}
    arrayC_man = {int(i) for i in arrayC_man.split(', ')}
    outputA.insert(0, arrayA_man)
    outputB.insert(0, arrayB_man)
    outputC.insert(0, arrayC_man)
    print(arrayA_man)
    print(arrayB_man)
    print(arrayC_man)

def change():
    if r_var.get() == 0:
        generate_array()
    elif r_var.get() == 1:
        manual_input()

def generate_arrayD():
    outputD.delete(0, END)
    arrayA = outputA.get()
    arrayB = outputB.get()
    arrayC = outputC.get()
    arrayA = {int(i) for i in arrayA.replace("{", "").replace("}", "").split(', ')}
    arrayB = {int(i) for i in arrayB.replace("{", "").replace("}", "").split(', ')}
    arrayC = {int(i) for i in arrayC.replace("{", "").replace("}", "").split(', ')}
    arrayD = arrayB ^ arrayC | (arrayB & arrayC) ^ (((arrayA - arrayB) & arrayB) ^ arrayA)
    outputD.insert(0, arrayD)
    print(arrayD)

def extractD():
    file_name = fd.asksaveasfilename(filetypes=(("TXT files", "*.txt"),
                                                ("HTML files", "*.html;*.htm"),
                                                ("All files", "*.*")))
    f = open(file_name, 'w')
    s = outputD.get()
    f.write(s)
    f.close()

def generate_arrayF():
    outputF.delete(0, END)
    copyD = outputD.get()
    copyD2 = {int(i) for i in copyD.replace("{", "").replace("}", "").split(', ')}
    rangeF = len(copyD2)
    minD = min(copyD2)
    maxD = max(copyD2)
    arrayF = {random.randint(minD, maxD) for i in range(rangeF)}
    while (len(arrayF) < len(copyD2)):
        arrayF.add(random.randint(minD,maxD))
    print(arrayF)
    arrayF.remove(min(arrayF))
    arrayF.remove(max(arrayF))
    arrayF.add(minD)
    arrayF.add(maxD)
    print(arrayF)
    outputF.insert(0, arrayF)

def generate_arrayX():
    outputX.delete(0, END)
    copyD = outputD.get()
    copyD2 = {int(i) for i in copyD.replace("{", "").replace("}", "").split(', ')}
    copyF = outputF.get()
    copyF2 = {int(i) for i in copyF.replace("{", "").replace("}", "").split(', ')}
    arrayX = copyF2 - copyD2
    outputX.insert(0, arrayX)

def extractX():
    file_name = fd.asksaveasfilename(filetypes=(("TXT files", "*.txt"),
                                                ("HTML files", "*.html;*.htm"),
                                                ("All files", "*.*")))
    f = open(file_name, 'w')
    s = outputX.get()
    f.write(s)
    f.close()



root = Tk()
root.title('Генерация множеств')
w = root.winfo_screenwidth()
h = root.winfo_screenheight()
w = w // 2
h = h // 2
w = w - 675
h = h - 400
root.geometry('1350x800+{}+{}'.format(w, h))
root.configure(bg='#F8F8FF')

Label(root, width=15, height=2, bg='#AFEEEE', text='Ф. И. О.: ', relief="solid").grid(row=0, column=0, pady=5)
Label(root, width=20, height=2, bg='#FFFFFF', text='Тарасенко Юлия',
      relief="groove").grid(row=0, column=1, pady=5, padx=(0, 150))
Label(root, width=15, height=2, bg='#AFEEEE', text='Номер группы:',
      relief="solid").grid(row=1, column=0, pady=5)
Label(root, width=20, height=2, bg='#FFFFFF', text='ІО-82',
      relief="groove").grid(row=1, column=1, pady=5, padx=(0, 150))
Label(root, width=15, height=2, bg='#AFEEEE', text='Номер в списке:',
      relief="solid").grid(row=2, column=0, pady=5)
Label(root, width=20, height=2, bg='#FFFFFF', text='22',
      relief="groove").grid(row=2, column=1, pady=5, padx=(0, 150))

Label(root, width=20, height=2, bg='#AFEEEE', text='Множество А:',
      relief="solid").grid(row=1, column=2, pady=5)
entr_A = Entry(root, width=30, relief="groove")
entr_A.grid(row=1, column=3, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество B:',
      relief="solid").grid(row=2, column=2, pady=5)
entr_B = Entry(root, width=30, relief="groove")
entr_B.grid(row=2, column=3, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество C:',
      relief="solid").grid(row=3, column=2, pady=5)
entr_C = Entry(root, width=30, relief="groove")
entr_C.grid(row=3, column=3, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Диапазон чисел:',
      relief="solid").grid(row=4, column=2, pady=5)
range_array1 = Entry(root, width=30, relief="groove")
range_array1.grid(row=4, column=3, pady=5, ipady=2, padx=(2, 150))
range_array2 = Entry(root, width=30, relief="groove")
range_array2.grid(row=5, column=3, pady=5, ipady=2, padx=(2, 150))

Label(root, width=20, height=2, bg='#AFEEEE', text='Множество А:',
      relief="solid").grid(row=1, column=4, pady=5)
entr_A1 = Entry(root, width=30, relief="groove")
entr_A1.grid(row=1, column=5, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество B:',
      relief="solid").grid(row=2, column=4, pady=5)
entr_B1 = Entry(root, width=30, relief="groove")
entr_B1.grid(row=2, column=5, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество C:',
      relief="solid").grid(row=3, column=4, pady=5)
entr_C1 = Entry(root, width=30, relief="groove")
entr_C1.grid(row=3, column=5, pady=5, ipady=2, padx=(2, 150))

r_var = BooleanVar()
r_var.set(0)
r1 = Radiobutton(text='Случайная генерация множеств', variable=r_var,
                 value=0, relief="ridge", width=40,
                 height=2, bg='#00CED1').grid(row=0, column=2, pady=5, columnspan=2)
r2 = Radiobutton(text='Ручной ввод множеств', variable=r_var,
                 value=1, relief="ridge",
                 width=40, height=2, bg='#00CED1').grid(row=0, column=4, pady=5, columnspan=2)

Label(root, width=40, height=2, bg='#00CED1', text='Вывод результатов: ',
      relief="ridge").grid(row=8, column=2, pady=5, columnspan=2)
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество А:',
      relief="solid").grid(row=9, column=2, pady=5)
outputA = Entry(root, width=30, relief="groove")
outputA.grid(row=9, column=3, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество B:',
      relief="solid").grid(row=10, column=2, pady=5)
outputB = Entry(root, width=30, relief="groove")
outputB.grid(row=10, column=3, pady=5, ipady=2, padx=(2, 150))
Label(root, width=20, height=2, bg='#AFEEEE', text='Множество C:',
      relief="solid").grid(row=11, column=2, pady=5)
outputC = Entry(root, width=30, relief="groove")
outputC.grid(row=11, column=3, pady=5, ipady=2, padx=(2, 150))

b_generate = Button(text="Сгенерировать множества", width=40, height=2,
                    bg='#00BFFF', relief="raised", command=change).grid(row=7, column=2, pady=5, columnspan=2)

Label(root, width=40, height=2, bg='#00CED1', text='Множество D:',
      relief="ridge").grid(row=12, column=0, pady=5, columnspan=2)
imD = PhotoImage(file="arrayD.png")
Label(root, image=imD, relief="ridge").grid(row=13, column=0, pady=5, columnspan=2)

b_arrayD = Button(text="Сгенерировать множество D", width=40, height=2,
                  bg='#00BFFF', relief="raised", command=generate_arrayD).grid(row=14, column=0, pady=5, columnspan=2)

outputD = Entry(root, width=60, relief="solid")
outputD.grid(row=15, column=0, pady=5, ipady=2, columnspan=2)

b_saveD = Button(text="Сохранить множество D", width=40, height=2,
                 bg='#00BFFF', relief="raised", command=extractD).grid(row=16, column=0, pady=5, columnspan=2)

Label(root, width=40, height=2, bg='#00CED1', text='Множество F:',
      relief="ridge").grid(row=12, column=2, pady=5, columnspan=2)
b_arrayF = Button(text="Сгенерировать множество F", width=40, height=2,
                  bg='#00BFFF', relief="raised", command=generate_arrayF).grid(row=13, column=2, pady=5, columnspan=2)
outputF = Entry(root, width=60, relief="solid")
outputF.grid(row=14, column=2, pady=5, ipady=2, columnspan=2)

Label(root, width=40, height=2, bg='#00CED1', text='Множество X:',
      relief="ridge").grid(row=12, column=4, pady=5, columnspan=2)
imX = PhotoImage(file="arrayX.png")
Label(root, image=imX, relief="ridge").grid(row=13, column=4, pady=5, columnspan=2)
outputX = Entry(root, width=60, relief="solid")
outputX.grid(row=15, column=4, pady=5, ipady=2, columnspan=2)
b_arrayX = Button(text="Сгенерировать множество X", width=40, height=2,
                  bg='#00BFFF', relief="raised", command=generate_arrayX).grid(row=14, column=4, pady=5, columnspan=2)
b_saveX = Button(text="Сохранить множество X", width=40, height=2,
                 bg='#00BFFF', relief="raised", command=extractX).grid(row=16, column=4, pady=5, columnspan=2)

root.mainloop()
