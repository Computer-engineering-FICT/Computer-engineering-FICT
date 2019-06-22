string = input("Введіть рядок:\n")
if string:
    string = list(string)
    string.sort()
    print(("{}"*len(string)).format(*string))
else:
    print("{}".format("Ви не ввели рядок"))
