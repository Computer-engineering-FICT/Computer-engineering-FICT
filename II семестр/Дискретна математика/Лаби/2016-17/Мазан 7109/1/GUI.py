from tkinter import *
from tkinter import messagebox, ttk
import EntryAnalysis, Calculations, SetsCreation, SetsData
import os.path

class window_1(Frame):
    def __init__(self,master = None):
        super().__init__(master)
        self.pack()
        self.Data = SetsData.Datas()
        self.create_widgets()

    def create_widgets(self):
        self.button_screen2 = Button(self, text = "Вікно 2", command = self.show_window2)
        self.button_screen3 = Button(self, text = "Вікно 3", command = self.show_window3)
        self.button_screen4 = Button(self, text = "Вікно 4", command = self.show_window4)
        self.button_screen5 = Button(self, text = "Вікно 5", command = self.show_window5)

        self.button_student_info = Button(self, text = "Інформація про студента", command = self.info_me)
        self.button_result = Button(self, text = "Вивести результат", command = self.show_result)

        self.inscription_random = Label(self, text = "Випадкова генерація")
        self.Entry_name_1 = Label(self, text = "Потужність множини A")
        self.Entry_1 = Entry(self)
        self.Entry_name_2 = Label(self,text = "Потужність множини B")
        self.Entry_2 = Entry(self)
        self.Entry_name_3 = Label(self,text = "Потужність множини C")
        self.Entry_3 = Entry(self)
        self.Entry_name_4 = Label(self,text = "Діапазон для універсальної множини (найменше і найбільше значення через пробіл)", wraplength = 150)
        self.Entry_4 = Entry(self)

        self.inscription = Label(self, text = "Введення вручну")
        self.Entry_by_hand1 = Label(self, text = "Ввести елементи A (через пробіли)", wraplength = 150)
        self.Entry_by_hand2 = Label(self, text = "Ввести елементи B (через пробіли)", wraplength = 150)
        self.Entry_by_hand3 = Label(self, text = "Ввести елементи C (через пробіли)", wraplength = 150)
        self.Entry_21 = Entry(self)
        self.Entry_22 = Entry(self)
        self.Entry_23 = Entry(self)
        self.Activate_entry = Button(self, text = "Завершити введення", command = self.generate_sets)
        self.output_name = Label(self)
        self.output = Label(self)

        self.Activate_entry.grid(row = 14, column = 1, columnspan = 4)

        self.button_screen2.grid(row = 0, column = 1)
        self.button_screen3.grid(row = 0, column = 2)
        self.button_screen4.grid(row = 0, column = 3)
        self.button_screen5.grid(row = 0, column = 4)

        self.button_student_info.grid(row = 1, column = 1, columnspan = 4)
        self.button_result.grid(row = 2, column = 1, columnspan = 4)

        self.Entry_name_4.grid(row=3, column=1, columnspan=2)
        self.Entry_4.grid(row = 3,column=3,columnspan=2)

        self.inscription_random.grid(row = 4, column = 1, columnspan = 4)
        self.Entry_name_1.grid(row=5,column=1,columnspan=2)
        self.Entry_name_2.grid(row=6, column=1, columnspan=2)
        self.Entry_name_3.grid(row=7, column=1, columnspan=2)
        self.Entry_1.grid(row = 5,column=3,columnspan=2)
        self.Entry_2.grid(row = 6,column=3,columnspan=2)
        self.Entry_3.grid(row = 7,column=3,columnspan=2)

        self.inscription.grid(row = 9,column = 1, columnspan = 4)
        self.Entry_by_hand1.grid(row=10, column = 1, columnspan = 2)
        self.Entry_by_hand2.grid(row=11, column = 1, columnspan = 2)
        self.Entry_by_hand3.grid(row=12, column = 1, columnspan = 2)
        self.Entry_21.grid(row =10, column = 3, columnspan = 2)
        self.Entry_22.grid(row =11, column = 3, columnspan = 2)
        self.Entry_23.grid(row =12, column = 3, columnspan = 2)

        self.output_name.grid(row = 15, column = 1, sticky = "w")
        self.output.grid(row = 15, column = 1, columnspan = 4, sticky = "s")

    def generate_sets(self):
        try:
            if (self.Entry_1.get() or self.Entry_2.get() or self.Entry_3.get()) and (self.Entry_21.get() or self.Entry_22.get() or self.Entry_21.get()):
                raise AssertionError

            try:
                range_Universal_set = [int(i) for i in self.Entry_4.get().split(" ")]
                Universal_set = EntryAnalysis.Sets_Analysing.get_universal_set([int(range_Universal_set[0]),int(range_Universal_set[1])])
            except:
                messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для універсальної множини. Скоріше всього не натуральні числа.")
                return

            #Введення випадково
            if self.Entry_1.get() and self.Entry_2.get() and self.Entry_3.get():
                try:
                    size_A = int(self.Entry_1.get())
                    set_A = EntryAnalysis.Sets_Analysing.get_usual_set(size_A,Universal_set)
                except:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для A. Скоріше всього не натуральні числа або розмір універсальної множини замалий.")
                    return
                try:
                    size_B = int(self.Entry_2.get())
                    set_B = EntryAnalysis.Sets_Analysing.get_usual_set(size_B,Universal_set)
                except:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для B. Скоріше всього не натуральні числа або розмір універсальної множини замалий.")
                    return
                try:
                    size_C = int(self.Entry_3.get())
                    set_C = EntryAnalysis.Sets_Analysing.get_usual_set(size_C,Universal_set)
                except:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для C. Скоріше всього не натуральні числа або розмір універсальної множини замалий.")
                    return
                try:
                    self.Data.write(set_A, set_B, set_C, Universal_set)
                    self.output.config(text = "Множини згенеровані")
                except:
                    pass

            #Введення вручну

            if self.Entry_21.get() and self.Entry_22.get() and self.Entry_21.get():
                try:
                    set_A = EntryAnalysis.Sets_Analysing.set_hand_creation([int(i) for i in self.Entry_21.get().split(" ")])
                except:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для A. Скоріше всього не натуральні числа або розмір універсальної множини замалий.")
                    return
                try:
                    set_B = EntryAnalysis.Sets_Analysing.set_hand_creation([int(i) for i in self.Entry_22.get().split(" ")])
                except:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для B. Скоріше всього не натуральні числа або розмір універсальної множини замалий.")
                    return
                try:
                    set_C = EntryAnalysis.Sets_Analysing.set_hand_creation([int(i) for i in self.Entry_23.get().split(" ")])
                except:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні вхідні дані для C. Скоріше всього не натуральні числа або розмір універсальної множини замалий.")
                    return
                try:
                    self.Data.write(set_A, set_B, set_C, Universal_set)
                except:
                    pass

        except AssertionError:
            messagebox.showinfo("Помилка","Ви повинні або згенерувати множину випадково, або ручним введенням. Не одночасно!")

    def show(self):
        self.window = Tk()
        self.window.mainloop()

    def show_window2(self):
        self.window2 = window_2(self.Data, self)

    def show_window3(self):
        self.window3 = window_3(self.Data, self)

    def show_window4(self):
        self.window4 = window_4(self.Data, self)

    def show_window5(self):
        self.window5 = window_5(self.Data, self)

    def info_me(self):
        messagebox.showinfo("Інформація про мене",
        """Студент: Мазан Ян Владиславович
        \nГрупа: ІВ-71
        \nНомер у списку групи: 9""")

    def show_result(self):
        try:
            A = self.Data.set_A.copy()
            B = self.Data.set_B.copy()
            C = self.Data.set_C.copy()
            Universal = self.Data.Universal_set.copy()
            self.output_name.config(text = "D: ")
            self.output.config(text = str(Calculations.calculate_simplified(A,B,C,Universal)))
        except:
            self.output_name.config(text = "D: ")
            self.output.config(text = "{}")


