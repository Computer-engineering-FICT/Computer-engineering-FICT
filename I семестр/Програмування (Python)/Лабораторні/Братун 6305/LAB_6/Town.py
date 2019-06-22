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

    def print_me(self):
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
