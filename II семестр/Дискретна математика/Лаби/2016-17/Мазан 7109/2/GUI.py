from tkinter import *
from tkinter import messagebox
from pickle import load, Pickler
from os import mkdir
import Names, Data
from Algorythms import *

class window_1(Frame):
    def __init__(self,master = None):
        self.sets = Data.sets()
        super().__init__(master)
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.button_screen2 = Button(self, text = "Вікно 2",width = 6,command = self.show_window_2)
        self.button_screen3 = Button(self, text = "Вікно 3",width = 6,command = self.show_window_3)
        self.button_screen4 = Button(self, text = "Вікно 4",width = 6,command = self.show_window_4)

        self.button_student_info = Button(self, text = "Інформація про студента",width = 25,command = self.show_info)

        self.button_screen2.grid(row = 0, column = 1)
        self.button_screen3.grid(row =0,column = 2)
        self.button_screen4.grid(row = 0,column = 3)

        self.button_student_info.grid(row = 1, column = 1, columnspan = 3)

    def show_window_2(self):
        self.window_2 = window_2(self.sets,self)

    def show_window_3(self):
        self.window_3 = window_3(self.sets,self)

    def show_window_4(self):
        self.window_4 = window_4(self)

    def show_result(self):
        pass

    def show_info(self):
        messagebox.showinfo("Інформація", "Студент групи ІВ-71\n"
                                          "Мазан Ян Владиславович\n"
                                          "№ у списку групи: 9\n"
                                          "Варіант № 21")



class window_2(Toplevel):
    def __init__(self,data,master = None):
        super().__init__(master)
        self.names = Names.names()
        self.A = []
        self.B = []
        self.sets = data
        self.create_widgets()

    def create_widgets(self):
        self.f_inscription = Label(self, text = "Жіночі імена")
        self.m_inscription = Label(self, text = "Чоловічі імена")
        self.f_names_list = Listbox(self, height = len(Names.names().male_names), selectmode = SINGLE)
        self.m_names_list = Listbox(self, height = len(Names.names().fem_names), selectmode = SINGLE)
        self.button_write_a = Button(self, text = "Записати в A",width = 36, command = self.write_A)
        self.button_write_b = Button(self, text = "Записати в B",width = 36, command = self.write_B)
        self.write_to_file = Button(self, text = "Записати до файлу",width = 16, command = self.write_to_file)
        self.read_from_file = Button(self, text = "Зчитати з файлу",width = 16, command = self.load_from_file)
        self.clear_A = Button(self, text = "Очистити A",width = 16, command = self.clear_A)
        self.clear_B = Button(self, text = "Очистити B",width = 16, command = self.clear_B)

        for i in range(len(self.names.fem_names)):
            self.f_names_list.insert(END,self.names.fem_names[i])
        for i in range(len(self.names.male_names)):
            self.m_names_list.insert(END,self.names.male_names[i])

        self.f_inscription.grid(row=0, column=1)
        self.m_inscription.grid(row=0, column=2)
        self.f_names_list.grid(row=1, column=1)
        self.m_names_list.grid(row=1, column=2)
        self.button_write_a.grid(row=2, column=1, columnspan=2)
        self.button_write_b.grid(row=3, column=1, columnspan=2)
        self.write_to_file.grid(row=5, column=1)
        self.read_from_file.grid(row=5, column=2)
        self.clear_A.grid(row=7, column=1)
        self.clear_B.grid(row=7, column=2)

    def update(self):
        self.sets.write(self.A,self.B)

    def write_A(self):
        try:
            self.A.append(self.names.fem_names[self.f_names_list.curselection()[0]])
        except: pass
        try:
            self.A.append(self.names.male_names[self.m_names_list.curselection()[0]])
        except: pass
        self.update()

    def write_B(self):
        try:
            self.B.append(self.names.fem_names[self.f_names_list.curselection()[0]])
        except: pass
        try:
            self.B.append(self.names.male_names[self.m_names_list.curselection()[0]])
        except: pass
        self.update()

    def write_to_file(self):
        try: mkdir(r"Sets")
        except: pass
        filename = [r"A",r"B"]
        sets = [self.A,self.B]
        for i in zip(filename,sets):
            with open(r"Sets/"+i[0],"wb") as file:
                pkl = Pickler(file)
                pkl.dump(i[1])

    def load_from_file(self):
        try:
            with open(r"Sets/A", "rb") as file_A:
                self.A = load(file_A)
        except: pass
        try:
            with open(r"Sets/B", "rb") as file_B:
                self.B = load(file_B)
        except: pass
        self.update()

    def clear_A(self):
        self.A = []
        self.update()

    def clear_B(self):
        self.B = []
        self.update()