#Довгий вираз
class window_2(Toplevel):
    def __init__(self,data,master = None):
        super().__init__(master)
        self.Data = data
        self.create_widgets()
        self.steps_counter = 0

    def create_widgets(self):
        self.title("Вікно 2 - повний вираз")
        self.Set_A = Button(self, text = "Елементи А", command = self.show_A)
        self.Set_B = Button(self, text = "Елементи B", command = self.show_B)
        self.Set_C = Button(self, text = "Елементи C", command = self.show_C)
        self.Universal_set = Button(self, text = "Універсальна множина", command = self.show_Universal)
        self.Step_calculation = Button(self, text = "Наступний крок", command = self.step_execution)
        self.Result = Button(self, text = "Результат", command = self.show_result)
        self.Save = Button(self, text = "Зберегти у файл", command = self.save)
        self.Set_A.grid(row = 0, column = 0)
        self.Set_B.grid(row = 0, column = 1)
        self.Set_C.grid(row = 0, column = 2)
        self.Universal_set.grid(row = 0, column = 3)
        self.Step_calculation.grid(row = 1, column = 0)
        self.Result.grid(row = 1, column = 1, columnspan = 2)
        self.Save.grid(row = 1, column = 3)
        self.showing_set = Label(self, text = "")
        self.showing_set.grid(row = 2, column = 0, columnspan = 3, sticky = "w")

    def close(self):
        self.destroy()

    def show_A(self):
        self.showing_set.config(text = "A: " + str(self.Data.set_A))

    def show_B(self):
        self.showing_set.config(text = "B: " + str(self.Data.set_B))

    def show_C(self):
        self.showing_set.config(text = "C: " + str(self.Data.set_C))

    def show_Universal(self):
        self.showing_set.config(text = "U: " + str(self.Data.Universal_set))

    def show_result(self):
        try:
            A = self.Data.set_A.copy()
            B = self.Data.set_B.copy()
            C = self.Data.set_C.copy()
            Universal = self.Data.Universal_set.copy()
        except:
            return
        self.showing_set.config(text = "D: " + str(Calculations.calculate_full(A, B, C, Universal)))


    def save(self):
        window_2_file = open(os.path.abspath(r"Results/Result of long calculation"), mode = "w")
        try:
            window_2_file.write("D: " + str(Calculations.calculate_full(self.Data.set_A.copy(), self.Data.set_B.copy(), self.Data.set_C.copy(), self.Data.Universal_set.copy())))
        except:
            window_2_file.write("D: None")
        finally:
            self.showing_set.config(text = "Записано у файл ~/Results/Result of long calculation")
            window_2_file.close()

    def step_execution(self):
        try:
            A = self.Data.set_A.copy()
            B = self.Data.set_B.copy()
            C = self.Data.set_C.copy()
            Universal = self.Data.Universal_set.copy()
        except:
            return
        Operations = [Calculations.operation_long1,Calculations.operation_long2,Calculations.operation_long3,Calculations.operation_long4,Calculations.operation_long5,Calculations.operation_long6]
        for k in Operations:
            if Operations.index(k)==self.steps_counter:
                self.showing_set.config(text = k(A,B,C,Universal)[0] + ": " + str(k(A,B,C,Universal)[1]))
                break
        self.steps_counter+=1


