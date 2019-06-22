class Town:

    name = ""


    def __init__(self, name, people, regions, universities, areas, location):
        self.name = name
        self.people = people
        self.regions = regions
        self.universities = universities
        self.areas = areas
        self.location = location

    def thickness(self):
        result = round((self.people / self.areas), 2)
        return result

    def Square_area(self):
        result = round((self.areas / self.regions), 2)
        return result

    def population_for_universities(self):
        result = round((self.people / self.universities), 2)
        return result

    def print_location(self):
        location_dirs = ['Північ', 'Південь', 'Схід', 'Захід']
        print("Географічне розташування".center(32))
        for i in range(len(location_dirs)):
            print(location_dirs[i], ' - ', self.location[i], "градусів")

    def print_inf(self):
        print("*"*35)
        print("Інформація про місто".center(25, ' '))
        print(self.name.center(25, ' '))
        print("Кількість мешканців:", self.people, "осіб")
        print("Площа:", self.areas, 'км^2')
        print("Кількість районів:", self.regions)
        print("Густота населення:", self.thickness(), "осіб/км^2")
        print("Середня площа району міста:", self.Square_area(), 'км^2')
        print("Кількість жителів на один ВНЗ:", self.population_for_universities())
        self.print_location()
        print("*"*35)


cities={"Kyivv": 2868702, "Kharkov": 1451132, "Odessa":1017022, "Dnipro":1065008,
             "Donetsk":1017022, "Zaporizhia":815256, "Lviv":732818, "KryvyiRih":668980,
             "Mykolaiv":514136, "Mariupol":492176, "Luhansk":463097, "Makiivka":389589,
             "Vinnytsia":356665, "Simferopol":343644, "Sevastopol":342451, "Kherson":328360,
             "Zvenyhorodka":19901, "Cherkasy":295414, "Chernihiv":304994, "Poltava":317998}
