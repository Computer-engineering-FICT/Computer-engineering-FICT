print("""Якою операційною системою вы користуєтесь?
1 - Windows 10
2 - Windows 8
З - Windows 7
4 - Windows ХР
5 - Інша""")
os = input("Введіть відповідне число: ")
if not os:
        print("Bи не ввели число")
else:
    if os == "1":
        print("Ви вибрали: Windows 10")
    else:
        if os == "2":
            print("Bи вибрали: Windows 8")
        else:
            if os == "3":
                print("Bи вибрали: Windows 7")
            else:
                if os == "4":
                    print ( "Ви вибрали: Windows XP")
                else:
                    if os == "5":
                        print("Ви вибрали: інша")
