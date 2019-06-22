string = input("Введіть рядок з 11 символів:\n")
if len(string) == 11:
    string = bytearray(string, "cp1251")
    new = bytearray()
    new.append(string[0])
    for i in range(1, 11):
        if not (string[i] == b" "[0] and string[i-1] == b" "[0]):
            new.append(string[i])
    print("{}".format(new.decode(encoding="cp1251")))
#    string = string.split()
#    print(("{} "*len(string)).format(*string)[:-1])
else:
    print("{}".format("Рядок повинен складатися з 11 символів"))
