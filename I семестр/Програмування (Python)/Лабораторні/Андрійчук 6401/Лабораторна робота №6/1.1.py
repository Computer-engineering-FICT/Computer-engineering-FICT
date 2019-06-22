import calendar, datetime
class Price:
    menu = {"Fire-Grilled Cobb Salad": 10.99, "Chicken Caesar Salad": 10.29, "Roast chicken": 25.25,
            "Broiled Sirloin Tips": 14.99, "Mushroom Bleu Top Sirloin": 11.79, "Baked Schrod": 12.49,
            "Fresh Glazed Salmon": 12.99}
    sale = {'Monday': 1, 'Tuesday': 0, 'Wednesday': 10, 'Thirsday': 25, 'Friday': 5, "Saturday": 2, 'Sunday': 1}
    clients = ["Андрійчук", "Бандурін", "Бровченко", "Кожевніков", "Фащевський", "Фельдман", "Ханін"]
    dishes_cost = []
    total = 0
    def bill(self, order, day, person):
        for i in range(len(order)):
            self.dishes_cost.append(self.menu[order[i]])

        for i in range(len(order)):
            self.dishes_cost[i] -= self.dishes_cost[i]*self.sale[day] / 100

            if person in self.clients:
                self.dishes_cost[i] *= 0.9
        for i in range(len(order)):
            print("%s : %s" % (order[i], self.dishes_cost[i]))
            self.total += self.dishes_cost[i]
        print("Total : %s" % self.total)
first = Price()
order = []
new_dish = ""

def weekday():
    if calendar.weekday(now.year, now.month, now.day) is 0:
        return "Monday"
    elif calendar.weekday(now.year, now.month, now.day) is 1:
        return "Tuesday"
    elif calendar.weekday(now.year, now.month, now.day) is 2:
        return "Wednesday"
    elif calendar.weekday(now.year, now.month, now.day) is 3:
        return "Thursday"
    elif calendar.weekday(now.year, now.month, now.day) is 4:
        return "Friday"
    elif calendar.weekday(now.year, now.month, now.day) is 5:
        return "Saturday"
    else:
        return "Sunday"

print("Введіть stop  для зупинки вводу")
while new_dish.upper() != 'STOP':
    new_dish = (input('Name of dish: '))
    if new_dish.upper() == 'STOP':
        pass
    else:
        if new_dish in Price.menu:
            order.append(new_dish)
        else:
            print("Out of stock")
now = datetime.datetime.now()

person = input('Last name of client: ')

first_bill = first.bill(order, weekday(), person)
