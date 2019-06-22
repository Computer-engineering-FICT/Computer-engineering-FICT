try:   # Опрацьовуємо виключення
    try: # Вкладений обробник
        x = 1 / 0 # Помилка: ділення на 0
    except NameError:
        print("Невизначений ідентифікатор")
    except IndexError:
        print("Неіснуючий індекс")
    print("Вираз після вкладеного обробника")
except ZeroDivisionError:
    print("Опрацювання ділення на 0")
x = 0
print(x) # виведе: 0
