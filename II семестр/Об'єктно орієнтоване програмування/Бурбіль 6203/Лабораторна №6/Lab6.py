import operator
class Device(object):
    def __init__(self, price, power, e_radiation):
        self.price = price
        self.power = power
        self.e_radiation = e_radiation
        self.name = "Прилад"

    def __str__(self):
        return str(str("Прилад : {0}, Ціна : {1}$, Потужність : {2} ВТ, Електромагнітне випромінення : {3}".format(self.name, self.price, self.power, self.e_radiation)))

    def get_power(self):
        return self.power

    def get_e_radiation(self):
        return self.e_radiation

    def __getitem__(self, item):
        if item == 'price':
            return self.price
        elif item == 'power':
            return self.power
        elif item == 'e_radiation':
            return self.e_radiation
        else:
            return None


class Microwave(Device):
    def __init__(self, price, power, e_radiation):
        Device.__init__(self, price, power, e_radiation)
        self.name = "Мікрохвильовка"


class Washer(Device):
    def __init__(self, price, power, e_radiation):
        Device.__init__(self, price, power, e_radiation)
        self.name = "Пральна машина"


class Fridge(Device):
    def __init__(self, price, power, e_radiation):
        Device.__init__(self, price, power, e_radiation)
        self.name = "Холодильник"


class PC(Device):
    def __init__(self, price, power, e_radiation):
        Device.__init__(self, price, power, e_radiation)
        self.name = "ПК"


def comparator(param):
    return operator.attrgetter(param)

l = []


def get_power(l):
    power = 0
    for i in l:
        power += i.get_power()
    return power


def find_by_length(l, start, end):
    return [i for i in l if i.get_e_radiation() <= end and i.get_e_radiation() >= start]


