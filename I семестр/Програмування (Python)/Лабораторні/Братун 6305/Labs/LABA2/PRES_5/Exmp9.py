print("""Якою операційною системою вы
користуєтесь?
1 - Windows 10
2 - Windows 8
З - Windows 7
4 - Windows ХР
5 - Інша""")
os = input("Введіть відповідне число: ")
if os != "":
    if os == "1":
         print("Ви вибрали: Windows 10")
    elif os == "2":
         print("Bи вибрали: Windows 8")
    elif os == "3":
         print("Bи вибрали: Windows 7")
    elif os == "4":
         print ( "Ви вибрали: Windows XP")
    elif os == "5":
        print("Ви вибрали: інша")
    else:
        print("Мы не визначили вашу операційну систему")
else:
    print("Bи не ввели число")
