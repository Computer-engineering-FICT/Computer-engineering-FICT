def download_data():
    new_points = {}
    new_graphs = {}
    new_colors = []
    '''Задается смещение для графов, которое будет использоваться при прорисовке линий относительно 
    координат точек. Значение j зависит от количества графов. Если графов 8, то значения смещений должны
    быть приблизительно такими: -6, -4, -2, 0, 2, 4, 6, 8'''
    new_offset = {}
    for line in open('points.txt'):
        line = line.split('\n') # результат - ['данные', '']
        line = line[0] # изымаем строку данных
        line = line.split(' ') # получаем ['имя', 'x', 'y']
        line[1] = int(line[1])
        line[2] = int(line[2]) # результат ['имя', x, y]
        new_points[line[0]] = line[1:] # добавляем в словарь один элемент - 'имя': [x, y]
    for line in open('graphs.txt'):
        line = line.split('\n')
        line = line[0]
        line = line.split(' ')
        new_graphs[line[0]] = line[1:]  # добавляем в словарь один элемент - 'имя графа': ['список имен точек', ]
        new_colors.append(line[0]) # цвета нужны для нижних цветных кнопок
    j = -6
    for i in new_graphs:
        new_offset[i] = j
        j += 2
    return new_points, new_graphs, new_colors, new_offset
 