#Спрощений вираз
class window_3(Toplevel):
    def __init__(self, data, master = None):
        super().__init__(master)
        self.Data = data
        self.create_widgets()
        self.steps_counter = 0

    def create_widgets(self):
        self.title("Вікно 3 - спрощений вираз")
        self.Set_A = Button(self, text = "Елементи А", command = self.show_A)
        self.Set_B = Button(self, text = "Елементи B", command = self.show_B)
        self.Set_C = Button(self, text = "Елементи C", command = self.show_C)
        self.Universal_set = Button(self, text = "Універсальна множина", command = self.show_Universal)
        self.Step_calculation = Button(self, text = "Наступний крок", command = self.step_execution)
        self.Result = Button(self, text = "Результат", command = self.show_result)
        self.Save = Button(self, text = "Зберегти у файл", command = self.save)
        self.Set_A.grid(row = 0, column = 0)
        self.Set_B.grid(row = 0, column = 1)
        self.Set_C.grid(row = 0, column = 2)
        self.Universal_set.grid(row = 0, column = 3)
        self.Step_calculation.grid(row = 1, column = 0)
        self.Result.grid(row = 1, column = 1, columnspan = 2)
        self.Save.grid(row = 1, column = 3)
        self.showing_set = Label(self, text = "")
        self.showing_set.grid(row = 2, column = 0, columnspan = 3, sticky = "w")

    def show_A(self):
        self.showing_set.config(text = "A: " + str(self.Data.set_A))

    def show_B(self):
        self.showing_set.config(text = "B: " + str(self.Data.set_B))

    def show_C(self):
        self.showing_set.config(text = "C: " + str(self.Data.set_C))

    def show_Universal(self):
        self.showing_set.config(text = "U: " + str(self.Data.Universal_set))

    def show_result(self):
        try:
            A = self.Data.set_A.copy()
            B = self.Data.set_B.copy()
            C = self.Data.set_C.copy()
            Universal = self.Data.Universal_set.copy()
        except:
            return
        self.showing_set.config(text = "D: " + str(Calculations.calculate_simplified(A, B, C, Universal)))


    def save(self):
        window_2_file = open(os.path.abspath(r"Results/Result of simplified calculation"), mode = "w")
        try:
            window_2_file.write("D: " + str(Calculations.calculate_simplified(self.Data.set_A.copy(), self.Data.set_B.copy(), self.Data.set_C.copy(), self.Data.Universal_set.copy())))
        except:
            window_2_file.write("D: None")
        finally:
            self.showing_set.config(text = "Записано у файл ~/Results/Result of simplified calculation")
            window_2_file.close()

    def step_execution(self):
        try:
            A = self.Data.set_A.copy()
            B = self.Data.set_B.copy()
            C = self.Data.set_C.copy()
        except:
            return
        Universal = self.Data.Universal_set.copy()
        Operations = [Calculations.operation_short1,Calculations.operation_short2,Calculations.operation_short3]
        for k in Operations:
            if Operations.index(k)==self.steps_counter:
                self.showing_set.config(text = k(A,B,C,Universal)[0] + ": " + str(k(A,B,C,Universal)[1]))
                break
        self.steps_counter+=1


