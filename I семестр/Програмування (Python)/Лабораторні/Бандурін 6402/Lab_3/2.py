def test(text):
    for i in range(len(text)):
        if text[i] != "0" and text[i] != "1":
            return True
        else:
            i=1
    if i==1:
        return False
while 1:
    text = input()

    if not text.isdigit():
        print("Ошибка! ")
    else:
        if test(text):
            print("Ошибка! Введите число в двоично коде!")
        else:
            break


m = int(text, 2)

print("Число {0} в десятичной системе исчесления равно {1}".format(text,m))

