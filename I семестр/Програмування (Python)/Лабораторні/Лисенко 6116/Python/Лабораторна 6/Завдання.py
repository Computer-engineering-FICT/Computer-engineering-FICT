class Countries:
    """"Клас працює з словником, який має наступний формат:
    "країна": ("столиця", площа столиці, населення столиці, площа країни, населення країни) """
    d = {"Україна": ("Київ", 847, 2908, 603628, 42760),
         "США": ("Вашингтон", 177, 601, 9826675, 324883),
         "Росія": ("Москва", 2510, 12197, 17098246, 143500),
         "Франція": ("Париж", 105, 2244, 551695, 65073),
         "Греція": ("Афіни", 38, 664, 131990, 11305),
         "Японія": ("Токіо", 2187, 13185, 377944, 126434)}

    def dict_out(self, c):
        c.insert(0, ("Країна", ("Столиця", "Площа столиці(км^2)", "Населення столиці(тис.)",
                                "Площа країни(км^2)", "Населення країни(тис.)")))
        l = []
        for i in c:
            l.extend((i[0], i[1][3], i[1][4], i[1][0], i[1][1], i[1][2]))
        return ("{:<10}{:<20}{:<25}{:<10}{:<20}{:<25}\n"*len(c)).format(*l)

    def country_range(self, a, b, s):
        l = list({i: self.d[i] for i in self.d if a <= self.d[i][s] <= b}.items())
        if not l == []:
            l.sort(key=lambda x: x[1][s], reverse=True)
            return self.dict_out(l)
        return 'Not found'

    def find_capital(self, a):
        for i in self.d:
            if self.d[i][0] == a:
                return self.dict_out([(i, self.d[i]),])
        return "Not found"

    def ration(self, a):
        for i in self.d:
            if self.d[i][0] == a or i == a:
                return "{}км^2/{}км^2 = {:f}".format(self.d[i][1], self.d[i][3], self.d[i][1]/self.d[i][3])
        return "Not found"

    def interface(self):
        while True:
            do = input('-'*40+'\n'
                       'Введіть число відповідне необхідній дії\n'
                       '1 - Країни з заданим діапазоном населення у столиці\n'
                       '2 - Країни з заданим діапазоном площі столиці\n'
                       '3 - Відношення площі столиці до площі держави\n'
                       '4 - Держава, до якої належить столиця\n'
                       'Стоп - Зупинка програми\n')
            if do.lower() == "stop" or do.lower() == "стоп": break
            elif do == "1":
                min_num,max_num=int(input('Введіть мінімальну кількісь жителів(тис.): ')),int(input('та максимальну: '))
                print(self.country_range(min_num, max_num, 2))
            elif do == "2":
                min_sq, max_sq = int(input('Введіть мінімальну площу столиці(км^2): ')), int(input('та максимальну: '))
                print(self.country_range(min_sq, max_sq, 1))
            elif do == "3":
                print(self.ration(input("Введіть назву столиці або країни: ")))
            elif do == "4":
                print(self.find_capital(input("Введіть назву столиці: ").title()))

a = Countries()
a.interface()
