from tkinter import *
from tkinter import messagebox
import random
import copy
relation_S_plus_R = []
def create_window_3():

   #Create Toplevel for window 2
   window3 = Toplevel()
   window3.title("Window 3")
   '''
   window2.maxsize(width=475,height=290)
   window2.minsize(width=475,height=290)
    '''

   list1=["Вікторія","Світлана","Марія","Анна","Дарина","Катерина","Людмила","Зоя","Аліна","Олена","Юлія","Лариса","Анастасія","Антоніна","Оксана","Галина","Тетяна","Василина","Валентина","Інна"]
   list2=["Андрій","Петро","Ігор","Віктор","Антон","Євген","Дмитро","Вадим","Олександр","Віталій","Богдан","Павел","Сергій","Микола","Володимир","Юрій","Олег","Михайло","Семен","Чіпка"]

   #Labels
   lab1 = Label(window3, text='Set A', font='arial 20')
   lab2 = Label(window3, text='Set B', font='arial 20')

   #Listbox
   listbox1 = Listbox(window3, height=5,width=15, font=("Arial", 16), selectmode=EXTENDED)
   listbox2 = Listbox(window3, height=5,width=15, font=("Arial", 16), selectmode=EXTENDED)




   #Labels
   lab1.grid(row=1, column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=1, column=2, sticky=W+E+N+S, pady=5, padx=5)


   #Listbox
   listbox1.grid(row=2, column=1, sticky=W+E+N+S, pady=5, padx=5)
   listbox2.grid(row=2, column=2, sticky=W+E+N+S, pady=5, padx=5)





   f1 = open(r"Set A.txt", "r", encoding="UTF-8")
   set_A = f1.read().split(" ")
   f2 = open(r"Set B.txt", "r", encoding="UTF-8")
   set_B = f2.read().split(" ")


   ######################################RELATION S####################################################################
   set_B_use = copy.copy(set_B)
   relation_S = []
   try:
      for i in set_A[:-1]:
         if i in list1:
             deti = random.randint(1,3)
             for j in range(1,deti+1):
                  rebenok = random.choice(set_B_use[:-1])
                  if rebenok not in list1:
                     del set_B_use[set_B_use.index(rebenok)]
                     printer = i,rebenok

                     relation_S.append(printer)
                  else:continue
         else:continue
   except:print('')

   all1 = []
   for i in set_A[:-1]:
      for j in set_B[:-1]:
         p = i,j
         all1.append(p)
   topp = []
   for i in relation_S:
      topp.append(i[0])
   leftt = []
   for j in relation_S:
      leftt.append(j[1])
   score = []
   for i in all1:
         if i in relation_S:
            score.append(1)
         else:score.append(0)



   r1 = len(set_A[:-1])
   c1 = len(set_B[:-1])
   with open(r"Relation S.txt", "w", encoding="UTF-8") as f:
       for i in relation_S:
         f.write(str(i))




   def callback():
      top = Toplevel(height=500, width=100, relief = GROOVE)
      top.title("Relation S")
      calc = 0
      lab3 = Label(top, text="Relation S", font='arial 14')
      lab3.grid(row=0, column=0)
      z = 1
      f = 1
      for m in list(set_A[:-1]):
         lb = Label(top, text=m, font='arial 14')
         lb.grid(row=z, column=0)
         z += 1
      for n in list(set_B[:-1]):
         lb = Label(top, text=n, font='arial 14')
         lb.grid(row=0, column=f)
         f += 1
      for r in range(r1):
         for c in range(c1):
            lb = Label(top, text=score[calc], font='arial 14')
            lb.grid(row=r+1, column=c+1)
            calc += 1

   but1 = Button(window3, text="Relation S",command=callback, width=10,  font=("Arial", 20))
   but1.grid(row=3, column=1, sticky=W+E+N+S, pady=5, padx=5)


   ######################################RELATION R####################################################################
   relation_R = []
   women_in_A = []
   women_in_B = []
   men_in_A = []
   men_in_B = []
   set_A_use1 = copy.copy(set_A)
   set_B_use1 = copy.copy(set_B)
   set_A_use2 = copy.copy(set_A)
   set_B_use2 = copy.copy(set_B)

   for i in set_A_use1[:-1]:
      if i in list1:
         women_in_A.append(i)
   for j in set_B_use1[:-1]:
      if j in list1:
         women_in_B.append(j)

   for k in set_A_use2[:-1]:
      if k in list2:
         men_in_A.append(i)
   for u in set_B_use2[:-1]:
      if u in list2:
         men_in_B.append(j)

   women_in_A1 = copy.deepcopy(women_in_A)
   women_in_A2 = copy.deepcopy(women_in_A)
   women_in_B1 = copy.deepcopy(women_in_B)
   women_in_B2 = copy.deepcopy(women_in_B)
   men_in_B1 = copy.deepcopy(men_in_B)
   men_in_B2 = copy.deepcopy(men_in_B)
   men_in_A1 = copy.deepcopy(men_in_A)
   men_in_A2 = copy.deepcopy(men_in_A)

   shoto = random.randint(1,4)
   for i in range(shoto):
      p = random.choice(women_in_A1)
      p1 = random.choice(men_in_B2)
      add = (p,p1)
      if add not in relation_S:
         relation_R.append(add)
         del women_in_A1[women_in_A1.index(p)]
         del men_in_B2[men_in_B2.index(p1)]
      else:continue

   for i in range(shoto):
      p = random.choice(women_in_A2)
      p1 = random.choice(men_in_A1)
      add = (p,p1)
      if add not in relation_S:
         relation_R.append(add)
         del women_in_A2[women_in_A2.index(p)]
         del men_in_A1[men_in_A1.index(p1)]
      else:continue


   if len(women_in_A) >= len(women_in_B):
      for i in range(len(women_in_B)):
         sister1 = random.choice(women_in_B)
         sister2 = random.choice(women_in_A)
         p = (sister2,sister1)
         relation_R.append(p)
         del women_in_B[women_in_B.index(sister1)]
         del women_in_A[women_in_A.index(sister2)]
   else:
      for i in range(len(women_in_A)):
         sister1 = random.choice(women_in_B)
         sister2 = random.choice(women_in_A)
         p = (sister2,sister1)
         relation_R.append(p)
         del women_in_B[women_in_B.index(sister1)]
         del women_in_A[women_in_A.index(sister2)]




   with open(r"Relation R.txt", "w", encoding="UTF-8") as f:
       for i in relation_R:
         f.write(str(i) + " ")


   all2 = []
   for i in set_A[:-1]:
      for j in set_B[:-1]:
         p = i,j
         all2.append(p)
   score1 = []
   for i in all2:
         if i in relation_R:
            score1.append(1)
         else:score1.append(0)


   def callback1():
      top = Toplevel(height=500, width=100, relief = GROOVE)
      top.title("Relation R")
      calc = 0
      lab3 = Label(top, text="Relation R", font='arial 14')
      lab3.grid(row=0, column=0)
      z = 1
      f = 1
      for m in list(set_A[:-1]):
         lb = Label(top, text=m, font='arial 14')
         lb.grid(row=z, column=0)
         z += 1
      for n in list(set_B[:-1]):
         lb = Label(top, text=n, font='arial 14')
         lb.grid(row=0, column=f)
         f += 1
      for r in range(r1):
         for c in range(c1):
            lb = Label(top, text=score1[calc], font='arial 14')
            lb.grid(row=r+1, column=c+1)
            calc += 1

   but1 = Button(window3, text="Relation R",command=callback1, width=10,  font=("Arial", 20))
   but1.grid(row=3, column=2, sticky=W+E+N+S, pady=5, padx=5)

   global relation_S_plus_R
   relation_S_plus_R = relation_S + relation_R
   global relation_S_on_R
   relation_S_on_R = []
   for i in relation_S:
      if i in relation_R:
         relation_S_on_R.append(i)

   global relation_R_diff_S
   relation_R_diff_S = []
   for i in relation_R:
      if i not in relation_S:
         relation_R_diff_S.append(i)

   global relation_U_diff_R
   relation_U_diff_R = []
   for i in all1:
      if i not in relation_R:
         relation_U_diff_R.append(i)

   global s_tra
   s_tra = []
   s_tra = relation_S

   for i in set_A[:-1]:
      listbox1.insert(END, i)
   for i in set_B[:-1]:
      listbox2.insert(END, i)



