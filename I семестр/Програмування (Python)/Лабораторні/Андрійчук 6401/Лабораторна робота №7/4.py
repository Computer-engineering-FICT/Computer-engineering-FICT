import pickle, os, shutil
try:
    os.makedirs(r"C:\lab5")
    shutil.move(r"C:\lab7\Andriuchuk\pickles.txt", r"C:\lab5")
except FileExistsError:
    print("Каталог lab5 v pickles уже існує")
with open(r"C:\lab5\pickles.txt", "rb")as f:
    menu = pickle.load(f)
print(menu)

print("Введіть stop у \"Назву страви\" для зупинки вводу")
new_dish = ""
while new_dish.lower() != "stop":
    new_dish = str(input("Назва страви: "))
    if new_dish.lower() == "stop":
        pass
    else:
        price = float(input("Ціна страви"))
        menu[new_dish] = price

with open(r"C:\lab5\pickles2.txt", "wb") as w:
        pickle.dump(menu, w)