class window_3(Toplevel):
    def __init__(self,sets,master = None):
        super().__init__(master)
        self.sets = sets
        self.A = self.sets.read("A")
        self.B = self.sets.read("B")
        try:
            self.relations = algorythms(self.A,self.B)
            self.relations = algorythms(self.A,self.B)
            self.rel_R = self.relations.relation_R
            self.rel_S = self.relations.relation_S
            self.save()
            self.create_widgets()
        except:
            super().destroy()

    def save(self):
        try: mkdir(r"Relations")
        except: pass
        with open(r"Relations/A","wb") as file:
            pkl = Pickler(file)
            pkl.dump(self.A)
        with open(r"Relations/B","wb") as file:
            pkl = Pickler(file)
            pkl.dump(self.B)
        with open(r"Relations/R","wb") as file:
            pkl = Pickler(file)
            pkl.dump(self.rel_R)
        with open(r"Relations/S","wb") as file:
            pkl = Pickler(file)
            pkl.dump(self.rel_S)

    def create_widgets(self):
        self.A_inscription = Label(self, text = "Множина А")
        self.B_inscription = Label(self, text = "Множина B")
        self.A_list = Listbox(self, height = 10)
        self.B_list = Listbox(self, height = 10)
        self.draw_R = Button(self, text = "Відношення R", command = self.graph_R)
        self.draw_S = Button(self, text = "Відношення S", command = self.graph_S)

        for i in self.A:
            self.A_list.insert(END,i)
        for i in self.B:
            self.B_list.insert(END,i)

        self.A_inscription.grid(row = 0, column = 1)
        self.B_inscription.grid(row = 0, column = 2)
        self.A_list.grid(row = 1, column = 1)
        self.B_list.grid(row = 1, column = 2)
        self.draw_R.grid(row = 2, column = 2)
        self.draw_S.grid(row = 2, column = 1)

    def graph_R(self):
        try:
            R = graphs_gen(self.A,self.B,self.rel_R)
            R.draw()
        except: pass

    def graph_S(self):
        try:
            S = graphs_gen(self.A,self.B,self.rel_S)
            S.draw()
        except: pass


class window_4(Toplevel):
    def __init__(self,master = None):
        super().__init__(master)
        try:
            with open(r"Relations/A" ,"rb") as f:
                self.A = load(f)
            with open(r"Relations/B" ,"rb") as f:
                self.B = load(f)
            with open(r"Relations/R" ,"rb") as f:
                self.rel_R = load(f)
            with open(r"Relations/S" ,"rb") as f:
                self.rel_S = load(f)
            self.algor = algorythms(self.A,self.B)
            self.create_widgets()
        except:
            super().destroy()

    def create_widgets(self):
        self.relations_union = Button(self, text = "R∪S",width = 10, command = self.union)
        self.relations_intersection = Button(self, text = "R∩S",width = 10, command = self.intersection)
        self.relations_difference = Button(self, text = "R\S",width = 10, command = self.difference)
        self.relations_inversion = Button(self, text = "U\R",width = 10, command = self.complement)
        self.relations_reversed = Button(self, text = "S^(-1)",width = 23, command = self.inversion_S)

        self.relations_union.grid(row = 1, column = 1)
        self.relations_intersection.grid(row = 1, column = 2)
        self.relations_difference.grid(row = 2, column = 1)
        self.relations_inversion.grid(row = 2, column = 2)
        self.relations_reversed.grid(row = 3, column = 1, columnspan = 2)

    def union(self):
        result = self.algor.union(self.rel_R,self.rel_S)
        graph = graphs_gen(self.A,self.B,result)
        graph.draw()

    def intersection(self):
        result = self.algor.intersection(self.rel_R,self.rel_S)
        graph = graphs_gen(self.A,self.B,result)
        graph.draw()

    def difference(self):
        result = self.algor.difference(self.rel_R,self.rel_S)
        graph = graphs_gen(self.A,self.B,result)
        graph.draw()

    def complement(self):
        result = self.algor.complement(self.algor.universal,self.rel_R)
        graph = graphs_gen(self.A,self.B,result)
        graph.draw()

    def inversion_S(self):
        result = self.algor.inverted_relation(self.rel_S)
        graph = graphs_gen(self.A,self.B,result)
        graph.draw()