class window_4(Toplevel):
    def __init__(self,data, master = None):
        super().__init__(master)
        self.Data = data
        self.create_widgets()

    def create_widgets(self):
        self.title("Вікно 4")
        self.Set_X = Button(self, text = "Елементи X", command = self.show_X)
        self.Set_Y = Button(self, text = "Елементи Y", command = self.show_Y)
        self.Result = Button(self, text = "Результат", command = self.show_Result)
        self.Result_write = Button(self, text = "Зберегти Z у файл", command = self.save_Z)
        self.Set_X.grid(row = 0, column = 0)
        self.Set_Y.grid(row = 0, column = 1)
        self.Result.grid(row = 1, column = 0)
        self.Result_write.grid(row = 1, column = 1)
        self.showing_set = Label(self, text = "")
        self.showing_set.grid(row = 2, column = 0, columnspan = 3, sticky = "w")

    def show_X(self):
        try:
            set_X = self.Data.set_C.copy()
        except:
            return
        self.showing_set.config(text = "X: " + str(set_X))

    def show_Y(self):
        try:
            set_Y = self.Data.set_B.copy()
        except:
            return
        self.showing_set.config(text = "Y: " + str(set_Y))

    def show_Result(self):
        try:
            self.set_X = self.Data.set_B.copy()
            self.set_Y = self.Data.set_C.copy()
            self.showing_set.config(text = "Z: " + str(Calculations.calculate_Z(self.set_X,self.set_Y)))
        except:
            self.showing_set.config(text = "Z: None")

    def save_Z(self):
        Z_file = open(os.path.abspath(r"Results/Result of Z calculation"), mode = "w")
        try:
            Z_file.write("Z: " + str(Calculations.calculate_Z(self.set_X,self.set_Y)))
        except:
            Z_file.write("Z: None")
        finally:
            self.showing_set.config(text = "Записано у файл ~/Results/Result of Z calculation")
            Z_file.close()


