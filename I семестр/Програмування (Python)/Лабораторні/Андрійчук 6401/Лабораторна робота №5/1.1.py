def get_key(d, value):
    """Отримання ключа словника за значенням (отриманий елемент видаляється
    зі словника, тому потрібно передавати змінну-копію )"""
    for k in d.keys():
        if d[k] == value:
            del d[k]
            return k
menu = {
    "Fire-Grilled Cobb Salad": 10.99,
    "Chicken Caesar Salad": 10.29,
    "Roast chicken": 25.25,
    "Broiled Sirloin Tips": 14.99,
    "Mushroom Bleu Top Sirloin": 11.79,
    "Baked Schrod": 12.49,
    "Fresh Glazed Salmon": 12.99
}

print("Введіть stop у \"Назву страви\" для зупинки вводу")
new_dish = ""
while new_dish.lower() != "stop":
    new_dish = str(input("Назва страви: "))
    if new_dish.lower() == "stop":
        pass
    else:
        price = float(input("Ціна страви"))
        menu[new_dish] = price

number_of_dish = 1
for key in sorted(menu.keys(),key=str.lower):
    print("%s. %s - %s" % (number_of_dish, key, menu[key]))
    number_of_dish += 1

print()
menu_copy = menu.copy()
items = list(menu_copy.values())
number_of_dish = 1
for item in sorted(items):
    print("%s. %s - %s" % (number_of_dish,get_key(menu_copy, item), item))
    number_of_dish += 1

import pickle
with open(r"C:\lab7\Andriuchuk\pickles.txt", "wb") as w:
        pickle.dump(menu, w)


