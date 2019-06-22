import random


class Month:
    """Class describes the month of the year"""

    months = {1: 'January', 2: 'February', 3: 'March', 4: 'April',
              5: 'May', 6: 'June', 7: 'July', 8: 'August',
              9: 'September', 10: 'October', 11: 'November', 12: 'December'}

    def __init__(self, number, year, option):
        """Number - number of the month.
        Option = 0 if you want to input the description of days manually.
        Else: type 1"""
        if number not in range(1, 13):
            raise ValueError
        self.number = number

        # Назва місяця
        self.name = Month.months[number]

        # Кількість днів
        if number in [1, 3, 5, 7, 8, 10, 12]:
            ndays = list(range(1, 32))
        elif number in [4, 6, 9, 11]:
            ndays = list(range(1, 31))
        elif number == 2:
            if year in range(0, 5000, 4):
                ndays = list(range(1, 30))
            else:
                ndays = list(range(1, 29))
        else: ndays = []
        self.ndays = ndays

        # Опис днів: 1 - випадково, 0 - вручну
        if option == 1:
            description_of_days = ['snowy', 'sunny', 'cloudy', 'rainy']
            days = dict.fromkeys(ndays)
            temp_l = [range(-15, -2), range(-14, 3), range(-7, 4), range(3, 15), range(12, 25), range(18, 28),
                      range(20, 33), range(20, 33), range(12, 29), range(3, 16), range(-3, 8), range(-7, -2)]
            temp = list(temp_l[number-1])

            if number in [12, 1, 2]:
                for key in days.keys():
                    days[key] = (random.choice(temp), random.choice(description_of_days[:3]))
            elif number == 3:
                for key in days.keys():
                    days[key] = (random.choice(temp), random.choice(description_of_days))
            else:
                for key in days.keys():
                    days[key] = (random.choice(temp), random.choice(description_of_days[1:]))

        elif option == 0:
            description_of_days = ['snowy', 'sunny', 'cloudy', 'rainy']
            days = dict.fromkeys(self.ndays)
            for key in days.keys():
                print('Day', key)
                temp = input('Average temperature = ')
                desc = int(input('Choose the description: snowy = 0, sunny = 1, cloudy = 2, rainy = 3\n'))
                if desc not in range(0, 4):
                    raise ValueError
                days[key] = (temp, description_of_days[desc])

        else: raise ValueError
        self.days = days

    def sunny_days(self):
        """Counts number of sunny days"""
        s = []
        for key in self.days:
            s.append(self.days[key][1])
        return 'In {} were {} sunny days'.format(self.name, s.count('sunny'))

    def cloudy_days(self):
        """Counts number of cloudy days"""
        s = []
        for key in self.days:
            s.append(self.days[key][1])
        return 'In {} were {} cloudy days'.format(self.name, s.count('cloudy'))

    def rainy_days(self):
        """Counts number of rainy days"""
        s = []
        for key in self.days:
            s.append(self.days[key][1])
        return 'In {} were {} rainy days'.format(self.name, s.count('rainy'))

    def snowy_days(self):
        """Counts number of snowy days"""
        s = []
        for key in self.days:
            s.append(self.days[key][1])
        return 'In {} were {} snowy days'.format(self.name, s.count('snowy'))

    def min_temperature(self):
        """Returns the lowest temperature of the month"""
        s = []
        for key in self.days:
            s.append(self.days[key][0])
        return 'The lowest temperature in {} was {}'.format(self.name, min(s))

    def max_temperature(self):
        """Returns the highest temperature of the month"""
        s = []
        for key in self.days:
            s.append(self.days[key][0])
        return 'The highest temperature in {} was {}'.format(self.name, max(s))

    def average_temperature(self):
        """Returns average temperature of the month"""
        s = []
        for key in self.days:
            s.append(self.days[key][0])
        return 'Average temperature in {} was {}'.format(self.name, round(sum(s)/len(s), 2))

    def full_description(self):
        """Full description of the month: name, number and characteristic of days,
        average temperature, highest and lowest temperature."""
        d = []; t = []
        for key in self.days:
            d.append(self.days[key][1])
            t.append(self.days[key][0])
        return 'In {} were {} days. Including {} sunny, {} cloudy, {} rainy, {} snowy.\n' \
               'Average temperature of the month: {}\n' \
               'The lowest temperature: {}\n' \
               'The highest temperature: {}\n'\
               .format(self.name, len(self.ndays), d.count('sunny'), d.count('cloudy'),
                       d.count('rainy'), d.count('snowy'), round(sum(t)/len(t), 2), min(t), max(t))

jan = Month(1, 2016, 1).full_description()
feb = Month(2, 2016, 1).full_description()
mar = Month(3, 2016, 1).full_description()