##################################
def process_search(event):
    w.draw_points() # очистка экрана
    point1 = w.ent_point_1.get()
    point2 = w.ent_point_2.get()
    if not point1 or not point2: # выход из функции, если в полях отсутствуют данные
        return
    # красные квадраты вокруг указанных точек. Удобство для навигации по рисунку.
    w.canvas.create_rectangle(points[point1][0]-10,points[point1][1]-10,points[point1][0]+10,points[point1][1]+10,outline="red")
    w.canvas.create_rectangle(points[point2][0]-10,points[point2][1]-10,points[point2][0]+10,points[point2][1]+10,outline="red")
 
    def direct_paths(): # возвращает список имен графов, которые содержат обе точки сразу, и текст для метки
        list_direct_paths = []
        str_direct_paths='' 
        for i in graphs:
            if (point1 in graphs[i]) and (point2 in graphs[i]):
                list_direct_paths.append(i)
        for i in list_direct_paths:
            str_direct_paths += i +';\n'
        return list_direct_paths, str_direct_paths
    #################
    def cross_paths(): 
        '''Возвращает словарь и строку для метки. Элемент словаря - 'пара графов': ['общие точки', ].
        В паре графов первый граф содержит первуют указанную точку, второй - вторую.'''
        list_pairs_paths = {}
        str_pairs_paths = ''
        point1_paths = []  # пути, содержащие только первую точку
        point2_paths = []  # пути, содержащие только вторую точку
        for i in graphs:
            if not(i in list_direct_paths): # если путь не содержит обе точки
                if point1 in graphs[i]:
                    point1_paths.append(i)
                elif point2 in graphs[i]:
                    point2_paths.append(i)
        for i in point1_paths: # каждый путь среди путей, содержащих только первую точку
            for j in point2_paths: # перебрать со всеми путями, содержащими только вторую точку
                list1 = graphs[i] # извлечь точки графа i
                list2 = graphs[j] # извлечь точки графа j
                set1 = set(list1) # преобразование во множество
                set2 = set(list2)
                intersect = set1 & set2 # пересечение множеств - общие точки
                if intersect: # если общие точки есть, то
                    list_key = i + ' ' + j # сформировать ключ элемента словаря их имен графов
                    list_points = list(intersect) # преобразовать множество в список
                    list_pairs_paths[list_key] = list_points # добавить элемент - 'пара графов': ['общие точки', ] - в словарь.
        for i in list_pairs_paths:
            str_pairs_paths += i + str(list_pairs_paths[i]) + ';\n'
        return list_pairs_paths, str_pairs_paths
    #################
    def shortest_path(list_paths): # поиск кратчайшего пути
        # в обоих поисках при равном количестве точек указывается только один путь
        if type(list_paths) == type([]): # если есть список прямых путей, а не словарь пар, то все проще
            short = list_paths[0] # предполагаем, что самый корокий - первый путь
            for i in list_paths[1:]: # перебираем все остальные графы в списке
                # если в списке точек очередного графа разница между первой и второй из указанных точек
                # меньше, чем разница в графе, хранимом в переменной short, то обновить short.
                if abs(graphs[i].index(point1)-graphs[i].index(point2)) < abs(graphs[short].index(point1)-graphs[short].index(point2)):
                    short = i
            w.lab_shortest_display.config(text=short)
        else:
            short = '' # здесь хранится имя (пара имен графов) кратчайшего пути
            length = 100 # длина пути
            for i in list_paths: # перебираем каждый элемент словаря
                pair_paths = i.split() # список пары, имеющей общие точки
                common_points = list_paths[i] # общие точки
                points_first_path = graphs[pair_paths[0]] # список точек первого графа
                points_second_path = graphs[pair_paths[1]] # список точек второго графа                
                """Алгоритм не совсем верен, из него бывают исключения, если графы имеют общие точки 
                не подряд (пересекаются в разных местах). 
                Ищется точка первого пути из общих точек, которая ближе всего расположена к 
                первой из указанных точек. Тоже самое для второго пути и второй точки.
                Находится сумма общих точек + точек первого пути до общих + второго пути до общих."""
                second_points_first_path = common_points[0] # ближайшая из общих
                for j in common_points[1:]:
                    # расстояние от первой точки до очередной сравнивается с расстоянием
                    # от точки, которая уже сохранена до первой точки
                    if ( abs(points_first_path.index(j) - points_first_path.index(point1)) < 
                        abs(points_first_path.index(second_points_first_path) - points_first_path.index(point1)) ):
                        second_points_first_path = j
                second_points_second_path = common_points[0]
                for j in common_points[1:]:
                    if ( abs(points_second_path.index(j) - points_second_path.index(point2)) < 
                        abs(points_second_path.index(second_points_second_path) - points_second_path.index(point2)) ):
                        second_points_second_path = j
                l = abs(points_first_path.index(second_points_first_path) - points_first_path.index(point1)) + abs(points_second_path.index(second_points_second_path) - points_second_path.index(point2)) + len(common_points)
                if length > l:
                    length = l
                    short = i
            w.lab_shortest_display.config(text=short)
 
    #################
    list_direct_paths, str_direct_paths = direct_paths()
    for i in list_direct_paths:
        w.draw_path(i, point1, point2)
    w.lab_paths_display.config(text=str_direct_paths)    
 
    list_pairs_paths, str_pairs_paths= cross_paths()
    for i in list_pairs_paths:
        pair_paths = i.split() # список пары, имеющей общие точки
        common_points = list_pairs_paths[i] # общие точки
        points_first_path = graphs[pair_paths[0]] # список точек первого графа
        points_second_path = graphs[pair_paths[1]] # список точек второго графа
        '''Надо определить откуда и докуда рисовать путь для каждого графа. Для первого графа: от первой точки, 
        указанной пользователем, до самой отдаленной от нее из списка общих точек. Как вычислить самую отдаленную?
        Находить модуль разницы между первой точкой и каждой точкой в списке общих точек. Наибольший модуль и 
        точку, которая его дала, запоминать в одтдельных переменных.
        То же самое сделать для второй точки.'''
        second_points_first_path = common_points[0]
        for j in common_points[1:]:
            if ( abs(points_first_path.index(j) - points_first_path.index(point1)) > 
                abs(points_first_path.index(second_points_first_path) - points_first_path.index(point1)) ):
                second_points_first_path = j
        second_points_second_path = common_points[0]
        for j in common_points[1:]:
            if ( abs(points_second_path.index(j) - points_second_path.index(point2)) > 
                abs(points_second_path.index(second_points_second_path) - points_second_path.index(point2)) ):
                second_points_second_path = j
        w.draw_path(pair_paths[0], point1, second_points_first_path)
        w.draw_path(pair_paths[1], point2, second_points_second_path)
    w.lab_two_paths_display.config(text=str_pairs_paths)
 
    if list_direct_paths:
        shortest_path(list_direct_paths)
    elif list_pairs_paths:
        shortest_path(list_pairs_paths)
 
