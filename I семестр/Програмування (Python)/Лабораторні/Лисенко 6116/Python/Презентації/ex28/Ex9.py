a=int(input("Введіть дільник: "))
try:
    х = 10 / a   # Помилка ділення на 0
except ZeroDivisionError:
    print ( "Ділення на 0")
else:
    print("Спрацював блoк else")
finally:
    print("Спрацював блoк finally")
