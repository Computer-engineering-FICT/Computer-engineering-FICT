print("""Якою операційною системою ви
користуєтесь?
1 - Windows 10
2 - Windows 8
3 - Windows 7
4 - Windows ХР
5 - Інша""")
os = input("Введіть відповідне число: ")
if os == "1":
        print("Ви вибрали: Windows 10")
elif os == "2":
        print("Ви вибрали: Windows 8")
elif os == "3":
        print("Ви вибрали: Windows 7")
elif os == "4":
         print("Ви вибрали: Windows XP")
elif os == "5":
         print("Ви вибрали: інша")
elif not os:
         print("Ви не ввели число")
else:
         print("Ми не визначили вашу операційну систему")
