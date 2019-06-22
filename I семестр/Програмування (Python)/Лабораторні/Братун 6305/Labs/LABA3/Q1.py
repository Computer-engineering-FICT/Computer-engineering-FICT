while True:
    stri = input('Введіть рядок : ')
    leng = str(len(stri))
    print('{0}-{1}'.format(stri, leng))
    print("""Якщо бажаєте продовжити то нажімть"Enter"
якщо хочете продовжити нажміть "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
