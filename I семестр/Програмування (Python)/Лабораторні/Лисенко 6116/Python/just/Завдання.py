class Countries:
    d = {'Україна': ('Київ', 847, 2908, 603628), 'США': ('Вашингтон', 177, 601, 9826675),
         'Росія': ('Москва', 2510, 12197, 17098246), 'Франція': ('Париж', 105, 2244, 551695),
         'Греція': ('Афіни', 38, 664, 131990), 'Японія': ('Токіо', 2187, 13185, 377944)}

    def dict_out(self, a):
        a.insert(0, ('Країна', ('Столиця', 'Площа столиці', 'Населення столиці', 'Площа країни')))
        b = []
        for i in a:
            b.extend((i[0], i[1][0], i[1][1], i[1][2], i[1][3]))
        return ('{:<10}{:<10}{:<20}{:<25}{:<20}\n'*len(a)).format(*b)

    def country_range(self, a, b, c):
        e = list({i: self.d[i] for i in self.d if a <= self.d[i][c] <= b}.items())
        if not e == []:
            e.sort(key=lambda x: x[1][c], reverse=True)
            r = self.dict_out(e)
        else: r='none'
        return r

    def find_capital(self, a):
        for i in self.d:
            if self.d[i][0] == a:
                r = self.dict_out([(i, self.d[i]),])
                break
        else: r='none'
        return r

    def ration(self, a):
        for i in self.d:
            if self.d[i][0] == a or i == a:
                r = self.d[i][1]/self.d[i][3]
                break
        else: r='none'
        return r

a = Countries()
while True:
    do = input('-'*40+'\n'
               'Введіть число відповідне необхідній дії\n'
               '1 - Країни з заданим діапазоном населення у столиці\n'
               '2 - Країни з заданим діапазоном площі столиці\n'
               '3 - Відношення площі столиці до площі держави\n'
               '4 - Держава, до якої належить столиця\n'
               's - Зупинка програми\n')
    if do == 's': break
    elif do == '1':
        min,max=int(input('Введіть min: ')),int(input('Введіть max: '))
        print(a.country_range(min, max, 2))
    elif do == '2':
        min,max=int(input('Введіть min: ')),int(input('Введіть max: '))
        print(a.country_range(min, max, 1))
    elif do == '3':
        print(a.ration(input('Введіть назву столиці або країни: ')))
    elif do == '4':
        print(a.find_capital(input('Введіть назву столиці: ')))
