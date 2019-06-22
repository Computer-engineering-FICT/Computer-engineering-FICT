import calendar, datetime, shelve, os
class Price:
    menu = {"Fire Grilled Cobb Salad": 10.99, "Chicken Caesar Salad": 10.29, "Roast chicken": 25.25,
            "Broiled Sirloin Tips": 14.99, "Mushroom Bleu Top Sirloin": 11.79, "Baked Schrod": 12.49,
            "Fresh Glazed Salmon": 12.99}
    sale = {0: 1, 1: 0, 2: 10, 3: 25, 4: 5, 5: 2, 6: 1}# 0 - "Monday", 1 - "Tuesday", ..., 6 - "Sunday"
    clients = ["Андрійчук", "Бандурін", "Бровченко", "Кожевніков", "Фащевський", "Фельдман", "Ханін"]
    dishes_cost = []
    total = 0
    def bill(self, order, day, person=None):
        for i in range(len(order)):
            self.dishes_cost.append(self.menu[order[i]])

        for i in range(len(order)):
            self.dishes_cost[i] -= self.dishes_cost[i]*self.sale[day] / 100

            if person in self.clients:
                self.dishes_cost[i] *= 0.9
        for i in range(len(order)):
            print("%s : %.2f" % (order[i], self.dishes_cost[i]))
            self.total += self.dishes_cost[i]
        print("Total : %.2f" % self.total)
first = Price()
order = []
new_dish = ""
number_of_dish = 1
for key in sorted(first.menu.keys()):
    print("%s. %s - %s" % (number_of_dish, key, first.menu[key]))
    number_of_dish += 1
print("Введіть stop  для зупинки вводу")
while new_dish.upper() != 'STOP':
    new_dish = (input('Name of dish: ')).lower().title()
    if new_dish.upper() == 'STOP':
        pass
    else:
        if new_dish in Price.menu:
            order.append(new_dish)
        else:
            print("ERROR")
now = datetime.datetime.now()
person = input('Last name of client: ').lower().title()
print("\n")
first.bill(order, calendar.weekday(now.year, now.month, now.day), person)














try:
    os.makedirs(r"C:\lab6")
except FileExistsError:
    print("Каталог lab6 уже існує")

db = shelve.open(r"C:\lab6\shelve")
db["obj1"] = first.menu
db["obj2"] = first.clients
db["obj3"] = first.sale
