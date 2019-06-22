import lab5

class Ministry:
    def __init__(self, name, shrt_name, telephone, email, surname):
        self.name = name
        self.shrt_name = shrt_name
        self.telephone = telephone
        self.email = email
        self. surname = surname
        def __str__(self):
            return str(self.name), str(self.telephone), str(self.shrt_name), str(self.email), str(self.surname)

short_min = ['Ministry_of_Agrarian_Policy', 'Ministry_of_Internal_Affairs', 'Ministry_of_Environmental_Protection',
             'Ministry_of_Economic_Development_and_Trade', 'Minenergugol', 'MZS', 'MIP','Mininfrastructure',
             'Minculture', 'Ministry_of_Minority of Life', 'Ministry_of_Defense', 'MES', 'MoH','Minregion',
             'Minsotspolitiki','Ministry_of_Finance', 'Ministry_of_Justice', 'MTOT']
globl_list = [i for i in list(zip(short_min, lab5.ministry, lab5.short_min, lab5.telephone, lab5.email, lab5.surname))]
# print(globl_list)

for name, val1, val2, val3, val4, val5 in globl_list:
    globals()[name] = Ministry(val1,val2, val3, val4, val5)
# print(Ministry_of_Agrarian_Policy.name)
# print(globals())

class Gov:
    def __init__(self, *gov):
        self.governments = list(gov)
    def addGov(self, gov):
        self.governments.append(gov)
    def showAll(self):
        for gov in self.governments:
            print(gov)
    def fullname(self):
        fullinput = input("Введите сокращенное название министерства: ")
        for i in self.governments:
            if fullinput == i.shrt_name:
                print("Полное название министерства: " + i.name)
    def fullname2(self):
        input2 = input("Введите фамилию министра: ")
        for i in self.governments:
            if input2 == i.surname:
                print("Данный министр работает в этом министерстве: " + i.name)
    def inf(self):
        input3 = input("Введите сокращенное название министерства: ")
        for i in self.governments:
            if input3 == i.shrt_name:
                print("Телефон министерства: " + i.telephone)
                print("E-mail министерства: " + i.email)
    def search(self):
        input4 = input("Найти все совпадения с: ")
        for i in self.governments:
            if input4 in i.name:
                print(i.name)


Government = Gov()
d = globals().copy()
# print(d)
for key in d:
    if key in short_min:
         Government.addGov(d[key])
# print(Government.governments[0].name)
# print(Government.governments[0].__dict__)
# Government.fullname()
# Government.fullname2()
# Government.inf()
# Government.search()