#################################################
class Interface():
    def __init__(self, parent):
        parent.title("Search of paths")
        self.canvas = Canvas(parent,width=600,height=480,bg="white")
        self.lab_point_1 = Label(parent,text="First point:")
        self.ent_point_1 = Entry(parent,width=2)        
        self.lab_point_2 = Label(parent,text="Second point:")
        self.ent_point_2 = Entry(parent,width=2)        
        self.ent_point_1.bind('<KeyRelease>', lambda *a: self.update_entry(self.ent_point_1))
        self.ent_point_2.bind('<KeyRelease>', lambda *a: self.update_entry(self.ent_point_2))       
        self.but_paths = Button(parent,text="Show paths", width=15)
        self.lab_paths = Label(parent, text="Paths with two points")
        self.lab_paths_display = Label(parent, width=20, height=3,  bg = "white")
        self.lab_two_paths = Label(parent, text="Pairs of paths, each\ncontaining one point and\nintersect with each other")
        self.lab_two_paths_display = Label(parent, width=20, height=5, bg = "white")
        self.lab_shortest = Label(parent, text="The shortest path")
        self.lab_shortest_display = Label(parent, width=20, bg = "white")
        self.lab_graphs = Label(parent, text="Graphs")
        self.but_1 = Button(parent, width=1, bg=colors[0], activebackground=colors[0], command=lambda: self.draw_path(colors[0], graphs[colors[0]][0], graphs[colors[0]][-1]))
        self.but_2 = Button(parent, width=1, bg=colors[1], activebackground=colors[1], command=lambda: self.draw_path(colors[1], graphs[colors[1]][0], graphs[colors[1]][-1]))
        self.but_3 = Button(parent, width=1, bg=colors[2], activebackground=colors[2], command=lambda: self.draw_path(colors[2], graphs[colors[2]][0], graphs[colors[2]][-1]))
        self.but_4 = Button(parent, width=1, bg=colors[3], activebackground=colors[3], command=lambda: self.draw_path(colors[3], graphs[colors[3]][0], graphs[colors[3]][-1]))
        self.but_5 = Button(parent, width=1, bg=colors[4], activebackground=colors[4], command=lambda: self.draw_path(colors[4], graphs[colors[4]][0], graphs[colors[4]][-1]))
        self.but_6 = Button(parent, width=1, bg=colors[5], activebackground=colors[5], command=lambda: self.draw_path(colors[5], graphs[colors[5]][0], graphs[colors[5]][-1]))
        self.but_7 = Button(parent, width=1, bg=colors[6], activebackground=colors[6], command=lambda: self.draw_path(colors[6], graphs[colors[6]][0], graphs[colors[6]][-1]))
        self.but_8 = Button(parent, width=1, bg=colors[7], activebackground=colors[7], command=lambda: self.draw_path(colors[7], graphs[colors[7]][0], graphs[colors[7]][-1]))
        self.but_9 = Button(parent, width=1, bg=colors[8], activebackground=colors[8], command=lambda: self.draw_path(colors[8], graphs[colors[8]][0], graphs[colors[8]][-1]))
        self.but_all = Button(parent, width=1, text="del", bg="white", activebackground="white", command=self.draw_points)    
        self.but_help = Button(parent, bitmap="questhead", command=self.help_window)
        self.make_grid()
    def make_grid(self):
        self.canvas.grid(row=0,column=0,rowspan=12)
        self.lab_point_1.grid(row=0, column=1, columnspan=3, sticky=E)
        self.ent_point_1.grid(row=0, column=4, columnspan=1, sticky=W)
        self.lab_point_2.grid(row=1, column=1, columnspan=3, sticky=E)
        self.ent_point_2.grid(row=1, column=4, columnspan=2, sticky=W)
        self.but_paths.grid(row=2, column=1, columnspan=5)
        self.lab_paths.grid(row=3, column=1, columnspan=5, sticky=S)
        self.lab_paths_display.grid(row=4, column=1, columnspan=5, sticky=N)
        self.lab_two_paths.grid(row=5, column=1, columnspan=5, sticky=S)
        self.lab_two_paths_display.grid(row=6, column=1, columnspan=5, sticky=N)
        self.lab_shortest.grid(row=7, column=1, columnspan=5, sticky=S)
        self.lab_shortest_display.grid(row=8, column=1, columnspan=5, sticky=N)
        self.lab_graphs.grid(row=9, column=1, columnspan=5, sticky=S)
        self.but_1.grid(row=10, column=1, sticky=S)
        self.but_2.grid(row=10, column=2, sticky=S)
        self.but_3.grid(row=10, column=3, sticky=S)
        self.but_4.grid(row=10, column=4, sticky=S)
        self.but_5.grid(row=10, column=5, sticky=S)
        self.but_6.grid(row=11, column=1, sticky=N)
        self.but_7.grid(row=11, column=2, sticky=N)
        self.but_8.grid(row=11, column=3, sticky=N)
        self.but_9.grid(row=11, column=4, sticky=N)
        self.but_all.grid(row=11, column=5, sticky=N)
        self.but_help.grid(row=0, column=5, sticky=E+N)
    def update_entry(self, obj): # позволяет вводить в поле только один символ, входящий в допустимый диапазон
        s = obj.get() # то, что введено в поле
        s = s[-1] if s else '' # если в s что-то есть, то присвоить последний символ, если нет, то пустую строку
        obj.delete('0',END) # очистить поле
        if  'a'<= s <= 'z':        
            obj.insert(INSERT,s) # вставить содержимое s
    def draw_points(self):
        self.canvas.delete('all')
        for i in points:
            coords = points[i]
            x = coords[0]
            y = coords[1]
            self.canvas.create_rectangle(x,y,x+5,y+5,fill="black")
            self.canvas.create_text(x-5,y-5,text=i)
    def draw_path(self, pathname, point1, point2): # (имя графа, точка1, точка2)
        '''Рисует путь от точки1 до точки2 для графа pathname'''
        list_points = graphs[pathname] # список точек
        index1 = list_points.index(point1) # индекс указанных точек
        index2 = list_points.index(point2)
        if index1 > index2: # если первая точка расположена дальше, чем вторая, то
            a = index1          # первая становится второй, а вторая первой.
            index1=index2
            index2=a
        ofs = offset[pathname] # каково смещение для данного графа
        while index1 < index2: # перебирая все точки от первой до второй, рисуем линии по координатам точек
            # словарь_точек[точка_из_списка_точек_графа][координата]
            self.canvas.create_line(points[list_points[index1]][0]+ofs, points[list_points[index1]][1]+ofs,
                                                points[list_points[index1+1]][0]+ofs, points[list_points[index1+1]][1]+ofs,
                                                fill=pathname, width=2)
            index1 += 1
    def help_window(self):
        wah = Toplevel()
        wah.title('About&Help')
        wah.geometry('+600+250')
        wah.resizable(False,False)
        help_title = "Описание программы:"
        help_string ="""Программа позволяет найти возможные пути от одной точки до другой.\n\
Описание графов (название и список точек, через которые он проходит)\n\
содержится в файле graphs.txt и загружается в момент запуска программы.\n\
Как выглядят все графы можно посмотреть с помощью цветных кнопок в\n\
нижнем правом углу окна программы.\n\
Для того, чтобы посмотреть, через какие графы можно попасть из одной\n\
точки в другую, следует ввести в текстовые строки название точек и\n\
нажать кнопку \"Show paths\". В отдельных метках будут показаны:\n\
- прямые пути, содержащие обе введенные точки;\n\
- пары путей, где первый граф пары содержит первую точку, второй -\n\
вторую точку, и оба графа имеют общие точки, т.е. пересекаются;\n\
- кратчайший путь из указанных выше. Выбирается их прямых путей при\n\
их наличии. Иначе выбор осуществляется среди пар путей."""
        about_title = "О программе:"
        about_string = """Программа "Search of paths" подготовлена для ученического проекта.\n\
Авторы:\n\
- код и алгоритмы - Светлана Шапошникова (<a href="http://pythoner.name" title="http://pythoner.name">http://pythoner.name</a>),\n\
- идея - Иван Пашков.\n\
Программа распространяется по условиям GNU General Public License.\n\
Примечание. Существует другая версия программы, разработанная\n\
И. Пашковым на основе данной и адаптированная к транспортной системе\n\
города."""
        Label(wah, text=help_title, font='Times 14', fg='darkblue').grid(row=0, column=0, sticky=W, padx=5)
        Label(wah, text =help_string, justify=LEFT).grid(row=1, column=0, sticky=W, padx=20)
        Label(wah, text=about_title, font='Times 14', fg='darkblue').grid(row=2, column=0, sticky=W, padx=5)
        Label(wah, text =about_string, justify=LEFT).grid(row=3, column=0, sticky=W, padx=20)
        Frame(wah, height=20).grid(row=4, column=0)
        wah.focus_set()
        wah.grab_set()
        wah.wait_window()
#################################################
from tkinter import * #from random import random #from tkinter.ttk import *
points, graphs, colors, offset = download_data() # точки {'точка': [координаты], }, графы {'имя': ['точки', ], }, цвета ['цвет', ],  смещение {'имя': число, }
window = Tk()
w = Interface(window) # интерфейс
w.draw_points() # точки на холсте
w.but_paths.bind('<Button-1>', process_search) # запуск процесса поиска
w.but_paths.bind('<Return>', process_search)
window.mainloop()