class window_5(Toplevel):
    def __init__(self,data,master = None):
        super().__init__(master)
        self.Data = data
        self.create_widgets()

    def create_widgets(self):
        self.scan_notsimplified = Button(self, text = "Сканувати результат неспрощеного алгоритму", wraplength = 200, command = self.scan_basicalgorythm)
        self.scan_simplified = Button(self, text = "Сканувати результат спрощеного алгоритму", wraplength = 200, command = self.scan_simplealgorythm)
        self.set_Z = Button(self, text = "Сканувати множину Z", command = self.scan_Z)
        self.Z_calculation = Button(self, text = "Обчислити множину Z", command = self.calculate_Z)
        self.comparison = Button(self, text = "Порівняти результати обчислень", command = self.compare_results)
        self.drop_menu = ttk.Combobox(self, state = "readonly", values = ["D", "Z"])
        self.showing_set = Label(self, text = "")
        self.scan_notsimplified.grid(row = 0, column = 0)
        self.scan_simplified.grid(row = 0, column = 1)
        self.set_Z.grid(row = 1, column = 0)
        self.Z_calculation.grid(row = 1, column = 1)
        self.comparison.grid(row = 2, column =0)
        self.drop_menu.grid(row = 2, column = 1)
        self.showing_set.grid(row = 3, column = 0, columnspan = 2)

    def scan_basicalgorythm(self):
        try:
            with open(os.path.abspath(r"Results/Result of long calculation")) as long_res:
                self.showing_set.config(text = "Сканований результат повного алгор. - " + long_res.readlines()[0])
        except:
            self.showing_set.config(text = "Сканований результат повного алгор. - D: None")

    def scan_simplealgorythm(self):
        try:
            with open(os.path.abspath(r"Results/Result of simplified calculation")) as short_res:
                self.showing_set.config(text = "Сканований результат спрощеного алгор. - " + short_res.readlines()[0])
        except:
            self.showing_set.config(text = "Сканований результат спрощеного алгор. - D: None")

    def scan_Z(self):
        try:
            with open(os.path.abspath(r"Results/Result of Z calculation")) as Z_res:
                self.showing_set.config(text = "Сканований результат - " + Z_res.readlines()[0])
        except:
            self.showing_set.config(text = "Сканований результат - Z: None")

    def calculate_Z(self):
        try:
            self.set_X = self.Data.set_B.copy()
            self.set_Y = self.Data.set_C.copy()
            self.showing_set.config(text = "Обчислена Z: " + str(Calculations.calculate_Z(self.set_X,self.set_Y)))
        except:
            self.showing_set.config(text = "Обчислена Z: None")

    def compare_results(self):
        if self.drop_menu.get() == "D":
            try:
                short_res = open(os.path.abspath(r"Results/Result of simplified calculation"))
                long_res = open(os.path.abspath(r"Results/Result of long calculation"))
                if short_res.readlines()[0] == long_res.readlines()[0]:
                    self.showing_set.config(text = "Результати обчислення D збігаються")
                else:
                    self.showing_set.config(text = "Результати обчислення D не збігаються")
            except:
                self.showing_set.config(text = "Результати обчислення D не збігаються")
        elif self.drop_menu.get() == "Z":
            try:
                Z_res = open(os.path.abspath(r"Results/Result of Z calculation"))
                set_Z = str(Calculations.calculate_Z(self.set_X,self.set_Y))
                if Z_res.readlines()[0][3:] == set_Z:
                    self.showing_set.config(text = "Результати обчислення Z збігаються")
                else:
                    self.showing_set.config(text = "Результати обчислення Z не збігаються")
            except:
                self.showing_set.config(text = "Результати обчислення Z не збігаються")


root = Tk()
root.title("Лабораторна №1")
One = window_1(root)

One.mainloop()
